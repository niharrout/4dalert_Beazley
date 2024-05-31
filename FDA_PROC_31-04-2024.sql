CREATE TABLE IF NOT EXISTS fda."FDADataQualityMasterRuleObjectColumns"
(
    "FDADataQualityMasterRuleObjectColumnsId" BIGSERIAL,
    "FDADataQualityRulesId" bigint,
    "FDASystemsId" bigint,
    "FDASystemObjectsId" bigint,
    "FDASystemObjectFieldsId" bigint,
    "TestRuleInd" character varying(10),
    "CreatedBy" character varying(100),
    "CreationOn" character varying(100)
)
-----------------------------------------------------------
INSERT INTO fda."FDADataQualityMasterRuleObjectColumns"(   
   "FDADataQualityRulesId", 
    "FDASystemsId",
    "FDASystemObjectsId", 
    "FDASystemObjectFieldsId", 
    "CreatedBy", 
    "CreatedOn")    
SELECT "MasterRuleId", 
        "FDASystemsId",
        "FDASystemObjectsId",  
         "FDASystemObjectFieldsId",
         "CreatedBy", 
         "CreationDate"
    FROM fda."FDASystemObjectFields" WHERE "MasterRuleId">0;
---------------------------------------------------------------
ALTER TABLE fda."FDASystemObjectFields" RENAME "MasterRuleName" TO "MasterRuleName_Deprecated";
ALTER TABLE fda."FDASystemObjectFields" RENAME "MasterRuleId" TO "MasterRuleName_Deprecated";
ALTER TABLE fda."FDASystemObjectFields" RENAME "TestRuleInd" TO "TestRuleInd_Deprecated";
--------------------------------------------------------------
ALTER TABLE fda."FDAObjectFieldsOutlierData"
ADD "MasterRuleId" BIGINT;
------------------------------------------------------------------
DELETE FROM fda."FDAReconCICDConfig"
WHERE "ConfigType" = 'CICD'
AND "SystemType" ='SnowFlake'
AND "Param3" = 'External Table';
------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fda."Proc_ListFDAObjectScoreTrend"(
	"InOffSet" bigint,
	"InLimit" bigint,
	"InOrderByColumn" character varying,
	"InOrderBy" character varying,
	"InObjectId" character varying,
	"InObjectScoreId" character varying,
	"InObjectName" character varying,
	"InRowCount" character varying,
	"InAvgNullCount" character varying,
	"InNullCountPercent" character varying,
	"InAvgDistinctCount" character varying,
	"InDistinctCountPercent" character varying,
	"InLastUpdatedOn" character varying,
	refcursor,
	refcursor,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
DECLARE "OutTotalRecordCount" BIGINT;
DECLARE "SelectString" TEXT;
        "FromString" TEXT;
        "WhereConditionString" TEXT;
		"SelectString2" TEXT;
		"SelectCountString" TEXT;
		"TotalRowCount" BIGINT;
		"lvInd1" VARCHAR(5)='N';
		"OrderByString" TEXT;
		"lvLatestObjectScoreId" BIGINT;
		
		"lvRuleType" TEXT;
		"lvGreyDate" TEXT;
		"lvRuleCount" int;
		"lvCounter" int;
		"RuleName" text;
		"RuleData" text;
		
		"SelectStringAdv" TEXT;
		"lvPYRules" TEXT;
BEGIN

"InRowCount" := LOWER("InRowCount");
"InAvgNullCount" := LOWER("InAvgNullCount");
"InNullCountPercent" := LOWER("InNullCountPercent");
"InAvgDistinctCount" := LOWER("InAvgDistinctCount");
"InDistinctCountPercent" := LOWER("InDistinctCountPercent");
"InLastUpdatedOn" := LOWER("InLastUpdatedOn");

"RuleData" := '';
"lvCounter" := 1;
-----------------TAKING MIN DATE FOR GREY CELL COLOR------------------------------
/*SELECT 
	MIN(SUBSTRING("CreatedOn",0,11))
INTO "lvGreyDate"
FROM(SELECT 
	(CASE WHEN "RuleType" IN ('Enumerated Value','Date Range','Length Check') AND ("LeftFieldValue" > '' AND "RightFieldValue" > '') THEN
			(CASE WHEN "RuleType" = 'Date Range' THEN 'Date'||' '||"RuleType" 
			 	WHEN "RuleType" = 'Length Check'  THEN 'Date'||' '||"RuleType" 
			 ELSE "RuleType" END)
		WHEN "RuleType" IN ('DataType Check','Blank/NonBlank','Permitted Value','Null Check','Forbidden Value','Distinct Check','Enumerated Value(Query)','User Criteria') AND "LeftFieldValue" > '' THEN 
			(CASE WHEN "RuleType" IN ('DataType Check') AND "LeftFieldValue" IN ('Zip Code','Email') THEN "LeftFieldValue" ||' '||"RuleType" 
				WHEN "RuleType" IN ('DataType Check') AND "LeftFieldValue" IN ('Valid Number') THEN 'Numeric DataType Check'
				WHEN "RuleType" IN ('DataType Check') AND "LeftFieldValue" IN ('Valid Integer') THEN 'DataType Check'
				WHEN "RuleType" IN ('DataType Check') AND "LeftFieldValue" NOT IN ('Zip Code','Email','Valid Number') THEN 'Date'||' '||"RuleType"  
			 	WHEN "RuleType" IN ('Enumerated Value(Query)','Distinct Check','Permitted Value') THEN 'Date'||' '||"RuleType"
			 	ELSE  "RuleType" END )
		WHEN "RuleType" IN ('Possible Character','Range of Values') AND ("LeftFieldValue" > '' OR "RightFieldValue" > '') 
			THEN "RuleType"
	 END)"RuleType" ,
	 c."CreatedOn"
FROM fda."FDASystemObjects" a
INNER JOIN fda."FDASystemObjectFields" b
	ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
	AND a."FDASystemsId" = b."FDASystemsId"
INNER JOIN fda."FDADataQualityMasterRulesDetails" c
	ON b."MasterRuleId" = c."FDADataQualityRulesId"
WHERE a."FDASystemObjectsId" = "InObjectId" :: BIGINT
AND b."AutoMetricsInd" = 'true')b
WHERE "RuleType" IS NOT NULL;
*/

SELECT 
	STRING_AGG("RuleType",',')
INTO "lvPYRules"
FROM(
		SELECT DISTINCT 
				d."FDADataQualityRulesId"||'-'||d."RuleName" AS "RuleType"
		FROM fda."FDASystemObjectFields" b
		INNER JOIN fda."FDADataQualityMasterRuleObjectColumns" c
			ON b."FDASystemObjectFieldsId" = c."FDASystemObjectFieldsId"
			AND b."FDASystemObjectsId" = c."FDASystemObjectsId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON c."FDADataQualityRulesId" = d."FDADataQualityRulesId"
		WHERE b."FDASystemObjectsId" = "InObjectId":: BIGINT
		AND b."AutoMetricsInd" = 'true'
)x
WHERE "RuleType" IS NOT NULL;

--------------------------------DYNAMIC RULE FORMING------------------------------
SELECT 
	STRING_AGG("RuleType",',') AS "RuleType",
	COUNT("RuleType")
INTO "lvRuleType","lvRuleCount"
FROM (SELECT 
		"MasterRuleId"||'-'||"RuleType" AS "RuleType"
	FROM(SELECT DISTINCT 
				d."RuleName" as "RuleType",d."FDADataQualityRulesId" as "MasterRuleId"
		FROM fda."FDASystemObjectFields" b
		INNER JOIN fda."FDADataQualityMasterRuleObjectColumns" c
			ON b."FDASystemObjectFieldsId" = c."FDASystemObjectFieldsId"
			AND b."FDASystemObjectsId" = c."FDASystemObjectsId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON c."FDADataQualityRulesId" = d."FDADataQualityRulesId"
		WHERE b."FDASystemObjectsId" = "InObjectId":: BIGINT
		AND b."AutoMetricsInd" = 'true'
		)x
	--WHERE x."RuleType" IS NOT NULL
	UNION
	SELECT DISTINCT
		"MasterRuleId"||'-'||a."RuleName" AS "RuleType"
	FROM fda."FDAObjectScoreOutlierCountByCategory" a
	INNER JOIN(SELECT 
		"FDAObjectScoreValueId"
	FROM fda."FDAObjectsScoreValue" a
	INNER JOIN fda."FDASystemObjects" b
	ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
	WHERE a."FDAObjectScoreValueId" <= "InObjectScoreId":: BIGINT
	AND a."FDASystemObjectsId" = "InObjectId":: BIGINT
	ORDER BY a."CreatedDateTime" DESC 
	limit 15)b
	ON a."FDAObjectScoreId" = b."FDAObjectScoreValueId"
)x
WHERE "RuleType" IS NOT NULL;

--raise notice 'Value: % ',"V_lvQuerySelect";
RAISE NOTICE 'OUT SIDE_LOOP: % ',"lvRuleCount";
RAISE NOTICE 'OUT SIDE_LOOP: % ',"lvRuleType";

IF (SELECT "AdvanceScoreInd" FROM  fda."FDASystemObjects" WHERE "FDASystemObjectsId" = "InObjectId" :: INT) = 'true' THEN 

"SelectStringAdv" := CONCAT(' TO_CHAR(COALESCE(a."AvgNullCount",0),''fm999G999G999G999G999'') "AvgNullCount",
	   COALESCE(a."AvgNullCountOutlierInd",''N'') "NullCountOutlierInd",
	   
	   (CASE WHEN COALESCE(CAST(a."NullCountPercent" AS DECIMAL(18,2)),0.0) > 0 THEN 
		TO_CHAR(COALESCE(CAST(a."NullCountPercent" AS DECIMAL(18,2)),0.0),''fm999G999G999G999G999D00'')
		ELSE ''0.0'' END) "NullCountPercent",
	   
	   COALESCE(a."NullCountPercentOutlierInd",''N'') "NullCountPercentOutlierInd",
	   TO_CHAR(COALESCE(a."AvgDistinctCount",0),''fm999G999G999G999G999'') "AvgDistinctCount",
	   COALESCE(a."AvgDistinctCountOutlierInd",''N'') "DistinctCountOutlierInd",
	   
	   (CASE WHEN COALESCE(CAST(a."DistinctCountPercent" AS DECIMAL(18,2)),0.0) > 0 THEN 
		TO_CHAR(COALESCE(CAST(a."DistinctCountPercent" AS DECIMAL(18,2)),0.0),''fm999G999G999G999G999D00'')
		ELSE ''0.0'' END) "DistinctCountPercent",
	   
	   COALESCE(a."DistinctCountPercentOutlierInd",''N'') "DistinctCountPercentOutlierInd", ');
END IF;

WHILE "lvCounter" <= "lvRuleCount"
LOOP
	RAISE NOTICE 'lvCounter: %',"lvCounter";
	RAISE NOTICE 'lvRuleCount: %',"lvRuleCount";
	RAISE NOTICE 'lvRuleType: % ',SPLIT_PART("lvRuleType",',',"lvCounter");
	
	"RuleName":=CONCAT('fda."fn_OutlierCountByRule"(''',SPLIT_PART("lvRuleType",',',"lvCounter"),''',a."FDAObjectScoreValueId") AS "',SPLIT_PART("lvRuleType",',',"lvCounter"),'",
				(CASE WHEN  fda."fn_OutlierCountByRule"(''',SPLIT_PART("lvRuleType",',',"lvCounter"),''',a."FDAObjectScoreValueId") > 0  AND (''',SPLIT_PART("lvRuleType",',',"lvCounter"),''') = ANY(STRING_TO_ARRAY(''',"lvPYRules",''','',''))::text = ''false''  THEN ''GREY''
				ELSE fda."fn_OutlierColorByRuletrendInc"(''Object'',''',SPLIT_PART("lvRuleType",',',"lvCounter"),''',a."FDAObjectScoreValueId",''',"InObjectId",''')  END) AS "', SPLIT_PART("lvRuleType",',',"lvCounter"),' Color"') ;
	IF "lvCounter" < "lvRuleCount" 
	THEN 
		RAISE NOTICE 'FROM IF: %',"lvCounter";
		
		"RuleName":= "RuleName"||',';
	
	END IF;
	"RuleData" := "RuleData" || "RuleName";
	---"RuleName":= "RuleName"||',';
	"lvCounter" := "lvCounter"+1;
RAISE NOTICE 'IN_LOOP: %',"RuleName";
									
END LOOP;

"RuleData" :=(SELECT (CASE WHEN LENGTH("RuleData") > 0 THEN ','||"RuleData"
					 ELSE '' END));
RAISE NOTICE 'RuleData: %',"RuleData";

"SelectString2" := CASE WHEN "InOrderByColumn" > '' AND "InOrderBy" > '' THEN
CONCAT(' 
ORDER BY x."',"InOrderByColumn",'" ',"InOrderBy",'
OFFSET ',"InOffSet",' ROWS
FETCH NEXT ',"InLimit",' ROWS ONLY;')
ELSE CONCAT(' 
OFFSET ',"InOffSet",' ROWS
FETCH NEXT ',"InLimit",' ROWS ONLY;')
END;

IF "InObjectId" > '' THEN
"SelectString" := CONCAT('SELECT *
				FROM (
SELECT a."FDAObjectScoreValueId",
       a."FDASystemObjectsId",
	   CONCAT(COALESCE("Freshness",''0''),'' Days old'') as "Freshness",
	   (CASE
           WHEN  COALESCE(b."RefreshFrequency",''Daily Exclude Weekend'')= ''Daily'' AND  COALESCE(CAST("Freshness" AS INT),''0'') > ''1'' THEN  ''RED''
		   WHEN  COALESCE(b."RefreshFrequency",''Daily Exclude Weekend'')= ''Weekly'' AND  COALESCE(CAST("Freshness" AS INT),''0'') > ''7'' THEN ''RED''
		   WHEN  COALESCE(b."RefreshFrequency",''Daily Exclude Weekend'')= ''Monthly'' AND  COALESCE(CAST("Freshness" AS INT),''0'') > ''30'' THEN ''RED''
		   WHEN  COALESCE(b."RefreshFrequency",''Daily Exclude Weekend'')= ''Daily Exclude Weekend'' AND  COALESCE(CAST("Freshness" AS INT),''0'') > ''1'' THEN  ''RED''
			ELSE ''GREEN''
       END) AS "FreshnessColor",
	   
	   (CASE
          WHEN fda."fn_UpdateObjectSyncUpScore"(a."FDASystemObjectsId",a."FDAObjectScoreValueId") > 0 THEN 
			fda."fn_UpdateObjectSyncUpScore"(a."FDASystemObjectsId",a."FDAObjectScoreValueId")
			ELSE 3
		END) AS "ObjectScore",
		
		fda."fn_OutlierColorByRuletrendInc"(''SCORE'','''',a."FDAObjectScoreValueId",a."FDASystemObjectsId") AS "ObjectScoreColor",
	   	

	   TO_CHAR(COALESCE(a."RowCount",0), ''fm999G999G999G999G999'') "RowCount",
	   COALESCE(a."RowCountOutlierInd",''N'') "RowCountOutlierInd",
	   ',"SelectStringAdv",'
	   
	   /*TO_CHAR(COALESCE(a."AvgNullCount",0),''fm999G999G999G999G999'') "AvgNullCount",
	   COALESCE(a."AvgNullCountOutlierInd",''N'') "NullCountOutlierInd",
	   
	   (CASE WHEN COALESCE(CAST(a."NullCountPercent" AS DECIMAL(18,2)),0.0) > 0 THEN 
		TO_CHAR(COALESCE(CAST(a."NullCountPercent" AS DECIMAL(18,2)),0.0),''fm999G999G999G999G999D00'')
		ELSE ''0.0'' END) "NullCountPercent",
	   
	   COALESCE(a."NullCountPercentOutlierInd",''N'') "NullCountPercentOutlierInd",
	   TO_CHAR(COALESCE(a."AvgDistinctCount",0),''fm999G999G999G999G999'') "AvgDistinctCount",
	   COALESCE(a."AvgDistinctCountOutlierInd",''N'') "DistinctCountOutlierInd",
	   
	   (CASE WHEN COALESCE(CAST(a."DistinctCountPercent" AS DECIMAL(18,2)),0.0) > 0 THEN 
		TO_CHAR(COALESCE(CAST(a."DistinctCountPercent" AS DECIMAL(18,2)),0.0),''fm999G999G999G999G999D00'')
		ELSE ''0.0'' END) "DistinctCountPercent",
	   
	   COALESCE(a."DistinctCountPercentOutlierInd",''N'') "DistinctCountPercentOutlierInd", */
	   
	   
	   to_char(a."CreatedDateTime",''YYYY-MM-DD HH24:MI'') "CreatedDateTime",
	   to_char(a."LastUpdatedDateTime",''yyyy-Mon-dd hh:mm AM '') "LastUpdatedDateTime",
	   TO_CHAR(a."CreatedDateTime",''yyyy-mm-dd hh:mm AM '') "ScoreLoadedOn",
	   TO_CHAR( "LastRefreshedDateTime",''YYYY-MM-DD HH24:MI'') "LastRefreshedDateTime",
	   
	    COALESCE(b."RefreshFrequency",''Daily Exclude Weekend'') "LoadFrequency",
	   COALESCE(b."RefreshTime",''12:00 GMT'') "RefreshSLA",
	   (CASE WHEN TO_CHAR( "LastRefreshedDateTime",''HH24:MI'') > TO_CHAR( b."RefreshTime",''HH24:MI'') THEN ''RED''
			ELSE ''GREEN'' END) "SLAColor",
		fda."fn_OutlierCountByRule"(''NULL'',a."FDAObjectScoreValueId") AS "AutoOutlier",
	   (CASE WHEN fda."fn_OutlierCountByRule"(''NULL'',a."FDAObjectScoreValueId") > 0 THEN  ''RED'' 
				ELSE ''GREEN'' END ) AS "AutoOutlierColor",
				COALESCE(a."ChecksumAggValue",''0'') "ChecksumValue"
		',"RuleData",'
	   
	   ');
	   
"FromString" := '
FROM fda."FDAObjectsScoreValue" a
INNER JOIN fda."FDASystemObjects" b
ON a."FDASystemObjectsId" = b."FDASystemObjectsId" ';

END IF;

IF "InObjectId" > '' OR "InObjectScoreId" > '' OR "InRowCount" > '' OR "InAvgNullCount" > '' 
OR "InNullCountPercent" > '' OR "InAvgDistinctCount" > '' OR "InDistinctCountPercent" > '' OR "InLastUpdatedOn" > ''

THEN
	"WhereConditionString" := CONCAT('WHERE a."FDAObjectScoreValueId" <= ',"InObjectScoreId",' 
	AND a."FDASystemObjectsId" = ',"InObjectId",' ');
	"lvInd1" := 'Y';
	 

	IF "InRowCount" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"WhereConditionString" := CONCAT("WhereConditionString", ' AND CAST(a."RowCount" AS VARCHAR) LIKE ''%',"InRowCount",'%''');
	   ELSE IF "lvInd1" = 'N' THEN
	  		"WhereConditionString" := CONCAT("WhereConditionString",' CAST(a."RowCount" AS VARCHAR) LIKE ''%',"InRowCount",'%''');
			"lvInd1" := 'Y';
        END IF;
        END IF;
	END IF;

    IF "InAvgNullCount" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"WhereConditionString" := CONCAT("WhereConditionString", ' AND CAST(a."AvgNullCount" AS VARCHAR) LIKE ''%',"InAvgNullCount",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"WhereConditionString" := CONCAT("WhereConditionString",' CAST(a."AvgNullCount" AS VARCHAR) LIKE ''%',"InAvgNullCount",'%''');
			"lvInd1" := 'Y';
        END IF;
        END IF;
	END IF;

    IF "InNullCountPercent" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"WhereConditionString" := CONCAT("WhereConditionString", ' AND CAST(a."NullCountPercent" AS VARCHAR) LIKE ''%',"InNullCountPercent",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"WhereConditionString" := CONCAT("WhereConditionString",' CAST(a."NullCountPercent" AS VARCHAR) LIKE ''%',"InNullCountPercent",'%''');
			"lvInd1" := 'Y';
        END IF;
        END IF;
	END IF;

    IF "InAvgDistinctCount" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"WhereConditionString" := CONCAT("WhereConditionString", 'AND CAST(a."AvgDistinctCount" AS VARCHAR) LIKE ''%',"InAvgDistinctCount",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"WhereConditionString" := CONCAT("WhereConditionString",' CAST(a."AvgDistinctCount" AS VARCHAR) LIKE ''%',"InAvgDistinctCount",'%''');
			"lvInd1" := 'Y';
        END IF;
        END IF;
	END IF;

    IF "InDistinctCountPercent" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"WhereConditionString" := CONCAT("WhereConditionString", ' AND CAST(a."DistinctCountPercent" AS VARCHAR) Like ''%',"InDistinctCountPercent",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"WhereConditionString" := CONCAT("WhereConditionString",' CAST(a."DistinctCountPercent" AS VARCHAR) Like ''%',"InDistinctCountPercent",'%''');
			"lvInd1" := 'Y';
        END IF;
        END IF;
	END IF;
    
	IF "InLastUpdatedOn" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"WhereConditionString" := CONCAT("WhereConditionString", ' AND CAST(a."LastUpdatedDateTime" AS VARCHAR) Like ''%',"InLastUpdatedOn",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"WhereConditionString" := CONCAT("WhereConditionString",' CAST(a."LastUpdatedDateTime" AS VARCHAR) Like ''%',"InLastUpdatedOn",'%''');
			"lvInd1" := 'Y';
        END IF;
        END IF;
	END IF;
	
	
	
	 
END IF;

"SelectString" := CONCAT("SelectString","FromString","WhereConditionString",'ORDER BY a."CreatedDateTime" DESC ) x ', "SelectString2");

RAISE NOTICE 'SelectString: %',"SelectString";

"SelectCountString" := CONCAT('SELECT COUNT(a."FDAObjectScoreValueId") "OutTotalRecordCount"', "FromString" , "WhereConditionString");

RAISE NOTICE 'SelectCountString: %',"SelectCountString";

OPEN $14 FOR 

	EXECUTE "SelectString";

RETURN NEXT $14;
	
OPEN $15 FOR 

	EXECUTE "SelectCountString";

RETURN NEXT $15;

OPEN $16 FOR 

	SELECT UNNEST(STRING_TO_ARRAY("lvRuleType",',')) "TrendRules";

RETURN NEXT $16;

/*
SELECT fda."Proc_ListFDAObjectScoreTrend"(
	'0',--"InOffSet" bigint,
	'15',--"InLimit" bigint,
	'',--"InOrderByColumn" character varying,
	'',--"InOrderBy" character varying,
	'3',--"InObjectId" character varying,
	'55',--"InObjectScoreId" character varying,
	'',--"InObjectName" character varying,
	'',--"InRowCount" character varying,
	'',--"InAvgNullCount" character varying,
	'',--"InNullCountPercent" character varying,
	'',--"InAvgDistinctCount" character varying,
	'',--"InDistinctCountPercent" character varying,
	'',--"InLastUpdatedOn" character varying,
	'R1',--refcursor,
	'R2',
	'R3');
FETCH ALL IN "R1";

*/
END;
$BODY$;
-----------------------------------------------------------------

CREATE OR REPLACE FUNCTION fda."fn_OutlierCountByRule"(
	"InRuleName" character varying,
	"InObjectScoreId" bigint)
    RETURNS bigint
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE "Result" BIGINT;
	
   BEGIN
		/*SELECT SUM("OutlierCount")
		FROM (SELECT  "FDAObjectScoreId",LOWER("RuleName") "RuleName",COUNT(*) "OutlierCount" 
				FROM  fda."FDAObjectFieldsOutlierData"
                WHERE "FDAObjectScoreId" = "InObjectScoreId"
				GROUP BY "FDAObjectScoreId",LOWER("RuleName") ) X
			WHERE LOWER(COALESCE("RuleName",'NULL')) = LOWER("InRuleName") */
		RAISE NOTICE 'InRuleId: % ',"InRuleName";
		RAISE NOTICE 'InRuleId: % ',SPLIT_PART("InRuleName",'-',1);
		RAISE NOTICE 'InRuleName: % ',SPLIT_PART("InRuleName",'-',2);

	IF "InRuleName" = 'NULL' THEN 
			
		SELECT  SUM("OutlierCount") "OutlierCount"
				FROM  fda."FDAObjectScoreOutlierCountByCategory"
                WHERE "FDAObjectScoreId" = "InObjectScoreId"
				AND  LOWER(COALESCE("RuleName",'NULL')) = LOWER("InRuleName")			
		INTO 	
			"Result";
	ELSE		
		SELECT  SUM("OutlierCount") "OutlierCount"
		FROM  fda."FDAObjectScoreOutlierCountByCategory"
        WHERE "FDAObjectScoreId" = "InObjectScoreId"
		AND "MasterRuleId" = SPLIT_PART("InRuleName",'-',1)::BIGINT
		AND  LOWER(COALESCE("RuleName",'NULL')) = LOWER(SPLIT_PART("InRuleName",'-',2))				
		INTO 	
			"Result";
	END IF;
/*			
IF 	"InRuleName" = 	'Blank/NonBlank'
THEN			
	       SELECT SUM("OutlierCount")
                FROM (SELECT  COALESCE(SUM("OutlierCount"),0) "OutlierCount"
				FROM  fda."FDAObjectScoreOutlierCountByCategory"
                WHERE "FDAObjectScoreId" = "InObjectScoreId"
				AND LOWER(COALESCE("RuleName",'NULL')) = LOWER('Blank Check')
                UNION 
                SELECT  COALESCE(SUM("OutlierCount"),0) "OutlierCount"
				FROM  fda."FDAObjectScoreOutlierCountByCategory"
                WHERE "FDAObjectScoreId" = "InObjectScoreId"
				AND LOWER(COALESCE("RuleName",'NULL')) = LOWER('Blank/NonBlank') )X	
				
		INTO 	
			"Result";
		
ELSE		
		SELECT  SUM("OutlierCount") "OutlierCount"
				FROM  fda."FDAObjectScoreOutlierCountByCategory"
                WHERE "FDAObjectScoreId" = "InObjectScoreId"
				AND  LOWER(COALESCE("RuleName",'NULL')) = LOWER("InRuleName")
				
		INTO 	
			"Result";
			
END IF; */
        RETURN COALESCE("Result",0);
        

END
$BODY$;
--------------------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fda."fn_OutlierColorByRuletrendInc"(
	"IndType" character varying,
	"InRuleName" character varying,
	"InObjectScoreId" bigint,
	"InObjectId" bigint)
    RETURNS text
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$

DECLARE "lvRowCountOutlierInd" VARCHAR(1);
		"lvFreshnessOutlierInd" VARCHAR(1);
		"lvRuleOutllierInd" VARCHAR(1);
		
		"Result1" BIGINT;
		"Result2" BIGINT;
		"Result3" BIGINT;
		"Result4" text;
		"Result" text;
		"pyScoreId" BIGINT;
		
		"lvFreshness" BIGINT;
		"lvNoOfRowCountOutlier" BIGINT;
		"lvRefreshFrequency" VARCHAR(100);
		"lvCreatedDateTime"  VARCHAR(100);
		"lvRefreshTime"  VARCHAR(100);
		"lvRefreshTimePlusOne"  VARCHAR(100);
		
		"lvPYRules" TEXT;
		"lvRuleType" TEXT;
		"GreyResult" TEXT;
		"lvLastUpdatedDateTime" TEXT;
		"lvNewBaseLineDateTime" TEXT;
		"lvNewBaseLineInd" VARCHAR(5);
	
BEGIN
			
	SELECT "FDAObjectScoreValueId",rank () over( order by "FDAObjectScoreValueId" )
	INTO "pyScoreId"
	FROM(SELECT a."FDAObjectScoreValueId"
		 FROM fda."FDAObjectsScoreValue" a
		 INNER JOIN fda."FDASystemObjects" b
			ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
		 WHERE a."FDAObjectScoreValueId" <= "InObjectScoreId"
		 	AND a."FDASystemObjectsId" = "InObjectId"
		 ORDER BY a."FDAObjectScoreValueId" DESC
		 LIMIT 2
		)x
	LIMIT 1;
	
-------------------------(System_Object Indicator)-------------------------------------------

	SELECT  COALESCE(NULLIF(b."RowCountOutlierInd",'N'),a."RowCountOutlierInd",'N') AS "RowCountOutlierInd",
			COALESCE(NULLIF(b."FreshnessOutlierInd",'N'),a."FreshnessOutlierInd",'N') AS "FreshnessOutlierInd",
			COALESCE(NULLIF(b."RuleOutllierInd",'N'),a."RuleOutllierInd",'N') AS "RuleOutllierInd"		   
	INTO "lvRowCountOutlierInd","lvFreshnessOutlierInd","lvRuleOutllierInd"
	FROM fda."FDASystems" a 
	INNER JOIN fda."FDASystemObjects" b 
		ON a."FDASystemsId" = b."FDASystemsId" 
	WHERE "FDASystemObjectsId" =  "InObjectId";
	
--------------OBJECT SCORE COLOR-------------------	
IF "IndType" = 'SCORE' THEN

	RAISE NOTICE 'FROM IF BLOCK';
	
SELECT 
	STRING_AGG("RuleType",',') AS "RuleType"
INTO "lvRuleType"
FROM(SELECT DISTINCT
				c."FDADataQualityRulesId"||'-'||"RuleName" AS "RuleType"
	FROM fda."FDASystemObjects" a
	INNER JOIN fda."FDASystemObjectFields" b
		ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
		AND a."FDASystemsId" = b."FDASystemsId"
	INNER JOIN fda."FDADataQualityMasterRuleObjectColumns" d
			ON b."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
			AND b."FDASystemsId" = d."FDASystemsId"
			AND b."FDASystemObjectsId" = d."FDASystemObjectsId"	
	INNER JOIN fda."FDADataQualityMasterRules" c
		ON d."FDADataQualityRulesId" = c."FDADataQualityRulesId"
	WHERE a."FDASystemObjectsId" = "InObjectId":: BIGINT
	AND b."AutoMetricsInd" = 'true'
	)x
WHERE x."RuleType" IS NOT NULL;
------------------------------

	
IF "pyScoreId" > 0 THEN 
		
					
		SELECT  SUM("OutlierCount") "OutlierCount"
		FROM  fda."FDAObjectScoreOutlierCountByCategory"
        WHERE "FDAObjectScoreId" = "pyScoreId"
			AND  LOWER(COALESCE("RuleName",'NULL')) IN (SELECT LOWER(SPLIT_PART("Rule",'-',2))
														FROM UNNEST(STRING_TO_ARRAY("lvRuleType",','))"Rule"
														)
			AND "MasterRuleId" IN (SELECT SPLIT_PART("Rule",'-',1)::BIGINT
														FROM UNNEST(STRING_TO_ARRAY("lvRuleType",','))"Rule"
														)
				
		INTO 	
			"Result1";
			
END IF;
	
IF "InObjectScoreId" > 0 THEN 			
		SELECT  SUM("OutlierCount") "OutlierCount"
		FROM  fda."FDAObjectScoreOutlierCountByCategory"
        WHERE "FDAObjectScoreId" = "InObjectScoreId"
			AND  LOWER(COALESCE("RuleName",'NULL')) IN (SELECT LOWER(SPLIT_PART("Rule",'-',2))
														FROM UNNEST(STRING_TO_ARRAY("lvRuleType",','))"Rule"
														)
			AND "MasterRuleId" IN (SELECT SPLIT_PART("Rule",'-',1)::BIGINT
														FROM UNNEST(STRING_TO_ARRAY("lvRuleType",','))"Rule"
														)
				
		INTO 	
			"Result2";
			
END IF;

	SELECT CAST(COALESCE("Freshness",'0') AS INTEGER),COALESCE("LastUpdatedDateTime"::TEXT,'')
		INTO "lvFreshness","lvLastUpdatedDateTime"
	FROM fda."FDAObjectsScoreValue"
	WHERE "FDAObjectScoreValueId" = "InObjectScoreId"; 
	
	SELECT COUNT(*)
		INTO "lvNoOfRowCountOutlier"
	FROM fda."FDAObjectsScoreValue"
	WHERE "FDASystemObjectsId" = "InObjectId"
		AND "FDAObjectScoreValueId" = "InObjectScoreId"
		AND "RowCountOutlierInd" = 'Y';
	
	SELECT COALESCE("RefreshFrequency",'Daily Exclude Weekend'),COALESCE("NewBaseLineDateTime"::TEXT,'') as "NewBaseLineDateTime"
		INTO "lvRefreshFrequency","lvNewBaseLineDateTime"
	FROM fda."FDASystemObjects" 
	WHERE "FDASystemObjectsId" = "InObjectId";
		
		
	SELECT 
					(CASE 
						WHEN   (("lvNoOfRowCountOutlier" >= 1 AND "lvRowCountOutlierInd" = 'Y') OR ("lvFreshnessOutlierInd" = 'Y' AND "lvRefreshFrequency" = 'Daily' AND "lvFreshness" > 1) )
							OR (("lvNoOfRowCountOutlier" >= 1 AND "lvRowCountOutlierInd" = 'Y') OR ("lvFreshnessOutlierInd" = 'Y' AND "lvRefreshFrequency" = 'Daily Exclude Weekend' AND  "lvFreshness" > 1))
							OR (("lvNoOfRowCountOutlier" >= 1 AND "lvRowCountOutlierInd" = 'Y') OR ("lvFreshnessOutlierInd" = 'Y' AND "lvRefreshFrequency" = 'Weekly' AND "lvFreshness" > 7 ))
							OR (("lvNoOfRowCountOutlier" >= 1 AND "lvRowCountOutlierInd" = 'Y') OR ("lvFreshnessOutlierInd" = 'Y' AND "lvRefreshFrequency" = 'Monthly' AND "lvFreshness" > 30 ))
							THEN 1
						WHEN 
							   (("lvNoOfRowCountOutlier" = 0 AND "lvRowCountOutlierInd" = 'N') OR  ("lvFreshnessOutlierInd" = 'N' AND "lvRefreshFrequency" = 'Daily' AND "lvFreshness" = 1 ))
							OR (("lvNoOfRowCountOutlier" = 0 AND "lvRowCountOutlierInd" = 'N') OR  ("lvFreshnessOutlierInd" = 'N' AND "lvRefreshFrequency" = 'Daily' AND "lvFreshness" = 0 ))
							OR (("lvNoOfRowCountOutlier" = 0 AND "lvRowCountOutlierInd" = 'N') OR  ("lvFreshnessOutlierInd" = 'N' AND "lvRefreshFrequency" = 'Daily Exclude Weekend' AND  "lvFreshness" = 1 ))
							OR (("lvNoOfRowCountOutlier" = 0 AND "lvRowCountOutlierInd" = 'N') OR  ("lvFreshnessOutlierInd" = 'N' AND "lvRefreshFrequency" = 'Daily Exclude Weekend' AND  "lvFreshness" = 0 ))
							OR (("lvNoOfRowCountOutlier" = 0 AND "lvRowCountOutlierInd" = 'N') OR  ("lvFreshnessOutlierInd" = 'N' AND "lvRefreshFrequency" = 'Weekly' AND ("lvFreshness" BETWEEN 0 AND 7 ) ))
							OR (("lvNoOfRowCountOutlier" = 0 AND "lvRowCountOutlierInd" = 'N') OR  ("lvFreshnessOutlierInd" = 'N' AND "lvRefreshFrequency" = 'Monthly' AND ("lvFreshness" BETWEEN 0 AND 30) ))
							THEN 3
						ELSE 3
					END)
					
					INTO 
						"Result3"
					;
					
	"Result4":=(SELECT (CASE 
							WHEN ( COALESCE("Result2",0) > 0 OR COALESCE("Result2",0) = 0 ) AND "lvRuleOutllierInd" = 'N' THEN  'GREEN'
							WHEN COALESCE("Result2",0) > 0 AND COALESCE("Result1",0) = COALESCE("Result2",0) AND  "InObjectScoreId" = "pyScoreId"  AND "lvRuleOutllierInd" = 'Y' THEN 'RED'
							WHEN COALESCE("Result2",0) > 0 AND COALESCE("Result1",0) <> COALESCE("Result2",0) AND "InObjectScoreId" <> "pyScoreId" AND "lvRuleOutllierInd" = 'Y' THEN 'RED'
							WHEN "Result2" > 0 AND  "Result1" = "Result2" AND "InObjectScoreId" <> "pyScoreId" AND "lvRuleOutllierInd" = 'Y' THEN 'ORANGE'
							--WHEN "Result2" > 0 AND  "Result1" = "Result2" AND "InObjectScoreId" <> "pyScoreId" AND "lvRuleOutllierInd" = 'Y' THEN 'RED'
							ELSE 'GREEN' 
						END)
				);
				
				
			    
	"Result":= (SELECT (CASE 
							WHEN "Result4" = 'RED' OR  COALESCE("Result3",0) = 1 THEN 'RED'
							WHEN "Result4" = 'ORANGE' OR  COALESCE("Result3",0) = 3 THEN 'GREEN'
							ELSE 'GREEN' 
						END)
				);

---------------------------------------------------
ELSE	
	
	RAISE NOTICE 'FROM ELSE BLOCK';
	
	SELECT COALESCE("NewBaseLineDateTime"::TEXT,'') as "NewBaseLineDateTime",COALESCE("NewBaseLineInd",'N')
		INTO "lvNewBaseLineDateTime","lvNewBaseLineInd"
	FROM fda."FDASystemObjects" 
	WHERE "FDASystemObjectsId" = "InObjectId";
	
	SELECT COALESCE("LastUpdatedDateTime"::TEXT,'')
	INTO "lvLastUpdatedDateTime"
	FROM fda."FDAObjectsScoreValue"
	WHERE "FDAObjectScoreValueId" = "InObjectScoreId"; 

/*IF "pyScoreId" > 0 AND "InRuleName" = 	'Blank/NonBlank' THEN 
		
			SELECT SUM("OutlierCount")
                FROM (SELECT  COALESCE(SUM("OutlierCount"),0) "OutlierCount"
				FROM  fda."FDAObjectScoreOutlierCountByCategory"
                WHERE "FDAObjectScoreId" = "pyScoreId"
				AND LOWER(COALESCE("RuleName",'NULL')) = LOWER('Blank Check')
                UNION 
                SELECT  COALESCE(SUM("OutlierCount"),0) "OutlierCount"
				FROM  fda."FDAObjectScoreOutlierCountByCategory"
                WHERE "FDAObjectScoreId" = "pyScoreId"
				AND LOWER(COALESCE("RuleName",'NULL')) = LOWER('Blank/NonBlank') )X	
				
		INTO 	
			"Result1";
ELSE */		
		SELECT  SUM("OutlierCount") "OutlierCount"
				FROM  fda."FDAObjectScoreOutlierCountByCategory"
                WHERE "FDAObjectScoreId" = "pyScoreId"
				AND "MasterRuleId" = SPLIT_PART("InRuleName",'-',1)::BIGINT
				AND  LOWER(COALESCE("RuleName",'NULL')) = LOWER(SPLIT_PART("InRuleName",'-',2))		
		INTO 	
			"Result1";
			
--END IF;
	
/*IF 	"InRuleName" = 	'Blank/NonBlank'
THEN			
	       SELECT SUM("OutlierCount")
                FROM (SELECT  COALESCE(SUM("OutlierCount"),0) "OutlierCount"
				FROM  fda."FDAObjectScoreOutlierCountByCategory"
                WHERE "FDAObjectScoreId" = "InObjectScoreId"
				AND LOWER(COALESCE("RuleName",'NULL')) = LOWER('Blank Check')
                UNION 
                SELECT  COALESCE(SUM("OutlierCount"),0) "OutlierCount"
				FROM  fda."FDAObjectScoreOutlierCountByCategory"
                WHERE "FDAObjectScoreId" = "InObjectScoreId"
				AND LOWER(COALESCE("RuleName",'NULL')) = LOWER('Blank/NonBlank') )X	
				
		INTO 	
			"Result2";
		
ELSE */		
		SELECT  SUM("OutlierCount") "OutlierCount"
				FROM  fda."FDAObjectScoreOutlierCountByCategory"
                WHERE "FDAObjectScoreId" = "InObjectScoreId"
				AND "MasterRuleId" = SPLIT_PART("InRuleName",'-',1)::BIGINT
				AND  LOWER(COALESCE("RuleName",'NULL')) = LOWER(SPLIT_PART("InRuleName",'-',2))
				
		INTO 	
			"Result2";
			
--END IF;

"Result":= (SELECT    (CASE 
							WHEN COALESCE("Result2",0) = 0 THEN  'GREEN'
							WHEN COALESCE("Result2",0) > 0 AND COALESCE("Result1",0) = COALESCE("Result2",0) AND  "InObjectScoreId" = "pyScoreId"  THEN 'RED'
							WHEN COALESCE("Result2",0) > 0 AND COALESCE("Result1",0) <> COALESCE("Result2",0) AND "InObjectScoreId" <> "pyScoreId"  THEN 'RED'
							WHEN COALESCE("Result2",0) > 0 AND "Result1" = "Result2" AND "InObjectScoreId" <> "pyScoreId"  THEN 'ORANGE'
							ELSE 'GREEN'
						END)
					
			);
END IF;	
	
RETURN COALESCE("Result",'GREEN');
        

END;
$BODY$;
--------------------------------------------------------

CREATE OR REPLACE FUNCTION fda."Proc_UpdateFDAObjectFieldsOutlierData"(
	"InObjectScoreId" bigint,
	"InSystemId" bigint,
	"InObjectId" character varying,
	"InObjectFieldId" character varying,
	"InFieldSegmentId" character varying,
	"InObjectSegmentId" character varying,
	"InFieldNames" text,
	"InOutliersCount" character varying,
	"InData" text,
	"InRuleName" character varying,
	"InRuleType" character varying,
	"InMasterRuleId" bigint)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE 
"lvObjectScoreId" BIGINT;
"lvLastObjectScoreId" BIGINT;
"lvLastObjectFieldScoreId" BIGINT;
"lvLastFieldSegmentedScoreId" BIGINT;
"lvLastObjectSegmentedScoreId" BIGINT;
"lvTotalOutliers" BIGINT;
"lvSysId" VARCHAR(10);
"lvSegmentFieldName" VARCHAR(500);
"lvSegmentFieldValue" VARCHAR(500);
"lvOutlierFieldName" VARCHAR(500);
"lvRuleDetails" TEXT;

"PYOutlierCount" BIGINT;
"lvOutlierCount" BIGINT;
"PYObjectScoreId" BIGINT;

DECLARE "ITEM_CURSOR" CURSOR FOR SELECT "VALUE"
FROM UNNEST(STRING_TO_ARRAY("InData" ,'{|}')) "VALUE"
WHERE "VALUE" IS NOT NULL
LIMIT 100;

DECLARE "lvData" VARCHAR(1000);

BEGIN

--PERFORM fda."Proc_ErrorTracking"('Proc_UpdateFDAObjectFieldsOutlierData','InSystemId',(CAST "InSystemId" AS VARCHAR),'');
--PERFORM fda."Proc_ErrorTracking"('Proc_UpdateFDAObjectFieldsOutlierData','InObjectId',"InObjectId",'');
--PERFORM fda."Proc_ErrorTracking"('Proc_UpdateFDAObjectFieldsOutlierData','InObjectFieldId',"InObjectFieldId",'');
--PERFORM fda."Proc_ErrorTracking"('Proc_UpdateFDAObjectFieldsOutlierData','InFieldSegmentId',"InFieldSegmentId",'');
--PERFORM fda."Proc_ErrorTracking"('Proc_UpdateFDAObjectFieldsOutlierData','InObjectSegmentId',"InObjectSegmentId",'');
--PERFORM fda."Proc_ErrorTracking"('Proc_UpdateFDAObjectFieldsOutlierData','InFieldNames',"InFieldNames",'');
--PERFORM fda."Proc_ErrorTracking"('Proc_UpdateFDAObjectFieldsOutlierData','InOutliersCount',"InOutliersCount",'');
--PERFORM fda."Proc_ErrorTracking"('Proc_UpdateFDAObjectFieldsOutlierData','InData',"InData",'');

IF "InOutliersCount" = '' THEN

 "InOutliersCount" := '0';

END IF;

"lvSysId" := CAST("InSystemId" AS VARCHAR);

IF COALESCE("InObjectId",'') > '' 
	AND "InObjectScoreId" > 0
	AND COALESCE("InObjectFieldId",'') = '' 
	AND COALESCE("InFieldSegmentId",'') = ''
	AND COALESCE("InObjectSegmentId",'') = ''
THEN
	--store Total outliers under on object
		
		/*SELECT COUNT(*)
		INTO "lvTotalOutliers"
		FROM fda."FDAObjectFieldsOutlierData"
		WHERE "FDAObjectScoreId" = "InObjectScoreId"; */
		"lvTotalOutliers" := (SELECT SUM("OutlierCount") 
							FROM fda."FDAObjectScoreOutlierCountByCategory"
							WHERE "FDAObjectScoreId" = "InObjectScoreId"); 
		
		RAISE NOTICE 'VALUE: %',"lvTotalOutliers";

		UPDATE fda."FDAObjectsScoreValue"
		SET "Outliers" = CAST(COALESCE("lvTotalOutliers",0) AS VARCHAR)
		WHERE "FDAObjectScoreValueId" = "InObjectScoreId";
		
		----------------------object score color-------------------
		SELECT "FDAObjectScoreId"
		INTO "PYObjectScoreId"
		FROM(SELECT "FDAObjectScoreId", RANK() OVER ( ORDER BY "FDAObjectScoreId" DESC) "Rank"
			FROM(SELECT DISTINCT "FDAObjectScoreId"
					FROM fda."FDAObjectsScoreValue" a
				INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" b
					ON a."FDAObjectScoreValueId" = b."FDAObjectScoreId"
				WHERE b."FDAObjectScoreId" <= "InObjectScoreId"
				AND a."FDASystemObjectsId" = CAST("InObjectId" AS BIGINT)
				ORDER BY  "FDAObjectScoreId" DESC
				)x
			)y
		WHERE "Rank" = 2;
		
		/*SELECT SUM("OutlierCount")
		INTO "PYOutlierCount"
		FROM fda."FDAObjectScoreOutlierCountByCategory"
		WHERE "FDAObjectScoreId" = "PYObjectScoreId"
		AND "RuleName" = "InRuleName";
		
		SELECT SUM("OutlierCount") 
		INTO "lvOutlierCount"
		FROM fda."FDAObjectScoreOutlierCountByCategory"
		WHERE "FDAObjectScoreId" = "InObjectScoreId"
		AND "RuleName" = "InRuleName"; */
		
		INSERT INTO fda."FDAObjectScoreOutlierCountByObject"
		(
			"FDAObjectScoreId",
			"FDASystemObjectId",
			"RuleName",
			"OutlierCount",
			"OutlierCountColor",
			"LastUpdatedOn"
		)
		SELECT
			"InObjectScoreId",
			CAST("InObjectId" AS BIGINT),
			a."RuleName",
			a."OutlierCount",
			(CASE WHEN COALESCE(a."OutlierCount" :: bigint,0) > 0 AND a."RuleName" = b."RuleName" AND COALESCE(a."OutlierCount" :: bigint,0) = COALESCE(b."OutlierCount" :: bigint,0) THEN 'ORANGE'
						WHEN COALESCE(a."OutlierCount" :: bigint,0) > 0 AND a."RuleName" = b."RuleName"  AND COALESCE(a."OutlierCount" :: bigint,0) <> COALESCE(b."OutlierCount" :: bigint,0) THEN 'RED'
						WHEN COALESCE(a."OutlierCount" :: bigint,0) > 0 AND COALESCE(a."RuleName",'') > '' AND COALESCE(b."RuleName",'') = '' THEN 'RED'
						WHEN COALESCE(a."OutlierCount" :: bigint,0) = 0 THEN 'GREEN' ELSE 'GREEN' END),
			CURRENT_TIMESTAMP
		
		FROM (SELECT "FDAObjectScoreId","RuleName",SUM("OutlierCount") AS "OutlierCount"
			FROM fda."FDAObjectScoreOutlierCountByCategory"
			WHERE "FDAObjectScoreId" = "InObjectScoreId"
			GROUP BY "FDAObjectScoreId","RuleName")a
		LEFT JOIN(SELECT "FDAObjectScoreId","RuleName",SUM("OutlierCount") AS "OutlierCount"
				FROM fda."FDAObjectScoreOutlierCountByCategory"
				WHERE "FDAObjectScoreId" = "PYObjectScoreId"
				group by "FDAObjectScoreId","RuleName")b
			ON a."RuleName" = b."RuleName";
				
		-------------------------------------------------
		
	  
ELSE IF COALESCE("InObjectId",'') > ''  
		AND "InObjectScoreId" > 0
		AND COALESCE("InObjectFieldId",'') > '' 
		AND COALESCE("InFieldSegmentId",'') = ''
		AND COALESCE("InObjectSegmentId",'') = ''
		AND COALESCE("InData",'') > ''
THEN
RAISE NOTICE 'VALUE: %','block 2'; 
	--store Field outliers without segment

		--Get Latest Object Field Score Id
		SELECT MAX("FDAObjectFieldsScoreValueId")
			INTO "lvLastObjectFieldScoreId"
		FROM fda."FDAObjectFieldsScoreValue"
		WHERE "FDAObjectScoreValueId" = "InObjectScoreId"
		AND "FDASystemObjectFieldsId" = CAST("InObjectFieldId" AS BIGINT);
		
		--Get Column Name
		SELECT "FieldName"
			INTO "lvOutlierFieldName"
		FROM fda."FDASystemObjectFields"
		WHERE "FDASystemObjectFieldsId" = CAST("InObjectFieldId" AS BIGINT);
		
			SELECT STRING_AGG(X."RuleName",'(^)') 
				INTO "lvRuleDetails"
			FROM (SELECT ("RuleType"||'   |   '||
								(CASE
								WHEN COALESCE("LeftFieldValue",'') > ''AND COALESCE("RightFieldValue",'') > ''
									THEN "LeftFieldValue"||'   ^   '||"RightFieldValue"
								WHEN  COALESCE("LeftFieldValue",'') > ''AND COALESCE("RightFieldValue",'') = ''
									THEN "LeftFieldValue"
								WHEN  COALESCE("LeftFieldValue",'') = ''AND COALESCE("RightFieldValue",'') > ''
									THEN "RightFieldValue"
								END)
							   )"RuleName"
						FROM fda."FDADataQualityMasterRulesDetails"
						WHERE "FDADataQualityRulesId" = "InMasterRuleId"
					)X
				WHERE X."RuleName"  IS NOT NULL ;
		--DELETE FROM fda."FDAObjectFieldsOutlierData"
		--WHERE 
		
			INSERT INTO fda."FDAObjectFieldsOutlierData"
			(
				"FDASystemId",
				"FDASystemObjectId",
				"FDAObjectScoreId",
				"FDAObjectFieldId",
				"FDAFieldScoreId",
				"OutlierFieldName",
				"OutlierFieldValue",
				"ObjectFieldNames",
				"ObjectFieldData",
				"LastUpdatedOn",
				"RuleName",
				"RuleType",
				"RuleDetails",
				"MasterRuleId"
				
			)
			SELECT 
				"InSystemId",
				CAST("InObjectId" AS BIGINT),
				"InObjectScoreId",
				CAST("InObjectFieldId" AS BIGINT),
				"lvLastObjectFieldScoreId",
				"lvOutlierFieldName",
				SPLIT_PART("VALUE",'{~}',1),
				"InFieldNames",
				SPLIT_PART("VALUE",'{~}',2),
				CURRENT_TIMESTAMP,
				"InRuleName",
				"InRuleType",
				"lvRuleDetails",
				"InMasterRuleId"
				
			FROM UNNEST(STRING_TO_ARRAY("InData" ,'{|}')) "VALUE"
			WHERE "VALUE" IS NOT NULL;
			
		--SELECT COUNT(*)
		--INTO "lvTotalOutliers"
		--FROM fda."FDAObjectFieldsOutlierData"
		--WHERE "FDAObjectScoreId" = "lvLastObjectScoreId"
		--	AND "FDAFieldScoreId" = "lvLastObjectFieldScoreId";
			
		UPDATE fda."FDAObjectFieldsScoreValue"
		SET "Outliers" = COALESCE("InOutliersCount",'0')
		WHERE "FDAObjectFieldsScoreValueId" = "lvLastObjectFieldScoreId";
		
		DELETE FROM fda."FDAObjectScoreOutlierCountByCategory"
		WHERE "FDAObjectScoreId" = "InObjectScoreId"
			AND "FDAFieldScoreId" = "lvLastObjectFieldScoreId"
			AND COALESCE("FDAObjectSegmentId",0) = 0
			AND "RuleName" = "InRuleName"
			AND "MasterRuleId" = "InMasterRuleId";
		
		INSERT INTO fda."FDAObjectScoreOutlierCountByCategory"
		(
			"FDAObjectScoreId",
			"FDAFieldScoreId",
			"RuleName",
			"OutlierCount",
			"LastUpdatedOn",
			"MasterRuleId"
		)
		SELECT "InObjectScoreId",
			   "lvLastObjectFieldScoreId",
			   "InRuleName",
			   COALESCE("InOutliersCount" :: bigint,0),
			   CURRENT_TIMESTAMP,
			   "InMasterRuleId";
		
ELSE IF COALESCE("InObjectId",'') > '' AND "InObjectScoreId" > 0
		AND COALESCE("InObjectFieldId",'') > '' AND COALESCE("InFieldSegmentId",'') > ''
		AND COALESCE("InObjectSegmentId",'') = '' AND COALESCE("InData",'') > ''
THEN
	--store Field outliers data with segment
	
			--Get Latest Object Field Score Id
			SELECT MAX("FDAObjectFieldsScoreValueId")
				INTO "lvLastObjectFieldScoreId"
			FROM fda."FDAObjectFieldsScoreValue"
			WHERE "FDAObjectScoreValueId" = "InObjectScoreId"
			AND "FDASystemObjectFieldsId" = CAST("InObjectFieldId" AS BIGINT);
			
			--Get Segmented By Column Name
			SELECT "FieldName"
				INTO "lvSegmentFieldName"
			FROM fda."FDASystemObjectFields"
			WHERE "FDASystemObjectFieldsId" = CAST("InFieldSegmentId" AS BIGINT);
			
			--Get Column Name
			SELECT "FieldName"
				INTO "lvOutlierFieldName"
			FROM fda."FDASystemObjectFields"
			WHERE "FDASystemObjectFieldsId" = CAST("InObjectFieldId" AS BIGINT);
			
			DELETE FROM fda."FDAObjectScoreOutlierCountByCategory"
			WHERE "FDAObjectScoreId" = "InObjectScoreId"
				AND "FDAFieldScoreId" = "lvLastObjectFieldScoreId"
				AND "FDAObjectSegmentId" = ("InFieldSegmentId" :: BIGINT)
				 AND "RuleName" = "InRuleName"
				 AND "MasterRuleId" = "InMasterRuleId";
			
				 
			SELECT STRING_AGG(X."RuleName",'(^)') 
				INTO "lvRuleDetails"
				FROM (SELECT ("RuleType"||'   |   '||
								(CASE
								WHEN COALESCE("LeftFieldValue",'') > ''AND COALESCE("RightFieldValue",'') > ''
									THEN "LeftFieldValue"||'   ^   '||"RightFieldValue"
								WHEN  COALESCE("LeftFieldValue",'') > ''AND COALESCE("RightFieldValue",'') = ''
									THEN "LeftFieldValue"
								WHEN  COALESCE("LeftFieldValue",'') = ''AND COALESCE("RightFieldValue",'') > ''
									THEN "RightFieldValue"
								END)
							   )"RuleName"
						FROM fda."FDADataQualityMasterRulesDetails"
						WHERE "FDADataQualityRulesId" = "InMasterRuleId"
						)X
				WHERE X."RuleName"  IS NOT NULL ;	 
			
			INSERT INTO fda."FDAObjectScoreOutlierCountByCategory"
			(
				"FDAObjectScoreId",
				"FDAFieldScoreId",
				"FDAObjectSegmentId",
				"RuleName",
				"OutlierCount",
				"LastUpdatedOn",
				"MasterRuleId"
			)
			SELECT "InObjectScoreId",
					"lvLastObjectFieldScoreId",
					("InFieldSegmentId" :: BIGINT),
					"InRuleName",
					COALESCE("InOutliersCount" :: bigint,0),
					CURRENT_TIMESTAMP,
					"InMasterRuleId";
		
		--------------------------------------------		
			
			FOR row IN "ITEM_CURSOR" LOOP
			
				"lvData" = REPLACE(CAST(row AS TEXT),'(','');
				"lvData" = REPLACE("lvData",')','');
				"lvData" = REPLACE("lvData",'"','');
				"lvSegmentFieldValue" := SPLIT_PART(SPLIT_PART("lvData",'{~}',1),'{^}',1);
				---PERFORM fda."Proc_ErrorTracking"('Proc_UpdateFDAObjectFieldsOutlierData','lvSegmentFieldValue',"lvSegmentFieldValue",'Mohan');
				IF "lvSegmentFieldValue" > ''
				THEN 
				
					--Get Latest Object Segmented Score Id By Segment Field Value
					SELECT MAX("FDAObjectFieldsSegmentedScoreValueId")
						INTO "lvLastFieldSegmentedScoreId"
					FROM fda."FDAObjectFieldsSegmentedScoreValue"
					WHERE "FDAObjectFieldsScoreValueId" = "lvLastObjectFieldScoreId"
						AND "FDASystemObjectSegmentedFieldId" = CAST("InFieldSegmentId" AS BIGINT)
						AND "SegmentFieldValue" = "lvSegmentFieldValue";
						
					IF "lvLastFieldSegmentedScoreId" > 0
					THEN
						RAISE NOTICE 'Value: %',"lvLastFieldSegmentedScoreId";
						RAISE NOTICE 'Value: %',"lvSegmentFieldValue";
						RAISE NOTICE 'Value: %',"lvSegmentFieldValue";
						RAISE NOTICE 'Value: %',"lvData";
						
						
							INSERT INTO fda."FDAObjectFieldsOutlierData"
							(
								"FDASystemId",
								"FDASystemObjectId",
								"FDAObjectScoreId",
								"FDAObjectFieldId",
								"FDAFieldScoreId",
								"FieldSegmentScoreId",
								"FDAFieldSegemntId",
								"FDASegmentFieldName",
								"FDASegmentFieldValue",
								"OutlierFieldName",
								"OutlierFieldValue",
								"ObjectFieldNames",
								"ObjectFieldData",
								"LastUpdatedOn",
								"RuleName",
								"RuleType",
								"RuleDetails",
								"MasterRuleId"
							)
							VALUES
							( 
								"InSystemId",
								CAST("InObjectId" AS BIGINT),
								"InObjectScoreId",
								CAST("InObjectFieldId" AS BIGINT),
								"lvLastObjectFieldScoreId",
								"lvLastFieldSegmentedScoreId",
								CAST("InFieldSegmentId" AS BIGINT),
								"lvSegmentFieldName",
								SPLIT_PART(SPLIT_PART("lvData",'{~}',1),'{^}',1),
								"lvOutlierFieldName",
								SPLIT_PART(SPLIT_PART("lvData",'{~}',1),'{^}',2),
								"InFieldNames",
								SPLIT_PART("lvData",'{~}',2),
								CURRENT_TIMESTAMP,
								"InRuleName",
								"InRuleType",
								"lvRuleDetails",
								"InMasterRuleId"
							); 
				
						SELECT COUNT(*)
							INTO "lvTotalOutliers"
						FROM fda."FDAObjectFieldsOutlierData"
						WHERE "FieldSegmentScoreId" = "lvLastFieldSegmentedScoreId";
						
						UPDATE fda."FDAObjectFieldsSegmentedScoreValue"
						SET "Outliers" = CAST(COALESCE("lvTotalOutliers",0) AS VARCHAR)
						WHERE "FDAObjectFieldsSegmentedScoreValueId" = "lvLastFieldSegmentedScoreId"; 
						
						END IF;
				END IF;
				
				
			END LOOP;
			
ELSE IF COALESCE("InObjectId",'') > '' AND "InObjectScoreId" > 0
		AND COALESCE("InObjectFieldId",'') > '' AND COALESCE("InFieldSegmentId",'') = ''
		AND COALESCE("InObjectSegmentId",'') > '' AND COALESCE("InData",'') > ''
THEN
	--store Field outliers with object segment
	
			--Get Segmented By Column Name
			SELECT "FieldName"
				INTO "lvSegmentFieldName"
			FROM fda."FDASystemObjectFields"
				WHERE "FDASystemObjectFieldsId" = CAST("InObjectSegmentId" AS BIGINT);
				
			--Get Column Name
			SELECT "FieldName"
				INTO "lvOutlierFieldName"
			FROM fda."FDASystemObjectFields"
			WHERE "FDASystemObjectFieldsId" = CAST("InObjectFieldId" AS BIGINT);
			/*
			FOR row IN "ITEM_CURSOR" LOOP
			
				"lvData" = REPLACE(CAST(row AS TEXT),'(','');
				"lvData" = REPLACE("lvData",')','');
				"lvData" = REPLACE("lvData",'"','');
			
				--Get Latest Object Segmented Score Id By Segment Field Value
				SELECT MAX("FDAObjectFieldsSegmentedScoreByObjectSegmentId")
					INTO "lvLastFieldSegmentedScoreId"
				FROM fda."FDAObjectFieldsSegmentedScoreByObjectSegment"
				WHERE "FDASystemObjectFieldId" = CAST("InObjectFieldId" AS BIGINT)
					AND "FDASystemObjectId" = CAST("InObjectId" AS BIGINT)
					AND "ObjectSegmentedFieldId" = CAST("InObjectSegmentId" AS BIGINT)
					AND "SegmentFieldName" = "lvSegmentFieldName"
					AND "SegmentFieldValue" = SPLIT_PART(SPLIT_PART("lvData",'{~}',1),'{^}',1);
					
					INSERT INTO fda."FDAObjectFieldsOutlierData"
					(
						"FDASystemId",
						"FDASystemObjectId",
						"FDAObjectScoreId",
						"FDAObjectFieldId",
						"ObjectSegmentScoreId",
						"FDAFieldSegemntId",
						"FDASegmentFieldName",
						"FDASegmentFieldValue",
						"OutlierFieldName",
						"OutlierFieldValue",
						"ObjectFieldNames",
						"ObjectFieldData",
						"LastUpdatedOn"
					)
					VALUES
					( 
						"InSystemId",
						CAST("InObjectId" AS BIGINT),
						"lvObjectScoreId",
						CAST("InObjectFieldId" AS BIGINT),
						"lvLastFieldSegmentedScoreId",
						CAST("InObjectSegmentId" AS BIGINT),
						"lvSegmentFieldName",
						SPLIT_PART(SPLIT_PART("lvData",'{~}',1),'{^}',1),
						"lvOutlierFieldName",
						SPLIT_PART(SPLIT_PART("lvData",'{~}',1),'{^}',2),
						"InFieldNames",
						SPLIT_PART("lvData",'{~}',2),
						CURRENT_TIMESTAMP
					);
					
				SELECT COUNT(*)
				INTO "lvTotalOutliers"
				FROM fda."FDAObjectFieldsOutlierData"
				WHERE "ObjectSegmentScoreId" = "lvLastFieldSegmentedScoreId";
				
				UPDATE fda."FDAObjectFieldsSegmentedScoreByObjectSegment"
				SET "Outliers" = CAST(COALESCE("lvTotalOutliers",0) AS VARCHAR)
				WHERE "FDAObjectFieldsSegmentedScoreByObjectSegmentId" = "lvLastFieldSegmentedScoreId";
			
			END LOOP;
			*/

	END IF;
	END IF;
	END IF;
END IF;

/*
SELECT fda."Proc_InsertFDAObjectFieldsOutliersDetails"(
'1',  --"InSystemId" bigint,
'60',  --"InObjectId" character varying,
'',  --"InObjectFieldId" character varying,
'241',  --"InFieldSegmentId" character varying,
''   --"InData" text
);
*/

END;
$BODY$;
-------------------------------------------------------

CREATE OR REPLACE FUNCTION fda."Proc_ListMasterRuleObjectDetails"(
	"InOffset" integer,
	"InLimit" integer,
	"InMasterRuleId" character varying,
	"InLinkedObjectId" character varying,
	"InObjectName" character varying,
	"InFieldName" character varying,
	"InOrderByField" character varying,
	"InOrderByType" character varying,
	refcursor,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$

DECLARE 
	"SelectString" text;
	"SelectcCountString" text;
	"OrderBystring" text;
	"WhereConditionString" text;
	"SelectString1" text;
	"lvInd" CHARACTER VARYING(1) ;
	

BEGIN

	"SelectString" = CONCAT('SELECT * 
							FROM(SELECT 
									a."FDADataQualityRulesId",
									c."FDASystemObjectFieldsId",
									"RuleName" ,
									"RuleType" AS "RuleType",
									REPLACE("RuleSignature",''~^~'','','') AS "RuleSignature",
									"ObjectName",
									"FieldName",
									SUBSTRING("CreatedOn",1,10) "LastUsedOn",
									COALESCE(d."NumberOfException",0) AS "NumberOfException",
									c."AlertWhenTrendIncrease"
							FROM fda."FDADataQualityMasterRules" a
							INNER JOIN (SELECT 
											STRING_AGG("RuleType",'','')"RuleType",
											STRING_AGG("RuleSignature",''|'') "RuleSignature",
											"FDADataQualityRulesId"
										FROM (SELECT 
												(CASE WHEN "RuleType" IN (''Enumerated Value'',''Possible Character'',''Range of Values'',''Date Range'',''Length Check'',''Row Count Variation'') AND ("LeftFieldValue" > '''' or "RightFieldValue" > '''')
															THEN "RuleType" 
													  WHEN "RuleType" IN (''DataType Check'',''Blank/NonBlank'',''Fixed static value'',''Distinct Check'',''Enumerated Value(Query)'',''User Criteria'') AND "LeftFieldValue" > '''' 
															THEN "RuleType"  
												END) "RuleType",
												(CASE WHEN "RuleType" IN (''Enumerated Value'',''Range of Values'',''Date Range'',''Length Check'') AND "LeftFieldValue" > '''' or "RightFieldValue" > ''''
															THEN  CONCAT_WS(''-'',"RuleType","LeftFieldValue","RightFieldValue" )
													  WHEN "RuleType" IN (''DataType Check'',''Possible Character'',''Blank/NonBlank'',''Fixed static value'',''Distinct Check'',''Enumerated Value(Query)'',''User Criteria'') AND "LeftFieldValue" > '''' 
															THEN CONCAT_WS(''-'',"RuleType","LeftFieldValue","RightFieldValue" )
													  WHEN "RuleType" IN (''Possible Character'',''Row Count Variation'') AND ("LeftFieldValue" > '''' OR "RightFieldValue" > '''') 
															THEN CONCAT_WS(''-'',"RuleType","LeftFieldValue","RightFieldValue" )
												END) "RuleSignature",
										"FDADataQualityRulesId" 
											FROM fda."FDADataQualityMasterRulesDetails"
										)m
										GROUP BY "FDADataQualityRulesId") b
							ON a."FDADataQualityRulesId" = b."FDADataQualityRulesId"
							INNER JOIN (SELECT
											a."FDASystemObjectsId",
											b."FDASystemObjectFieldsId",
											b."FieldName",
											a."ObjectName",
											d."FDADataQualityRulesId",
											b."AlertWhenTrendIncrease"
										FROM fda."FDASystemObjects" a
										INNER JOIN fda."FDASystemObjectFields" b
											ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
										INNER JOIN fda."FDADataQualityMasterRuleObjectColumns" d
											ON b."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
											AND b."FDASystemsId" = d."FDASystemsId"
											AND b."FDASystemObjectsId" = d."FDASystemObjectsId"
										WHERE b."FDASystemObjectFieldsId" IN (SELECT DISTINCT b."FDASystemObjectFieldsId"
																				FROM fda."FDASystemObjectFields" b
																					INNER JOIN fda."FDADataQualityMasterRuleObjectColumns" d
																						ON b."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
																						AND b."FDASystemsId" = d."FDASystemsId"
																						AND b."FDASystemObjectsId" = d."FDASystemObjectsId"
																				where d."FDADataQualityRulesId" = ''' ,"InMasterRuleId", ''')
										)c
							ON a."FDADataQualityRulesId" = c."FDADataQualityRulesId"
							LEFT JOIN (SELECT 
											SUM("OutlierCount") AS "NumberOfException",
											"MasterRuleId"
										FROM fda."FDAObjectScoreOutlierCountByCategory"
										WHERE "LastUpdatedOn" > current_date - 30
										AND "MasterRuleId" IS NOT NULL
										GROUP BY "MasterRuleId") d
									ON a."FDADataQualityRulesId" = d."MasterRuleId"
										');
IF "InOrderByField" > '' THEN 

	"OrderBystring" := CONCAT(' ORDER BY "',"InOrderByField",'" ',"InOrderByType"
								,' OFFSET ',"InOffset",' ROWS
								FETCH NEXT ', "InLimit" , ' ROWS ONLY;');
ELSE
	"OrderBystring" :=CONCAT(' ORDER BY "ObjectName" ASC , "FieldName" ASC
								OFFSET ',"InOffset",' ROWS
								FETCH NEXT ', "InLimit" , ' ROWS ONLY;');
END IF;

IF "InObjectName" > '' OR "InFieldName" > '' THEN
	"lvInd" := 'N';	

	IF "InObjectName" > '' THEN 
		IF "lvInd" = 'N' THEN 
			"WhereConditionString" :=CONCAT("WhereConditionString",' WHERE x."ObjectName" ILIKE ''%',"InObjectName",'%'' ');
			"lvInd" := 'Y';
		ELSE	
			"WhereConditionString" :=CONCAT("WhereConditionString",'AND x."ObjectName" ILIKE ''%',"InObjectName",'%'' ');
			"lvInd" := 'Y';
		END IF;
	END IF;
	
	IF "InFieldName" > '' THEN 
		IF "lvInd" = 'N' THEN 
			"WhereConditionString" :=CONCAT("WhereConditionString",' WHERE x."FieldName" ILIKE ''%',"InFieldName",'%'' ');
			"lvInd" := 'Y';
		ELSE	
			"WhereConditionString" :=CONCAT("WhereConditionString",'AND x."FieldName" ILIKE ''%',"InFieldName",'%'' ');
			"lvInd" := 'Y';
		END IF;
	END IF;
END IF;

"SelectString1" :=CONCAT("SelectString",')x',"WhereConditionString","OrderBystring");

RAISE NOTICE 'SelectString : %',"SelectString1" ;

"SelectcCountString" :=CONCAT('SELECT COUNT(*) "OutTotalRecordCount" FROM(',"SelectString",')x ',"WhereConditionString",')y');

RAISE NOTICE 'SelectcCountString : %',"SelectcCountString" ;

RAISE NOTICE 'ORDER BY: %',"OrderBystring"; 

OPEN $9 FOR
	EXECUTE "SelectString1";
RETURN NEXT $9 ;

OPEN $10 FOR
	EXECUTE "SelectcCountString";
RETURN NEXT $10 ;
/*
select fda."Proc_ListMasterRuleObjectDetails"
(
	0,--"InOffset" int,
	20,--"InLimit" int,
	'3',--"InMasterRuleId" character varying,
	'331,5',--"InLinkedObjectId" character varying,
	'dbo.Target',--"InObjectName" character varying,
	'',--"InFieldName" character varying,
	'ObjectName',--"InOrderByField" character varying,
	'ASC',--"InOrderByType" character varying,
	'r1',--refcursor,
	'r2'--refcursor
);
fetch all in "r1";

*/

END;
$BODY$;
--------------------------------------------------------------

CREATE OR REPLACE FUNCTION fda."Proc_ListFDAEntityAttributeForRule"(
	"InOffSet" integer,
	"InLimit" integer,
	"InRuleId" integer,
	"InSystemName" character varying,
	"InEntityName" character varying,
	refcursor,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
BEGIN

"InSystemName" := UPPER("InSystemName");
--"InEntityName" := '%'||UPPER("InEntityName")||'%';
"InEntityName" := '%'||UPPER("InEntityName");

OPEN $6 FOR
SELECT DISTINCT ON("ColumnName")
		"FDASystemObjectFieldsId",
		"FDASystemObjectsId",
		"SystemAliasName",
		"TableName",
		"ColumnName",
		"UserOverwriteDatatype",
		"MasterRuleName",
		"FDADataQualityRulesId" "MasterRuleId",
		"TestRuleInd",
		"Rank"
FROM(SELECT 
	   a."FDASystemObjectFieldsId",
	   b."FDASystemObjectsId",
	   c."SystemAliasName",
	   b."ObjectName" "TableName",
	   a."FieldName" "ColumnName",
	   (CASE 
	   WHEN UPPER(COALESCE(a."UserOverwriteDatatype",a."FieldDataType")) IN ('TEXT','BOOLEAN','VARBINARY','VARCHAR','CHAR','NCHAR','VARCHAR2','STRING','NVARCHAR','NVARCHAR2','TIME','BLOB','CLOB','NCLOB') THEN 'STRING'
	   WHEN UPPER(COALESCE(a."UserOverwriteDatatype",a."FieldDataType")) IN ('INTEGER','INT','DOUBLE','SMALLINT','BIGINT','TINYINT','NUMBER','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG','DECIMAL','DECIMAL17,3','BINARY') THEN 'NUMBER'
	   WHEN UPPER(COALESCE(a."UserOverwriteDatatype",a."FieldDataType")) IN ('DATE','DATETIME','DATETIME2','TIMESTAMP','TIMESTAMP_NTZ','TIMESTAMP6') THEN 'DATE' 
	   END) "UserOverwriteDatatype",
	   COALESCE(f."RuleName",'') "MasterRuleName",
       COALESCE(d."FDADataQualityRulesId",'0') "FDADataQualityRulesId",
	   d."TestRuleInd",
	  (CASE WHEN d."FDADataQualityRulesId" = "InRuleId" THEN 1 ELSE 2 END) AS "Rank"
FROM fda."FDASystemObjectFields" a
	INNER JOIN fda."FDASystems" c
		ON a."FDASystemsId" =  c."FDASystemsId"	
	INNER JOIN fda."FDASystemObjects" b
		ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
	LEFT JOIN fda."FDADataQualityMasterRuleObjectColumns" d
		ON a."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
		AND a."FDASystemsId" = d."FDASystemsId"
		AND a."FDASystemObjectsId" = d."FDASystemObjectsId"
	LEFT JOIN fda."FDADataQualityMasterRules" f
		ON d."FDADataQualityRulesId" = f."FDADataQualityRulesId"
WHERE f."FDADataQualityRulesId" = "InRuleId"
AND UPPER(c."SystemAliasName")  = UPPER("InSystemName")
AND b."ObjectType" = 'DATA'
AND b."ObjectName" ILIKE "InEntityName"
UNION
SELECT DISTINCT
	   a."FDASystemObjectFieldsId",
	   b."FDASystemObjectsId",
	   c."SystemAliasName",
	   b."ObjectName" "TableName",
	   a."FieldName" "ColumnName",
	   (CASE 
	   WHEN UPPER(COALESCE(a."UserOverwriteDatatype",a."FieldDataType")) IN ('TEXT','BOOLEAN','VARBINARY','VARCHAR','CHAR','NCHAR','VARCHAR2','STRING','NVARCHAR','NVARCHAR2','TIME','BLOB','CLOB','NCLOB') THEN 'STRING'
	   WHEN UPPER(COALESCE(a."UserOverwriteDatatype",a."FieldDataType")) IN ('INTEGER','INT','DOUBLE','SMALLINT','BIGINT','TINYINT','NUMBER','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG','DECIMAL','DECIMAL17,3','BINARY') THEN 'NUMBER'
	   WHEN UPPER(COALESCE(a."UserOverwriteDatatype",a."FieldDataType")) IN ('DATE','DATETIME','DATETIME2','TIMESTAMP','TIMESTAMP_NTZ','TIMESTAMP6') THEN 'DATE' 
	   END) "UserOverwriteDatatype",
	   COALESCE(f."RuleName",'') "MasterRuleName",
       COALESCE(d."FDADataQualityRulesId",'0') "FDADataQualityRulesId",
	   d."TestRuleInd",
	   (CASE WHEN d."FDADataQualityRulesId" = "InRuleId" THEN 1 ELSE 2 END) AS "Rank"
FROM fda."FDASystemObjectFields" a
	INNER JOIN fda."FDASystemObjects" b
		ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
	INNER JOIN fda."FDASystems" c
		ON a."FDASystemsId" =  c."FDASystemsId"	
	LEFT JOIN fda."FDADataQualityMasterRuleObjectColumns" d
		ON a."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
		AND a."FDASystemsId" = d."FDASystemsId"
		AND a."FDASystemObjectsId" = d."FDASystemObjectsId"
	LEFT JOIN fda."FDADataQualityMasterRules" f
		ON d."FDADataQualityRulesId" = f."FDADataQualityRulesId"
WHERE a."FDASystemObjectFieldsId" NOT IN ( SELECT d."FDASystemObjectFieldsId"
											FROM fda."FDADataQualityMasterRuleObjectColumns" d
											WHERE d."FDADataQualityRulesId" = "InRuleId"
											) 
AND UPPER(c."SystemAliasName")   = UPPER("InSystemName")
AND b."ObjectType" = 'DATA'
AND b."ObjectName"  ILIKE "InEntityName"
)x
ORDER BY "ColumnName","Rank" ASC
OFFSET "InOffSet" ROWS
	FETCH NEXT "InLimit" ROWS ONLY;
RETURN NEXT $6;

OPEN $7 FOR
SELECT DISTINCT COUNT(*) as "OutTotalRecordCount"
FROM(SELECT 
	   a."FDASystemObjectFieldsId",
	   b."FDASystemObjectsId",
	   c."SystemAliasName",
	   b."ObjectName" "TableName",
	   a."FieldName" "ColumnName",
	   (CASE 
	   WHEN UPPER(COALESCE(a."UserOverwriteDatatype",a."FieldDataType")) IN ('TEXT','BOOLEAN','VARBINARY','VARCHAR','CHAR','NCHAR','VARCHAR2','STRING','NVARCHAR','NVARCHAR2','TIME','BLOB','CLOB','NCLOB') THEN 'STRING'
	   WHEN UPPER(COALESCE(a."UserOverwriteDatatype",a."FieldDataType")) IN ('INTEGER','INT','DOUBLE','SMALLINT','BIGINT','TINYINT','NUMBER','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG','DECIMAL','DECIMAL17,3','BINARY') THEN 'NUMBER'
	   WHEN UPPER(COALESCE(a."UserOverwriteDatatype",a."FieldDataType")) IN ('DATE','DATETIME','DATETIME2','TIMESTAMP','TIMESTAMP_NTZ','TIMESTAMP6') THEN 'DATE' 
	   END) "UserOverwriteDatatype",
	   COALESCE(f."RuleName",'') "MasterRuleName",
       COALESCE(d."FDADataQualityRulesId",'0') "FDADataQualityRulesId",
	   d."TestRuleInd",
	   (CASE WHEN d."FDADataQualityRulesId" = "InRuleId" THEN 1 ELSE 2 END) AS "Rank" 
FROM fda."FDASystemObjectFields" a
	INNER JOIN fda."FDASystemObjects" b
		ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
	INNER JOIN fda."FDASystems" c
		ON a."FDASystemsId" =  c."FDASystemsId"
	LEFT JOIN fda."FDADataQualityMasterRuleObjectColumns" d
		ON a."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
		AND a."FDASystemsId" = d."FDASystemsId"
		AND a."FDASystemObjectsId" = d."FDASystemObjectsId"
	LEFT JOIN fda."FDADataQualityMasterRules" f
		ON d."FDADataQualityRulesId" = f."FDADataQualityRulesId"
WHERE f."FDADataQualityRulesId" = "InRuleId"
AND UPPER(c."SystemAliasName")  = UPPER("InSystemName")
AND b."ObjectType" = 'DATA'
AND b."ObjectName" ILIKE "InEntityName"
UNION
SELECT DISTINCT
	   a."FDASystemObjectFieldsId",
	   b."FDASystemObjectsId",
	   c."SystemAliasName",
	   b."ObjectName" "TableName",
	   a."FieldName" "ColumnName",
	   (CASE 
	   WHEN UPPER(COALESCE(a."UserOverwriteDatatype",a."FieldDataType")) IN ('TEXT','BOOLEAN','VARBINARY','VARCHAR','CHAR','NCHAR','VARCHAR2','STRING','NVARCHAR','NVARCHAR2','TIME','BLOB','CLOB','NCLOB') THEN 'STRING'
	   WHEN UPPER(COALESCE(a."UserOverwriteDatatype",a."FieldDataType")) IN ('INTEGER','INT','DOUBLE','SMALLINT','BIGINT','TINYINT','NUMBER','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG','DECIMAL','DECIMAL17,3','BINARY') THEN 'NUMBER'
	   WHEN UPPER(COALESCE(a."UserOverwriteDatatype",a."FieldDataType")) IN ('DATE','DATETIME','DATETIME2','TIMESTAMP','TIMESTAMP_NTZ','TIMESTAMP6') THEN 'DATE' 
	   END) "UserOverwriteDatatype",
	   COALESCE(f."RuleName",'') "MasterRuleName",
       COALESCE(d."FDADataQualityRulesId",'0') "FDADataQualityRulesId",
	   d."TestRuleInd",
	  (CASE WHEN d."FDADataQualityRulesId" = "InRuleId" THEN 1 ELSE 2 END) AS "Rank"
FROM fda."FDASystemObjectFields" a
	INNER JOIN fda."FDASystemObjects" b
		ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
	INNER JOIN fda."FDASystems" c
		ON a."FDASystemsId" =  c."FDASystemsId"
	LEFT JOIN fda."FDADataQualityMasterRuleObjectColumns" d
		ON a."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
		AND a."FDASystemsId" = d."FDASystemsId"
		AND a."FDASystemObjectsId" = d."FDASystemObjectsId"
	LEFT JOIN fda."FDADataQualityMasterRules" f
		ON d."FDADataQualityRulesId" = f."FDADataQualityRulesId"
WHERE a."FDASystemObjectFieldsId" NOT IN ( SELECT d."FDASystemObjectFieldsId"
									FROM fda."FDADataQualityMasterRuleObjectColumns" d
									WHERE d."FDADataQualityRulesId" = "InRuleId") 
AND UPPER(c."SystemAliasName")   = UPPER("InSystemName")
AND b."ObjectType" = 'DATA'
AND b."ObjectName"  ILIKE "InEntityName"
)x;
RETURN NEXT $7;

END;
$BODY$;

----------------------------------------------------------------

CREATE OR REPLACE FUNCTION fda."Proc_UpdateAttributeMasterRules"(
	"InFieldData" text,
	"InRuleName" character varying,
	"InRuleId" character varying,
	"InUpdatedBy" character varying)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE "lvFieldId" INT ;
BEGIN

--"InFieldData" :=(SELECT REPLACE(REPLACE(REPLACE(CAST("InFieldData" AS TEXT),'(',''),')',''),'"',''));

SELECT COUNT(*)
INTO "lvFieldId"
FROM(SELECT 
  		SPLIT_PART("Data",'(^)',1) :: INT AS "FieldId",
		SPLIT_PART("Data",'(^)',2) AS "TestInd"
	FROM UNNEST(STRING_TO_ARRAY("InFieldData",'|')) "Data"
	WHERE "Data" IS NOT NULL)x;
	
-- First DELETE and Then Re-insert

DELETE FROM fda."FDADataQualityMasterRuleObjectColumns"
	WHERE "FDADataQualityRulesId" = "InRuleId"::bigint ;
	
INSERT INTO fda."FDADataQualityMasterRuleObjectColumns"
			(
				"FDADataQualityRulesId",
				"FDASystemsId",
				"FDASystemObjectsId",
				"FDASystemObjectFieldsId",
				"TestRuleInd",
				"CreatedBy",
				"CreationOn"
			)
SELECT "InRuleId"::bigint,
		b."FDASystemsId",
		b."FDASystemObjectsId",
		b."FDASystemObjectFieldsId",
		c."TestInd",
		CURRENT_TIMESTAMP,
		"InUpdatedBy"
FROM fda."FDASystemObjectFields" b
	INNER JOIN (SELECT 
			SPLIT_PART("Data",'(^)',1) :: INT AS "FieldId",
			SPLIT_PART("Data",'(^)',2) AS "TestInd"
		FROM UNNEST(STRING_TO_ARRAY("InFieldData",'|')) "Data"
		WHERE "Data" IS NOT NULL
		) c
	ON b."FDASystemObjectFieldsId" = c."FieldId";

IF COALESCE("InFieldData",'') > '' AND "lvFieldId" >= 1 
THEN

	UPDATE fda."FDASystemObjectFields" a
	SET "AutoMetricsInd" = 'true',
		"LastUpdatedOn" = CURRENT_TIMESTAMP
	FROM (SELECT 
		  		SPLIT_PART("Data",'(^)',1) :: INT AS "FieldId",
				SPLIT_PART("Data",'(^)',2) AS "TestInd"
			FROM UNNEST(STRING_TO_ARRAY("InFieldData",'|')) "Data"
			WHERE "Data" IS NOT NULL ) b
	WHERE a."FDASystemObjectFieldsId" = b."FieldId" ;

END IF;	

UPDATE fda."FDASystemObjectFields"
SET "AutoMetricsInd" = NULL,
	"LastUpdatedOn" = CURRENT_TIMESTAMP
WHERE "FDASystemObjectFieldsId" NOT IN (SELECT "FDASystemObjectFieldsId"
									FROM fda."FDADataQualityMasterRuleObjectColumns" );

END;
$BODY$;

------------------------------------------------------------

CREATE OR REPLACE FUNCTION fda."Proc_ListFDAEntityAttributeDataType"(
	"InOffSet" integer,
	"InLimit" integer,
	"InOrderByColumn" character varying,
	"InOrderBy" character varying,
	"InTabInd" character varying,
	"InSystemName" character varying,
	"InEntityName" character varying,
	"InUserEntityNameInput" character varying,
	"InAttributeName" character varying,
	"InDataType" character varying,
	"InUserFriendlyFieldName" character varying,
	"InUserFriendlyEntityName" character varying,
	"InComment" character varying,
	"InIsNullPossible" character varying,
	"InCharacterMAXimumLength" character varying,
	"InColumnPrecision" character varying,
	"InIsSecured" character varying,
	"InIsGDPRRelevant" character varying,
	"InOwner" character varying,
	"InRefreshFrequency" character varying,
	"InRefreshBy" character varying,
	"InSegmentedBy" character varying,
	refcursor,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
DECLARE "ParmDefinition" VARCHAR(500);
		"lvQuerySelect" TEXT;
		"lvQuerySelectColumn" TEXT;
		"lvQuerySelectTable" TEXT;
		"OrderByString" TEXT;
		"lvQuerySelectCount" TEXT;
		"TotalRowCount" INT;
		"lvWhereClause" TEXT;
		"lvQuerySelect3" TEXT;
		"lvAlertId" VARCHAR(100) ;
		"lvInd1" VARCHAR(5)='N';

DECLARE "lvExecutionId" BIGINT;

--a.ColumnPrecision,
BEGIN

"InSystemName" := UPPER("InSystemName");
"InEntityName" := UPPER("InEntityName");
"InUserEntityNameInput" := UPPER("InUserEntityNameInput");
"InAttributeName" := UPPER("InAttributeName");
"InDataType" := UPPER("InDataType");
"InUserFriendlyFieldName" := UPPER("InUserFriendlyFieldName");
"InUserFriendlyEntityName" := UPPER("InUserFriendlyEntityName");
"InComment" := UPPER("InComment");
"InIsNullPossible" := UPPER("InIsNullPossible");
"InCharacterMAXimumLength" := UPPER("InCharacterMAXimumLength");
"InColumnPrecision" := UPPER("InColumnPrecision");
"InIsSecured" := UPPER("InIsSecured");
"InIsGDPRRelevant" := UPPER("InIsGDPRRelevant");
"InOwner" := UPPER("InOwner");
"InTabInd" := UPPER("InTabInd");
"InRefreshFrequency" := UPPER("InRefreshFrequency");
"InRefreshBy" := UPPER("InRefreshBy");
"InSegmentedBy" := UPPER("InSegmentedBy");

IF COALESCE("InTabInd",'') = 'ATTRIBUTE' THEN

"lvQuerySelectColumn" := '
	SELECT *
	FROM(
	   SELECT DISTINCT
	   a."FDASystemObjectFieldsId",
	   b."FDASystemObjectsId",
	   /*(SELECT COALESCE(SUM(COALESCE(NULLIF("a"::TEXT,'''')::BIGINT,0)),0)
			FROM
			   (SELECT CASE WHEN "RuleName" <> ''Auto Outlier'' THEN
							(CASE WHEN "SegmentedRuleInd" = ''N''  
								THEN  COUNT(CASE WHEN l."LeftFieldValue" IS NOT NULL  AND l."RightFieldValue" IS NOT NULL 
												 THEN l."FDASystemObjectFieldsId"::TEXT 
											ELSE (CASE  WHEN l."LeftFieldValue" IS NOT NULL  AND l."RightFieldValue" IS  NULL 
														THEN l."LeftFieldValue"
														ELSE (CASE  WHEN l."LeftFieldValue" IS  NULL  AND l."RightFieldValue" IS NOT NULL 
																	THEN l."RightFieldValue" 
															  END) 
												   END)
											END) 
							ELSE                                                             
								COUNT(DISTINCT CASE WHEN l."LeftFieldValue" IS NOT NULL  AND l."RightFieldValue" IS NOT NULL 
													THEN l."SegmentedByFieldName"::TEXT 
													ELSE (CASE  WHEN l."LeftFieldValue" IS NOT NULL  AND l."RightFieldValue" IS  NULL 
																THEN l."LeftFieldValue"
																ELSE (CASE  WHEN l."LeftFieldValue" IS  NULL  AND l."RightFieldValue" IS NOT NULL
																			THEN l."RightFieldValue" 
																	  END) 
														   END)
									    END) 
							END)
					ELSE 1 END "a" 					
                FROM  fda."FDAEntityAttributeSegmentRules" l
                WHERE "FDASystemObjectFieldsId"= a."FDASystemObjectFieldsId"
                GROUP BY "SegmentedRuleInd","RuleName")x) "RuleCount",*/
				COALESCE(e."RuleCount",0) AS "RuleCount" ,
	   b."ObjectName" "TableName",
	   a."FieldName" "ColumnName",
       UPPER(a."FieldDataType") "ColumnDataType",
	   (CASE 
	   WHEN UPPER(a."FieldDataType") IN (''TEXT'',''BOOLEAN'',''VARBINARY'',''CHAR'',''VARCHAR'',''NCHAR'',''VARCHAR2'',''STRING'',''NVARCHAR'',''NVARCHAR2'',''TIME'',''BLOB'',''CLOB'',''NCLOB'') THEN ''STRING''
	   WHEN UPPER(a."FieldDataType") IN (''BIT'',''FLOAT'',''FLOAT64'',''INT16'',''INT32'',''INT64'',''BIGNUMERIC'',''INTEGER'',''BINARY'',''INT'',''DOUBLE'',''SMALLINT'',''BIGINT'',''TINYINT'',''NUMBER'',''NUMERIC'',''FLOAT'',''BINARY_FLOAT'',''BINARY_DOUBLE'',''LONG'',''DECIMAL'',''DECIMAL17,3'') THEN ''NUMBER''
	   WHEN UPPER(a."FieldDataType") IN (''DATE'',''DATETIME'',''DATETIME2'',''TIMESTAMP'',''TIMESTAMP_NTZ'',''TIMESTAMP6'') THEN ''DATE''
	   ELSE '''' 
	   END) "TYPE",
	   (CASE 
	   WHEN UPPER(COALESCE(a."UserOverwriteDatatype",a."FieldDataType")) IN (''TEXT'',''BOOLEAN'',''VARBINARY'',''VARCHAR'',''CHAR'',''NCHAR'',''VARCHAR2'',''STRING'',''NVARCHAR'',''NVARCHAR2'',''TIME'',''BLOB'',''CLOB'',''NCLOB'') THEN ''STRING''
	   WHEN UPPER(COALESCE(a."UserOverwriteDatatype",a."FieldDataType")) IN (''BIT'',''FLOAT'',''FLOAT64'',''INT16'',''INT32'',''INT64'',''BIGNUMERIC'',''INTEGER'',''BINARY'',''INT'',''DOUBLE'',''SMALLINT'',''BIGINT'',''TINYINT'',''NUMBER'',''NUMERIC'',''FLOAT'',''BINARY_FLOAT'',''BINARY_DOUBLE'',''LONG'',''DECIMAL'',''DECIMAL17,3'') THEN ''NUMBER''
	   WHEN UPPER(COALESCE(a."UserOverwriteDatatype",a."FieldDataType")) IN (''DATE'',''DATETIME'',''DATETIME2'',''TIMESTAMP'',''TIMESTAMP_NTZ'',''TIMESTAMP6'') THEN ''DATE'' 
	   END) "UserOverwriteDatatype",
	   ---a."IsNullPossible",
       (CASE WHEN a."IsNullPossible" = ''Y'' THEN  ''YES''
		WHEN a."IsNullPossible" = ''N'' THEN  ''NO''
		ELSE a."IsNullPossible" END) "IsNullPossible",
       a."CharacterMaximumLength",
	   (CASE 
	   WHEN a."FieldDataType" IN (''TEXT'',''VARBINARY'',''VARCHAR'',''VARCHAR2'',''STRING'',''CHAR'',''NCHAR'',''NVARCHAR'',''NVARCHAR2'',''BLOB'',''CLOB'',''NCLOB'',''BOOLEAN'') THEN a."CharacterMaximumLength"
	   WHEN a."FieldDataType" IN (''BIT'',''FLOAT'',''FLOAT64'',''INT16'',''INT32'',''INT64'',''BIGNUMERIC'',''INT'',''BINARY'',''DOUBLE'',''SMALLINT'',''BIGINT'',''TINYINT'',''NUMBER'',''NUMERIC'',''DECIMAL'',''FLOAT'',''BINARY_FLOAT'',''BINARY_DOUBLE'',''LONG'') THEN a."ColumnPrecision"
	   WHEN a."FieldDataType" IN (''DATE'',''DATETIME'',''DATETIME2'',''TIME'',''TIMESTAMP'',''TIMESTAMP_NTZ'',''TIMESTAMP6'') THEN a."CharacterMaximumLength"
	   WHEN a."FieldDataType" = ''INTEGER'' THEN (CASE WHEN a."ColumnPrecision" = '''' OR a."ColumnPrecision" IS NULL THEN ''0'' ELSE a."ColumnPrecision" END)
	   ELSE CONCAT(''('','')'') 
	   END) "ColumnPrecision",
       
       b."UserFriendlyObjectName" "LogicalObjectName",
       a."UserFriendlyFieldName" "LogicalFieldName",
       a."Comment",
       a."IsSecured",
       a."IsGDPRRelevant",
       COALESCE(a."Owner",b."Owner",c."SystemOwner") "Owner",
	   '''' "MasterRuleName",
       ''0'' "MasterRuleId",
	   (CASE WHEN a."AutoMetricsInd" = ''true'' THEN a."AutoMetricsInd" ELSE NULL END)  "AutoMetricsInd",
	   COALESCE(a."SegmentedBy",'''') "SegmentedBy",
	   (CASE WHEN COALESCE(d."SegmentedByFieldName",'''') > '''' THEN ''true'' ELSE NULL END) "SegmentedRuleInd",
		NULL "TestRuleInd" ';

"lvQuerySelectTable" := ' FROM fda."FDASystemObjectFields" a
INNER JOIN fda."FDASystemObjects" b
	ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
INNER JOIN fda."FDASystems" c
	ON a."FDASystemsId" =  c."FDASystemsId"	
LEFT OUTER JOIN (SELECT DISTINCT "FDASystemObjectFieldsId",
					"SegmentedByFieldName"
				FROM fda."FDAEntityAttributeSegmentRules" 
				WHERE COALESCE("SegmentedByFieldName",'''') > '''') d
ON a."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"

LEFT JOIN (SELECT COUNT(*) "RuleCount",
				x."FDASystemObjectFieldsId"
			FROM fda."FDADataQualityMasterRuleObjectColumns" x
			GROUP BY x."FDASystemObjectFieldsId"
			) e 
		ON a."FDASystemObjectFieldsId" = e."FDASystemObjectFieldsId" '; 

ELSE IF COALESCE("InTabInd",'') = 'ENTITY' THEN

"lvQuerySelectColumn" := '
	SELECT *
	FROM(
	   SELECT DISTINCT
	   a."FDASystemObjectsId",
	   a."ObjectName" "TableName",
	   ''TABLE'' AS "ObjectType",
       a."UserFriendlyObjectName" "LogicalObjectName",
       a."Comment",
       COALESCE(a."Owner",c."SystemOwner") AS "Owner",
	   a."ObjectGroup",
	   (CASE WHEN a."AutoMetricsInd" = ''true'' THEN a."AutoMetricsInd" ELSE NULL END)  "AutoMetricsInd",
	   (CASE WHEN a."BasicScoreInd" = ''true'' THEN a."BasicScoreInd" ELSE NULL END)  "BasicScoreInd",
	   (CASE WHEN a."AdvanceScoreInd" = ''true'' THEN a."AdvanceScoreInd" ELSE NULL END)  "AdvanceScoreInd",
	   (CASE WHEN COALESCE(d."SegmentedByFieldName",'''') > '''' THEN ''true'' ELSE NULL END) "SegmentedRuleInd",
	   COALESCE(a."SegmentedBy",'''') "SegmentedBy",
	   COALESCE(a."RefreshFrequency",'''') "RefreshFrequency",
	   (CASE WHEN  NULLIF(TO_CHAR(a."RefreshTime",''HH12:MI AM''),'''') is  NULL THEN ''''
		WHEN  NULLIF(TO_CHAR(a."RefreshTime",''HH12:MI AM''),'''') IS NOT  NULL THEN 
			CONCAT(NULLIF(TO_CHAR(a."RefreshTime",''HH12:MI AM''),''''),'' CST'')  
		END) "RefreshBy"
	';
	
"lvQuerySelectTable" := ' FROM fda."FDASystemObjects" a
INNER JOIN fda."FDASystems" c
	ON a."FDASystemsId" =  c."FDASystemsId"
LEFT OUTER JOIN fda."FDAEntityAttributeSegmentRules" d
	ON a."FDASystemObjectsId" = d."FDASystemObjectId"
	AND COALESCE(d."FDASystemObjectFieldsId",0) = 0 ';

END IF;
END IF;

RAISE NOTICE 'InTabInd: %',"InTabInd";
RAISE NOTICE 'lvInd1: %',"lvInd1";

/*
"lvQuerySelectTable" := ' FROM fda."FDASystemObjectFields" a
INNER JOIN fda."FDASystemObjects" b
ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
INNER JOIN fda."FDASystems" c
ON a."FDASystemsId" =  c."FDASystemsId"
LEFT OUTER JOIN fda."FDAEntityAttributeSegmentRules" d
ON a."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId" ';
*/
-------------
IF COALESCE("InTabInd",'') = 'ATTRIBUTE' THEN

IF  "InSystemName"  > '' OR  "InSystemName"  = '' OR "InEntityName"  > '' OR "InUserEntityNameInput" > '' OR "InAttributeName"  > '' 
OR "InDataType" > '' OR "InUserFriendlyFieldName"  > '' OR "InUserFriendlyEntityName"  > ''  OR "InComment" > '' 
OR "InIsNullPossible" > '' OR "InCharacterMAXimumLength" > '' OR "InColumnPrecision" > '' OR "InIsSecured" > '' 
OR "InIsGDPRRelevant" > '' OR "InOwner" > '' OR "InRefreshFrequency" > '' OR "InRefreshBy" > '' OR "InSegmentedBy" > '' OR "InTabInd" > ''

THEN
	 "lvWhereClause" := ' WHERE  "ObjectType" = ''DATA'' AND UPPER(a."ObsoleteInMetaDataInd") <> ''DELETED'' AND'; 
	
	IF "InSystemName" = ''
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(c."SystemAliasName")  LIKE ''%',"InSystemName",'%'' ');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",'  UPPER(c."SystemAliasName")  LIKE ''%',"InSystemName",'%'' ');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;
	  
	  IF "InSystemName" > ''
	  THEN
	  RAISE NOTICE 'lvInd1: %',"lvInd1";
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(c."SystemAliasName")  = ''',"InSystemName",''' ');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",'  UPPER(c."SystemAliasName")  = ''',"InSystemName",''' ');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;
	  
	  IF "InUserEntityNameInput" > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(b."ObjectName")  LIKE ''%',"InUserEntityNameInput",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(b."ObjectName")  LIKE ''%',"InUserEntityNameInput",'%''');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;
	  
	  IF "InEntityName" > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(b."ObjectName")  = ''',"InEntityName",''' ');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(b."ObjectName")  = ''',"InEntityName",''' ');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;
	  
	  IF "InAttributeName" > ''
	  THEN
	  
	  	  RAISE NOTICE 'lvInd1: %',"lvInd1";
		  
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(a."FieldName") LIKE ''%',"InAttributeName",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(a."FieldName") LIKE ''%',"InAttributeName",'%''');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;
	  IF "InDataType" > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(a."FieldDataType") LIKE ''%',"InDataType",'%'' ');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(a."FieldDataType") LIKE ''%',"InDataType",'%'' ');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;

	  IF "InUserFriendlyFieldName" > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(a."UserFriendlyFieldName") LIKE ''%',"InUserFriendlyFieldName",'%'' ');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(a."UserFriendlyFieldName") LIKE ''%',"InUserFriendlyFieldName",'%'' ');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;

	  IF "InUserFriendlyEntityName"  > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
				"lvWhereClause" := CONCAT("lvWhereClause", '  AND UPPER(b."UserFriendlyObjectName") LIKE ''%',"InUserFriendlyEntityName",'%'' ');
		ELSE IF "lvInd1" = 'N' THEN
				"lvWhereClause" := CONCAT("lvWhereClause", ' UPPER(b."UserFriendlyObjectName") LIKE ''%',"InUserFriendlyEntityName",'%'' ');
			    "lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;

	  IF "InComment" > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
				"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(a."Comment") LIKE ''%',"InComment",'%'' ');
		ELSE IF "lvInd1" = 'N' THEN
				"lvWhereClause" := CONCAT("lvWhereClause", ' UPPER(a."Comment") LIKE ''%',"InComment",'%'' ');
			    "lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;

	  	IF "InIsNullPossible" > ''
	 THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND (CASE WHEN a."IsNullPossible" = ''Y'' THEN  ''YES'' WHEN a."IsNullPossible" = ''N'' THEN  ''NO''
										ELSE a."IsNullPossible" END) LIKE ''%',"InIsNullPossible",'%''');
	   ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' (CASE WHEN a."IsNullPossible" = ''Y'' THEN  ''YES'' WHEN a."IsNullPossible" = ''N'' THEN  ''NO''
										ELSE a."IsNullPossible" END) LIKE ''%',"InIsNullPossible",'%''');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;
	IF "InCharacterMAXimumLength" > ''
	 THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND a."CharacterMaximumLength" LIKE ''%',"InCharacterMAXimumLength",'%''');
	   ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' a."CharacterMaximumLength" LIKE ''%',"InCharacterMAXimumLength",'%''');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;

   IF "InColumnPrecision" > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND a."ColumnPrecision" LIKE ''%',"InColumnPrecision",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' a."ColumnPrecision" LIKE ''%',"InColumnPrecision",'%''');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;

  IF "InIsSecured" > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND a."IsSecured" LIKE ''%',"InIsSecured",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' a."IsSecured" LIKE ''%',"InIsSecured",'%''');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;

  IF "InIsGDPRRelevant" > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", 'AND a."IsGDPRRelevant" LIKE ''%',"InIsGDPRRelevant",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' a."IsGDPRRelevant" LIKE ''%',"InIsGDPRRelevant",'%''');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;

	IF "InOwner" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(COALESCE(a."Owner",b."Owner",c."SystemOwner")) LIKE UPPER(''%',"InOwner",'%'')');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(COALESCE(a."Owner",b."Owner",c."SystemOwner")) LIKE UPPER(''%',"InOwner",'%'')');
			"lvInd1" := 'Y';
    END IF;
      END IF;
	  END IF;
	  
	  IF "InRefreshFrequency" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(b."RefreshFrequency") LIKE ''%',"InRefreshFrequency",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(b."RefreshFrequency") LIKE ''%',"InRefreshFrequency",'%''');
			"lvInd1" := 'Y';
    END IF;
      END IF;
	  END IF;
	  
	    IF "InRefreshBy" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND TO_CHAR(b."RefreshTime",''HH:MM'') LIKE ''%',"InRefreshBy",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' TO_CHAR(b."RefreshTime",''HH:MM'') LIKE ''%',"InRefreshBy",'%''');
			"lvInd1" := 'Y';
    END IF;
      END IF;
	  END IF;
	  
	  IF "InSegmentedBy" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(COALESCE(a."SegmentedBy",''''))  LIKE ''%',"InSegmentedBy",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(COALESCE(a."SegmentedBy",'''')) LIKE ''%',"InSegmentedBy",'%''');
			"lvInd1" := 'Y';
    END IF;
      END IF;
	  END IF;
  
	 
END IF;

ELSE IF COALESCE("InTabInd",'') = 'ENTITY' THEN

IF  "InSystemName"  > '' OR "InSystemName" = '' OR  "InEntityName"  > '' OR "InUserEntityNameInput" > '' OR "InAttributeName"  > '' 
OR "InDataType" > '' OR "InUserFriendlyFieldName"  > '' OR "InUserFriendlyEntityName"  > ''  OR "InComment" > '' 
OR "InIsNullPossible" > '' OR "InCharacterMAXimumLength" > '' OR "InColumnPrecision" > '' OR "InIsSecured" > '' 
OR "InIsGDPRRelevant" > '' OR "InOwner" > '' OR "InRefreshFrequency" > '' OR "InRefreshBy" > '' OR "InSegmentedBy" > '' OR "InTabInd" > ''

THEN
	 "lvWhereClause" := ' WHERE  "ObjectType" = ''DATA'' AND ';
	IF "InSystemName" = ''
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(c."SystemAliasName")  = ''',"InSystemName",''' ');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",'  UPPER(c."SystemAliasName")  = ''',"InSystemName",''' ');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;
	  IF "InSystemName" = ''
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(c."SystemAliasName")  = ''',"InSystemName",''' ');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",'  UPPER(c."SystemAliasName")  = ''',"InSystemName",''' ');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;
	  
	  
	  IF "InSystemName" > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(c."SystemAliasName")  = ''',"InSystemName",''' ');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",'  UPPER(c."SystemAliasName")  = ''',"InSystemName",''' ');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;
	  
	  IF "InUserEntityNameInput" > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(a."ObjectName")  LIKE ''%',"InUserEntityNameInput",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(a."ObjectName")  LIKE ''%',"InUserEntityNameInput",'%''');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;
	  
	  IF "InEntityName" > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(a."ObjectName")  = ''',"InEntityName",''' ');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(a."ObjectName")  = ''',"InEntityName",''' ');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;

	  IF "InAttributeName" > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(a."FieldName") LIKE ''%',"InAttributeName",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(a."FieldName") LIKE ''%',"InAttributeName",'%''');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;
	  IF "InDataType" > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(a."FieldDataType") LIKE ''%',"InDataType",'%'' ');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(a."FieldDataType") LIKE ''%',"InDataType",'%'' ');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;

	  IF "InUserFriendlyFieldName" > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(a."UserFriendlyFieldName") LIKE ''%',"InUserFriendlyFieldName",'%'' ');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(a."UserFriendlyFieldName") LIKE ''%',"InUserFriendlyFieldName",'%'' ');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;

	  IF "InUserFriendlyEntityName"  > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
				"lvWhereClause" := CONCAT("lvWhereClause", '  AND UPPER(a."UserFriendlyObjectName") LIKE ''%',"InUserFriendlyEntityName",'%'' ');
		ELSE IF "lvInd1" = 'N' THEN
				"lvWhereClause" := CONCAT("lvWhereClause", ' UPPER(a."UserFriendlyObjectName") LIKE ''%',"InUserFriendlyEntityName",'%'' ');
			    "lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;

	  IF "InComment" > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
				"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(a."Comment") LIKE ''%',"InComment",'%'' ');
		ELSE IF "lvInd1" = 'N' THEN
				"lvWhereClause" := CONCAT("lvWhereClause", ' UPPER(a."Comment") LIKE ''%',"InComment",'%'' ');
			    "lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;

	  	IF "InIsNullPossible" > ''
	 THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND a."IsNullPossible" LIKE ''%',"InIsNullPossible",'%''');
	   ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' a."IsNullPossible" LIKE ''%',"InIsNullPossible",'%''');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;
	IF "InCharacterMAXimumLength" > ''
	 THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND a."CharacterMaximumLength" LIKE ''%',"InCharacterMAXimumLength",'%''');
	   ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' a."CharacterMaximumLength" LIKE ''%',"InCharacterMAXimumLength",'%''');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;

   IF "InColumnPrecision" > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND a."ColumnPrecision" LIKE ''%',"InColumnPrecision",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' a."ColumnPrecision" LIKE ''%',"InColumnPrecision",'%''');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;

  IF "InIsSecured" > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND a."IsSecured" LIKE ''%',"InIsSecured",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' a."IsSecured" LIKE ''%',"InIsSecured",'%''');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;

  IF "InIsGDPRRelevant" > ''
	  THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", 'AND a."IsGDPRRelevant" LIKE ''%',"InIsGDPRRelevant",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' a."IsGDPRRelevant" LIKE ''%',"InIsGDPRRelevant",'%''');
			"lvInd1" := 'Y';
      END IF;
      END IF;
	  END IF;

	IF "InOwner" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(COALESCE(a."Owner",c."SystemOwner")) LIKE UPPER(''%',"InOwner",'%'')');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(COALESCE(a."Owner",c."SystemOwner")) LIKE UPPER(''%',"InOwner",'%'')');
			"lvInd1" := 'Y';
    END IF;
      END IF;
	  END IF;
	  
	  IF "InRefreshFrequency" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(a."RefreshFrequency") LIKE ''%',"InRefreshFrequency",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(a."RefreshFrequency") LIKE ''%',"InRefreshFrequency",'%''');
			"lvInd1" := 'Y';
    END IF;
      END IF;
	  END IF;
	  
	    IF "InRefreshBy" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND TO_CHAR(a."RefreshTime",''HH:MM'') LIKE ''%',"InRefreshBy",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' TO_CHAR(a."RefreshTime",''HH:MM'') LIKE ''%',"InRefreshBy",'%''');
			"lvInd1" := 'Y';
    END IF;
      END IF;
	  END IF;
	  
	    IF "InSegmentedBy" > '' THEN
		IF "lvInd1" = 'Y' THEN
			"lvWhereClause" := CONCAT("lvWhereClause", ' AND UPPER(COALESCE(a."SegmentedBy",'''')) LIKE ''%',"InSegmentedBy",'%''');
		ELSE IF "lvInd1" = 'N' THEN
	  		"lvWhereClause" := CONCAT("lvWhereClause",' UPPER(COALESCE(a."SegmentedBy",'''')) LIKE ''%',"InSegmentedBy",'%''');
			"lvInd1" := 'Y';
    END IF;
      END IF;
	  END IF;
  
	 
END IF;

END IF;
END IF;

----------------

	"OrderByString" := CASE WHEN "InOrderByColumn" > '' AND "InOrderBy" > '' THEN
	CONCAT(' ORDER BY "',"InOrderByColumn",'"  ',"InOrderBy",'
	OFFSET ',"InOffSet",' ROWS
	FETCH NEXT ',"InLimit",' ROWS ONLY ')
	WHEN "InOrderByColumn" = '' 
	THEN '
	ORDER BY "FDASystemObjectsId" DESC
	OFFSET '||"InOffSet"||' ROWS
	FETCH NEXT '||"InLimit"||' ROWS ONLY'
	
	END;

	"lvQuerySelect" := CONCAT("lvQuerySelect","lvQuerySelectColumn", "lvQuerySelectTable", "lvWhereClause",') x ', "OrderByString");

RAISE NOTICE 'lvQuerySelect: %',"lvQuerySelect"; 

	"lvQuerySelectCount" := CONCAT('SELECT COUNT(*) AS "OutTotalRecordCount"', "lvQuerySelectTable" , "lvWhereClause");

RAISE NOTICE 'lvQuerySelectCount: %',"lvQuerySelectCount";

 OPEN $23 FOR
   EXECUTE "lvQuerySelect";
 RETURN NEXT $23;
 OPEN $24 FOR
   EXECUTE "lvQuerySelectCount";
 RETURN NEXT $24;
/*
SELECT fda."Proc_ListFDAEntityAttributeDataType"(
	0,--"InOffSet" integer,
	10,--"InLimit" integer,
	'',--"InOrderByColumn" character varying,
	'',--"InOrderBy" character varying,
	'ENTITY',--"InTabInd" character varying,
	'',--"InSystemName" character varying,
	'',--"InEntityName" character varying,
	'',--"InUserEntityNameInput" character varying,
	'',--"InAttributeName" character varying,
	'',--"InDataType" character varying,
	'',--"InUserFriendlyFieldName" character varying,
	'',--"InUserFriendlyEntityName" character varying,
	'',--"InComment" character varying,
	'',--"InIsNullPossible" character varying,
	'',--"InCharacterMAXimumLength" character varying,
	'',--"InColumnPrecision" character varying,
	'',--"InIsSecured" character varying,
	'',--"InIsGDPRRelevant" character varying,
	'',--"InOwner" character varying,
	'',--"InRefreshFrequency" character varying,
	'',--"InRefreshBy" character varying,
    '',--"InSegmentedBy" character varying,
	'R1',--refcursor,
	'R2');--refcursor
	FETCH ALL IN "R1";
	FETCH ALL IN "R2";

*/
END;
$BODY$;

---------------------------------------------

CREATE OR REPLACE FUNCTION fda."Proc_ListMaintainDataQuality"(
	"InOffset" bigint,
	"InLimit" bigint,
	"InOrderBy" character varying,
	"InOredrByType" character varying,
	"InQualityRulesId" character varying,
	"InRuleName" character varying,
	"InRuleType" character varying,
	"InSystemName" character varying,
	"InRuleDescription" text,
	"InObjectName" character varying,
	"InFieldName" character varying,
	"InDAMADimension" character varying,
	refcursor,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$

DECLARE "InSearchInputLike" VARCHAR;
DECLARE "SelectString1" TEXT;
DECLARE "SelectString" TEXT;
DECLARE "FromString" TEXT;
DECLARE "lvInd" CHARACTER VARYING(1);
DECLARE "WhereConditionString" TEXT;
DECLARE "CountSelectString" TEXT;
DECLARE "OrderBystring" TEXT;
DECLARE "WhereObjectFieldCondition" TEXT;

BEGIN

"SelectString" :=CONCAT('SELECT DISTINCT
								"FDADataQualityRulesId",
								"RuleName",
								"RuleDescription",
								"DAMADimension",
								"RuleType",
								REPLACE("RuleSignature",''~^~'','','') AS "RuleSignature",
								"RuleCount",
								"ObjectApplied",
								"ColumnsApplied",
								"RuleDataType",
								"LastUsedOn",
								"NumberOfException",
								"LinkedFields",
								"LinkedObject",
								"SystemName",
								"SystemType"
						FROM
							(SELECT 
									a."FDADataQualityRulesId",
									"RuleName" ,
									a."RuleDescription",
									COALESCE(a."DAMADimension",'''') "DAMADimension",
									"RuleType" AS "RuleType",
									"RuleSignature",
									"RuleCount",
									COALESCE(f."ObjectApplied",0) AS "ObjectApplied",
									COALESCE(e."ColumnsApplied",0) AS "ColumnsApplied",
									a."RuleDataType",
									e."LinkedFields",
									f."LinkedObject",
									SUBSTRING(a."CreatedOn",1,10) "LastUsedOn",
									COALESCE(g."NumberOfException",0) AS "NumberOfException",
									h."SystemAliasName" AS "SystemName",
									h."SystemType" 
						');

"FromString" := CONCAT('FROM fda."FDADataQualityMasterRules" a
						LEFT JOIN (SELECT 
										STRING_AGG("RuleType",'','')"RuleType",
										STRING_AGG("RuleSignature",''|'') "RuleSignature",
										"FDADataQualityRulesId",
										COUNT("RuleType") "RuleCount"
									FROM(SELECT 
												(CASE WHEN "RuleType" IN (''Enumerated Value'',''Date Range'',''Length Check'') AND ("LeftFieldValue" > '''' AND "RightFieldValue" > '''')
															THEN "RuleType" 
													WHEN "RuleType" IN (''DataType Check'',''Possible Character'',''Blank/NonBlank'',''Null Check'',''Forbidden Value'',''Permitted Value'',''Distinct Check'',''Enumerated Value(Query)'',''User Criteria'') AND "LeftFieldValue" > '''' 
															THEN "RuleType"
													WHEN "RuleType" IN (''Range of Values'',''Possible Character'',''Row Count Variation'') AND ("LeftFieldValue" > '''' OR "RightFieldValue" > '''') 
															THEN "RuleType"  
												END) "RuleType",
												(CASE WHEN "RuleType" IN (''Enumerated Value'',''Range of Values'',''Date Range'',''Length Check'') AND "LeftFieldValue" > '''' or "RightFieldValue" > ''''
															THEN  CONCAT_WS(''-'',"RuleType","LeftFieldValue","RightFieldValue" )
													WHEN "RuleType" IN (''DataType Check'',''Possible Character'',''Blank/NonBlank'',''Null Check'',''Forbidden Value'',''Permitted Value'',''Distinct Check'',''Enumerated Value(Query)'',''User Criteria'') AND "LeftFieldValue" > '''' 
															THEN CONCAT_WS(''-'',"RuleType","LeftFieldValue","RightFieldValue" )
													WHEN "RuleType" IN (''Possible Character'',''Row Count Variation'') AND ("LeftFieldValue" > '''' OR "RightFieldValue" > '''') 
															THEN CONCAT_WS(''-'',"RuleType","LeftFieldValue","RightFieldValue" )
												END) "RuleSignature",
												"FDADataQualityRulesId" 
										FROM fda."FDADataQualityMasterRulesDetails"
										)m
									GROUP BY "FDADataQualityRulesId"
									) b
							ON a."FDADataQualityRulesId" = b."FDADataQualityRulesId" 
						LEFT JOIN ( SELECT	COUNT(d."FDASystemObjectFieldsId") AS "ColumnsApplied",
											STRING_AGG(distinct d."FDASystemObjectFieldsId"::text,'','') "LinkedFields",
											c."FDADataQualityRulesId"
									FROM fda."FDASystemObjects" a
									INNER JOIN fda."FDASystemObjectFields" b
										ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
									INNER JOIN fda."FDADataQualityMasterRuleObjectColumns" d
										ON b."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
											AND b."FDASystemsId" = d."FDASystemsId"
											AND b."FDASystemObjectsId" = d."FDASystemObjectsId"
									INNER JOIN fda."FDADataQualityMasterRules" c
										ON d."FDADataQualityRulesId" = c."FDADataQualityRulesId"
									GROUP BY c."FDADataQualityRulesId"
									) e
								ON a."FDADataQualityRulesId" =  e."FDADataQualityRulesId"
						LEFT JOIN ( SELECT	COUNT(DISTINCT a."FDASystemObjectsId") AS "ObjectApplied",
					   						STRING_AGG(distinct a."FDASystemObjectsId"::text,'','') "LinkedObject",
											d."FDADataQualityRulesId" 
									FROM fda."FDASystemObjects" a
									LEFT JOIN ( SELECT 
													b."FDASystemObjectsId",
													c."FDADataQualityRulesId" 
												FROM fda."FDASystemObjectFields" b
												INNER JOIN fda."FDADataQualityMasterRuleObjectColumns" d
													ON b."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
														AND b."FDASystemsId" = d."FDASystemsId"
														AND b."FDASystemObjectsId" = d."FDASystemObjectsId"
												INNER JOIN fda."FDADataQualityMasterRules" c
													ON d."FDADataQualityRulesId" = c."FDADataQualityRulesId"
											) d
										ON a."FDASystemObjectsId" = d."FDASystemObjectsId"
									GROUP BY d."FDADataQualityRulesId" 
								)f
							ON a."FDADataQualityRulesId" = f."FDADataQualityRulesId"
						LEFT JOIN ( SELECT 
											SUM("OutlierCount") AS "NumberOfException",
											"MasterRuleId"
									FROM fda."FDAObjectScoreOutlierCountByCategory"
									WHERE "LastUpdatedOn" > current_date - 30
										AND "MasterRuleId" IS NOT NULL
									GROUP BY "MasterRuleId"
									) g
							ON a."FDADataQualityRulesId" = g."MasterRuleId"
						LEFT JOIN fda."FDASystems" h
							ON a."FDASystemsId" = h."FDASystemsId"
						LEFT JOIN (SELECT a."ObjectName",
										  b."FieldName",
										  d."FDADataQualityRulesId" 
									FROM fda."FDASystemObjects" a
									INNER JOIN fda."FDASystemObjectFields" b
										ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
									INNER JOIN fda."FDADataQualityMasterRuleObjectColumns" d
										ON b."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
											AND b."FDASystemsId" = d."FDASystemsId"
											AND b."FDASystemObjectsId" = d."FDASystemObjectsId"
									) i
							ON a."FDADataQualityRulesId" =  i."FDADataQualityRulesId"
						');						

IF "InObjectName" > '' OR "InFieldName" > '' THEN 
	"lvInd":= 'N';
	
	IF "InObjectName" > '' THEN 
		IF "lvInd" = 'N' THEN 
			"WhereObjectFieldCondition" :=CONCAT("WhereObjectFieldCondition",'WHERE i."ObjectName" = ''',"InObjectName",''' ');
			"lvInd":= 'Y';
		ELSE
			"WhereObjectFieldCondition" :=CONCAT("WhereObjectFieldCondition",'AND   i."ObjectName" = ''',"InObjectName",''' ');
		END IF;
	END IF;
	
	IF "InFieldName" > '' THEN 
		IF "lvInd" = 'N' THEN 
			"WhereObjectFieldCondition" :=CONCAT("WhereObjectFieldCondition",'WHERE i."FieldName" ILIKE ''%', "InFieldName" ,'%'' ');
			"lvInd":= 'Y';
		ELSE
			"WhereObjectFieldCondition" :=CONCAT("WhereObjectFieldCondition",'AND   i."FieldName" ILIKE ''%',"InFieldName",'%'' ');
		END IF;
	END IF;		
END IF;	
							
IF "InOrderBy" > '' AND "InOredrByType" > '' THEN  
"OrderBystring":= CONCAT('ORDER BY "',"InOrderBy"||'" '||"InOredrByType",'
						  OFFSET ', "InOffset" ,' ROWS
						  FETCH NEXT ',"InLimit",' ROWS ONLY');
ELSE 
"OrderBystring":= CONCAT('ORDER BY x."FDADataQualityRulesId" DESC
						  OFFSET ', "InOffset" ,' ROWS
						  FETCH NEXT ',"InLimit",' ROWS ONLY');				
END IF;

IF "InQualityRulesId" > '' OR "InRuleName" > '' OR "InRuleType" > '' OR "InSystemName" > '' OR "InRuleDescription" > '' OR "InDAMADimension" > '' THEN 
	"lvInd":= 'N';
	
	IF "InQualityRulesId" > '' THEN 
		IF "lvInd" = 'N' THEN 
			"WhereConditionString" :=CONCAT("WhereConditionString",'WHERE x."FDADataQualityRulesId"::text = ''',"InQualityRulesId",''' ');
			"lvInd":= 'Y';
		ELSE
			"WhereConditionString" :=CONCAT("WhereConditionString",'AND   x."FDADataQualityRulesId"::text = ''',"InQualityRulesId",''' ');
		END IF;
	END IF;
	
	IF "InRuleName" > '' THEN 
		IF "lvInd" = 'N' THEN 
			"WhereConditionString" :=CONCAT("WhereConditionString",'WHERE x."RuleName" ILIKE ''%', "InRuleName" ,'%'' ');
			"lvInd":= 'Y';
		ELSE
			"WhereConditionString" :=CONCAT("WhereConditionString",'AND   x."RuleName" ILIKE ''%',"InRuleName",'%'' ');
		END IF;
	END IF;
	
	IF "InRuleType" > '' THEN 
		IF "lvInd" = 'N' THEN 
			"WhereConditionString" :=CONCAT("WhereConditionString",'WHERE x."RuleType" ILIKE ''%',"InRuleType" ,'%'' ');
			"lvInd":= 'Y';
		ELSE
			"WhereConditionString" :=CONCAT("WhereConditionString",'AND  x."RuleType" ILIKE ''%',"InRuleType", '%'' ');
		END IF;
	END IF;
	
	IF "InRuleDescription" > '' THEN 
		IF "lvInd" = 'N' THEN 
			"WhereConditionString" :=CONCAT("WhereConditionString",'WHERE x."RuleDescription" ILIKE ''%',"InRuleDescription" ,'%'' ');
			"lvInd":= 'Y';
		ELSE
			"WhereConditionString" :=CONCAT("WhereConditionString",'AND  x."RuleDescription" ILIKE ''%',"InRuleDescription", '%'' ');
		END IF;
	END IF;
	
	IF "InSystemName" > '' THEN 
		IF "lvInd" = 'N' THEN 
			"WhereConditionString" :=CONCAT("WhereConditionString",'WHERE x."SystemName" ILIKE ''%', "InSystemName" ,'%'' ');
			"lvInd":= 'Y';
		ELSE
			"WhereConditionString" :=CONCAT("WhereConditionString",'AND   x."SystemName" ILIKE ''%',"InSystemName",'%'' ');
		END IF;
	END IF;
	
	IF "InDAMADimension" > '' THEN 
		IF "lvInd" = 'N' THEN 
			"WhereConditionString" :=CONCAT("WhereConditionString",'WHERE x."DAMADimension" ILIKE ''%', "InDAMADimension" ,'%'' ');
			"lvInd":= 'Y';
		ELSE
			"WhereConditionString" :=CONCAT("WhereConditionString",'AND   x."DAMADimension" ILIKE ''%',"InDAMADimension",'%'' ');
		END IF;
	END IF;
END IF;

"SelectString1" :=	CONCAT("SelectString","FromString","WhereObjectFieldCondition",')x  ',"WhereConditionString","OrderBystring");
"CountSelectString" := CONCAT('SELECT COUNT(*) "OutTotalRecordCount" FROM (',"SelectString","FromString","WhereObjectFieldCondition",')x ',"WhereConditionString",' )Y;');

RAISE NOTICE 'SelectString : %',"SelectString1";
RAISE NOTICE 'SelectString : %',"CountSelectString";

OPEN $13 FOR --OPEN THE REF CURSOR

	EXECUTE "SelectString1";

RETURN NEXT $13;

OPEN $14 FOR --OPEN THE REF CURSOR

	EXECUTE "CountSelectString";

RETURN NEXT $14;
		
/*
SELECT fda."Proc_ListMaintainDataQuality"(
	'0',--"InOffset" bigint,
	'10',--"InLimit" bigint,
	'',--"InOrderBy" character varying,
	'',--"InOredrByType" character varying,
	'',--"InQualityRulesId" character varying,
	'',--"InRuleName" character varying,
	'',--"InRuleType" character varying,
	'',--"InSystemName" character varying,
	'',--"InRuleDescription" text,
	'performdb.entityrule_ss',--"InObjectName" character varying,
	'',--"InFieldName" character varying,
	'',--"InDAMADimension" character varying,
	'refcursor1',
	'refcursor2');
FETCH ALL IN "refcursor1";
	
	*/

END;
$BODY$;

-----------------------------------------------------

CREATE OR REPLACE FUNCTION fda."Proc_ListFieldOutlierCheckRules"(
	"InFieldId" bigint,
	"InSegmentedRuleInd" character varying,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$

BEGIN
	
OPEN $3 FOR --OPEN THE REF CURSOR
	SELECT DISTINCT
		f."ObjectName",
		e."SystemName",
		e."SystemAliasName",
		e."SystemPassword",
		e."ConnectionDetails",
		e."SystemUserName",
		e."Schema",
		e."RoleName",
		e."Warehouse",
		e."Region",
		e."S3BucketLocation",
		e."PortNumber",
		e."AccessKeyID",
		e."SecretAccessKey",
		e."ClientEmail",
		e."PrivateKey",
		e."ProjectId",
		e."PassPhrase",
		COALESCE(b."SegmentedByFieldName",'') "SegmentedByFieldName",
		COALESCE(b."SegmentedByFieldValue",'') "SegmentedByFieldValue",
		b."RuleType" AS "RuleName",
		a."RuleName" AS "MasterRuleName",
		a."FDADataQualityRulesId" AS "MasterRuleId",
		d."FieldName",
		COALESCE(NULLIF(b."LeftFieldValue",'null'),'') AS "LeftFieldValue", 
		COALESCE(NULLIF(b."RightFieldValue",'null'),'')  AS "RightFieldValue",
		(CASE WHEN b."RuleType" = 'Range of Values'  THEN COALESCE(NULLIF(b."UpperThreshold",'null'),'') END) AS "HighestPossibleValue",
		(CASE WHEN b."RuleType" = 'Range of Values'  THEN COALESCE(NULLIF(b."LowerThreshold",'null'),'') END) AS "LowestPossibleValue",
        UPPER(e."SystemType") "SystemType",
        (CASE WHEN d."FieldDataType" IN ('VARCHAR','NVARCHAR','CHAR','BOOLEAN','TEXT','STRING','CHAR','CHARACTER','NCHAR','TEXT','NVARCHAR','NVARCHAR2','CHAR VARYING','NCHAR VARYING') AND COALESCE(d."UserOverwriteDatatype",'STRING') = 'STRING'THEN  'STRING'
              WHEN d."FieldDataType" IN ('NUMBER','INTEGER','DECIMAL','INT','FLOAT','NUMERIC','BIGINT','SMALLINT','TINYINT','BYTEINT','FLOAT','FLOAT4','FLOAT8','DOUBLE','DOUBLE PRECISION','REAL') AND COALESCE(d."UserOverwriteDatatype",'NUMBER') = 'NUMBER'THEN  'NUMBER'
              WHEN d."FieldDataType" IN ('DATE','DATETIME','TIME','TIMESTAMP','TIMESTAMP_LTZ','TIMESTAMP_NTZ','TIMESTAMP_TZ','DATETIME2') 
					AND COALESCE(d."UserOverwriteDatatype",'DATE') = 'DATE'  THEN  'DATE'
			ELSE d."UserOverwriteDatatype" 
		END) "FieldDataType",
		COALESCE(e."EncryptionInd",'No') "EncryptionInd"
		
    FROM fda."FDADataQualityMasterRules" a
	INNER JOIN fda."FDADataQualityMasterRulesDetails" b
		ON a."FDADataQualityRulesId" = b."FDADataQualityRulesId"
	INNER JOIN fda."FDADataQualityMasterRuleObjectColumns" c
		ON b."FDADataQualityRulesId" = c."FDADataQualityRulesId"
	INNER JOIN fda."FDASystemObjectFields" d
		ON  c."FDASystemsId" = d."FDASystemsId" 
		AND c."FDASystemObjectsId" = d."FDASystemObjectsId"
		AND c."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
	INNER JOIN fda."FDASystems" e
		ON d."FDASystemsId" = e."FDASystemsId"
	INNER JOIN fda."FDASystemObjects" f
		ON d."FDASystemsId" = f."FDASystemsId"
		AND d."FDASystemObjectsId" = f."FDASystemObjectsId"
    WHERE d."FDASystemObjectFieldsId" = "InFieldId";
	
RETURN NEXT $3;

END;
$BODY$;

------------------------------------------

CREATE OR REPLACE FUNCTION fda."Proc_UpdateFDAObjectFieldsScoreDataOutliers"(
	"InObjectScoreId" bigint,
	"InSystemId" bigint,
	"InObjectId" character varying,
	"InObjectFieldId" character varying,
	"InFieldSegmentId" character varying,
	"InObjectSegmentId" character varying)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$

DECLARE "ITEM_CURSOR_FIELD_SEGMENT" CURSOR FOR SELECT DISTINCT "SegmentFieldValue"
FROM fda."FDAObjectFieldsSegmentedScoreValue"
WHERE "FDASystemObjectId" = CAST(COALESCE("InObjectId",'0') AS BIGINT)
AND "FDASystemObjectFieldId" = CAST(COALESCE("InObjectFieldId",'0') AS BIGINT)
AND "FDASystemObjectSegmentedFieldId" = CAST(COALESCE("InFieldSegmentId",'0') AS BIGINT);

DECLARE "ITEM_CURSOR_OBJ_SEGMENT" CURSOR FOR SELECT DISTINCT "SegmentFieldValue"
FROM fda."FDAObjectsSegmentedScoreValues"
WHERE "FDASystemObjectsId" = CAST(COALESCE("InObjectId",'0') AS BIGINT)
AND "FDAObjectSegmentFieldId" = CAST(COALESCE("InObjectSegmentId",'0') AS BIGINT);

DECLARE
"lvSystemId" VARCHAR(10);
"lvObjectScoreId" BIGINT;
"lvLastObjectScoreId" BIGINT;
"lvLastObjectSegmentedScoreId" BIGINT;
"lvLastObjectFieldScoreId" BIGINT;
"lvLastFieldSegmentedScoreId" BIGINT;
"lvTotalOutliers" BIGINT;
"lvSegmentFieldName" VARCHAR(500);
"lvSegmentValue" VARCHAR(1000);
"lvRatio" DECIMAL(10,2);
"lvRowCountOutlierInd" VARCHAR(1);
"lvNullCountOutlierInd" VARCHAR(1);
"lvDistinctCountOutlierInd" VARCHAR(1);
"lvNullCountPercentOutlierInd" VARCHAR(1);
"lvDistinctCountPercentOutlierInd" VARCHAR(1);

"lvRowCountCalType" TEXT;
"lVRuleType" TEXT ;
"lvRightFieldValue" TEXT;
"lvUpperThreshold" BIGINT;
"lvLowerThreshold" BIGINT;

BEGIN

"lvSystemId" := CAST("InSystemId" AS VARCHAR);

IF COALESCE("InObjectId",'') > ''
AND "InObjectScoreId" > 0
AND COALESCE("InObjectFieldId",'') = ''
AND COALESCE("InFieldSegmentId",'') = ''
AND COALESCE("InObjectSegmentId",'') = ''
THEN

SELECT e."RuleType",e."LeftFieldValue"
INTO "lVRuleType","lvRowCountCalType"
FROM fda."FDASystemObjects" a
	INNER JOIN fda."FDASystemObjectFields" b
		ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
	INNER JOIN fda."FDADataQualityMasterRuleObjectColumns" d
		ON b."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
		AND b."FDASystemsId" = d."FDASystemsId"
		AND b."FDASystemObjectsId" = d."FDASystemObjectsId"
	INNER JOIN ( SELECT x."FDASystemObjectsId",
					y."CreatedOn",
					y."FDADataQualityRulesId"
				FROM fda."FDASystemObjectFields" x
					INNER JOIN fda."FDADataQualityMasterRuleObjectColumns" d
						ON x."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
							AND x."FDASystemsId" = d."FDASystemsId"
							AND x."FDASystemObjectsId" = d."FDASystemObjectsId"
					INNER JOIN fda."FDADataQualityMasterRulesDetails" y
						ON d."FDADataQualityRulesId" = y."FDADataQualityRulesId"
				WHERE y."RuleType" = 'Row Count Variation'
				AND x."FDASystemObjectsId" = "InObjectId"::BIGINT
				ORDER BY y."CreatedOn" DESC LIMIT 1) c 
	ON d."FDADataQualityRulesId" = c."FDADataQualityRulesId"
	JOIN fda."FDADataQualityMasterRulesDetails" e
		ON c."FDADataQualityRulesId" = e."FDADataQualityRulesId"
WHERE e."RuleType" = 'Row Count Variation'
 AND  b."FDASystemObjectsId" = "InObjectId"::BIGINT;

--Get Last Object Score Id
/*IF UPPER("lvRowCountCalType") = UPPER('Statistical')
THEN 
------------------------------------------------------------------------------------------------------------RowCountOutlier
	WITH MEDIAN_TAB("AvgRowCount","StdevRowCount") AS
	(SELECT AVG(a."RowCount") "AvgRowCount",
	COALESCE(STDDEV(a."RowCount"),0) "StdevRowCount"
	FROM fda."FDAObjectsScoreValue" a,
	fda."FDASystemObjects" b
	WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
	AND a."FDASystemObjectsId" = CAST("InObjectId" AS BIGINT)
	AND a."CalenderDate" >= (CASE WHEN COALESCE(b."NewBaseLineInd",'N') = 'Y' THEN CAST(b."NewBaseLineDateTime" AS DATE) ELSE (CURRENT_DATE - INTERVAL '30 day') END ))
	
	SELECT
	(ABS("RowCount" - "AvgRowCount")/ (CASE WHEN "StdevRowCount" = 0 THEN 1 ELSE "StdevRowCount" END)) "Ratio",
	(CASE
	WHEN ((ABS("RowCount" - "AvgRowCount")/(CASE WHEN "StdevRowCount" = 0 THEN 1 ELSE "StdevRowCount" END)) > 1
	AND (ABS("RowCount" - "AvgRowCount") > 0.4 * "AvgRowCount" )) THEN 'Y'
	ELSE 'N'
	END) "Ind"
	INTO "lvRatio","lvRowCountOutlierInd"
	FROM fda."FDAObjectsScoreValue"
	JOIN MEDIAN_TAB on 1=1
	WHERE "FDAObjectScoreValueId" = "InObjectScoreId";
ELSE */
	SELECT "RowCountOutlierInd"
	INTO "lvRowCountOutlierInd"
		FROM fda."FDAObjectsScoreValue"
		WHERE "FDAObjectScoreValueId" = "InObjectScoreId"; 

--END IF;
---------------------------------------------------------------------------------------------------------------NullCountOutlier
WITH MEDIAN_TAB ("AvgOfNullCount","StdevNullCount")AS
(SELECT AVG(a."AvgNullCount") "AvgOfNullCount",
STDDEV(a."AvgNullCount") "StdevNullCount"
FROM fda."FDAObjectsScoreValue" a,
fda."FDASystemObjects" b
WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
AND a."FDASystemObjectsId" = CAST("InObjectId" AS BIGINT)
AND a."CalenderDate" >= (CASE WHEN COALESCE(b."NewBaseLineInd",'N') = 'Y' THEN CAST(b."NewBaseLineDateTime" AS DATE) ELSE (CURRENT_DATE - INTERVAL '30 day') END ))

SELECT
(ABS("AvgNullCount" - "AvgOfNullCount")/ (CASE WHEN "StdevNullCount" = 0 THEN 1 ELSE "StdevNullCount" END)) "Ratio",
(CASE
WHEN ((ABS("AvgNullCount" - "AvgOfNullCount")/(CASE WHEN "StdevNullCount" = 0 THEN 1 ELSE "StdevNullCount" END)) > 1
AND (ABS("AvgNullCount" - "AvgOfNullCount") > 0.4 * "AvgOfNullCount" )) THEN 'Y' ELSE 'N'
END) "Ind"
INTO "lvRatio","lvNullCountOutlierInd"
FROM fda."FDAObjectsScoreValue"
JOIN MEDIAN_TAB on 1=1
WHERE "FDAObjectScoreValueId" = "InObjectScoreId";

RAISE NOTICE 'lvNullCountOutlierInd : %', "lvNullCountOutlierInd";

---------------------------------------------------------------------------------------------------------------DistinctCountOutlier
WITH MEDIAN_TAB ("AvgOfDistinctCount","StdevDistinctCount")AS
(SELECT AVG(a."AvgDistinctCount") "AvgOfDistinctCount",
STDDEV(a."AvgDistinctCount") "StdevDistinctCount"
FROM fda."FDAObjectsScoreValue" a,
fda."FDASystemObjects" b
WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
AND a."FDASystemObjectsId" = CAST("InObjectId" AS BIGINT)
AND a."CalenderDate" >= (CASE WHEN COALESCE(b."NewBaseLineInd",'N') = 'Y' THEN CAST(b."NewBaseLineDateTime" AS DATE) ELSE (CURRENT_DATE - INTERVAL '30 day') END ))

SELECT
(ABS("AvgDistinctCount" - "AvgOfDistinctCount")/ (CASE WHEN "StdevDistinctCount" = 0 THEN 1 ELSE "StdevDistinctCount" END)) "Ratio",
(CASE
WHEN ((ABS("AvgDistinctCount" - "AvgOfDistinctCount")/(CASE WHEN "StdevDistinctCount" = 0 THEN 1 ELSE "StdevDistinctCount" END)) > 1
AND (ABS("AvgDistinctCount" - "AvgOfDistinctCount") > 0.4 * "AvgOfDistinctCount")) THEN 'Y'
ELSE 'N'
END) "Ind"
INTO "lvRatio","lvDistinctCountOutlierInd"
FROM fda."FDAObjectsScoreValue"
JOIN MEDIAN_TAB on 1=1
WHERE "FDAObjectScoreValueId" = "InObjectScoreId";

---------------------------------------------------------------------------------------------------------------NullCountPercentOutlier
WITH MEDIAN_TAB ("AvgNullCountPercent","StdevNullCountPercent")AS
(SELECT AVG(CAST(a."NullCountPercent" AS DECIMAL(18,2))) "AvgNullCountPercent",
STDDEV(CAST(a."NullCountPercent" AS DECIMAL(18,2))) "StdevNullCountPercent"
FROM fda."FDAObjectsScoreValue" a,
fda."FDASystemObjects" b
WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
AND a."FDASystemObjectsId" = CAST("InObjectId" AS BIGINT)
AND a."CalenderDate" >= (CASE WHEN COALESCE(b."NewBaseLineInd",'N') = 'Y' THEN CAST(b."NewBaseLineDateTime" AS DATE) ELSE (CURRENT_DATE - INTERVAL '30 day') END ))

SELECT
(ABS(CAST("NullCountPercent" AS DECIMAL(18,2)) - "AvgNullCountPercent")/ (CASE WHEN "StdevNullCountPercent" = 0 THEN 1 ELSE "StdevNullCountPercent" END)) "Ratio",
(CASE
WHEN ((ABS(CAST("NullCountPercent" AS DECIMAL(18,2)) - "AvgNullCountPercent")/(CASE WHEN "StdevNullCountPercent" = 0 THEN 1 ELSE "StdevNullCountPercent" END)) > 1
AND ABS("NullCountPercent"::DECIMAL(18,2) - "AvgNullCountPercent") > 0.4 * "AvgNullCountPercent") THEN 'Y' ELSE 'N'
END) "Ind"
INTO "lvRatio","lvNullCountPercentOutlierInd"
FROM fda."FDAObjectsScoreValue"
JOIN MEDIAN_TAB on 1=1
WHERE "FDAObjectScoreValueId" = "InObjectScoreId";

---------------------------------------------------------------------------------------------------------------DistinctCountPercentOutlier
WITH MEDIAN_TAB ("AvgDistinctCountPercent","StdevDistinctCountPercent")AS
(SELECT AVG(CAST(a."DistinctCountPercent" AS DECIMAL(18,2))) "AvgDistinctCountPercent",
STDDEV(CAST(a."DistinctCountPercent" AS DECIMAL(18,2))) "StdevDistinctCountPercent"
FROM fda."FDAObjectsScoreValue" a,
fda."FDASystemObjects" b
WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
AND a."FDASystemObjectsId" = CAST("InObjectId" AS BIGINT)
AND a."CalenderDate" >= (CASE WHEN COALESCE(b."NewBaseLineInd",'N') = 'Y' THEN CAST(b."NewBaseLineDateTime" AS DATE) ELSE (CURRENT_DATE - INTERVAL '30 day') END ))

SELECT
(ABS(CAST("DistinctCountPercent" AS DECIMAL(18,2)) - "AvgDistinctCountPercent")/ (CASE WHEN "StdevDistinctCountPercent" = 0 THEN 1 ELSE "StdevDistinctCountPercent" END)) "Ratio",
(CASE
WHEN ((ABS("DistinctCountPercent"::DECIMAL(18,2) - "AvgDistinctCountPercent")/(CASE WHEN "StdevDistinctCountPercent" = 0 THEN 1 ELSE "StdevDistinctCountPercent" END)) > 1
AND (ABS("DistinctCountPercent"::DECIMAL(18,2) - "AvgDistinctCountPercent") > 0.4 * "AvgDistinctCountPercent")) THEN 'Y' ELSE 'N'
END) "Ind"
INTO "lvRatio","lvDistinctCountPercentOutlierInd"
FROM fda."FDAObjectsScoreValue"
JOIN MEDIAN_TAB on 1=1
WHERE "FDAObjectScoreValueId" = "InObjectScoreId";

-------------------------------------------------------------------------------------------------------------

UPDATE fda."FDAObjectsScoreValue"
SET "RowCountOutlierInd" = "lvRowCountOutlierInd",
"AvgNullCountOutlierInd" = "lvNullCountOutlierInd",
"AvgDistinctCountOutlierInd" = "lvDistinctCountOutlierInd",
"NullCountPercentOutlierInd" = "lvNullCountPercentOutlierInd",
"DistinctCountPercentOutlierInd" = "lvDistinctCountPercentOutlierInd"
WHERE "FDAObjectScoreValueId" = "InObjectScoreId";

 
ELSE IF COALESCE("InObjectId",'') > ''
AND COALESCE("InObjectFieldId",'') > ''
AND COALESCE("InFieldSegmentId",'') = ''
AND COALESCE("InObjectSegmentId",'') = ''
THEN

--Get Latest Field Score Id
SELECT MAX("FDAObjectFieldsScoreValueId")
INTO "lvLastObjectFieldScoreId"
FROM fda."FDAObjectFieldsScoreValue"
WHERE "FDAObjectScoreValueId" = "InObjectScoreId"
AND "FDASystemObjectFieldsId" = CAST("InObjectFieldId" AS BIGINT);

RAISE NOTICE 'lvLastObjectFieldScoreId %', "lvLastObjectFieldScoreId";

IF "lvLastObjectFieldScoreId" > 0 THEN

---------------------------------------------------------------------------------------------------------------NullCountOutlier

WITH MEDIAN_TAB ("AvgOfNullCount","StdevNullCount")AS
(SELECT AVG(a."NullCount") "AvgOfNullCount",
STDDEV(a."NullCount") "StdevNullCount"
FROM fda."FDAObjectFieldsScoreValue" a ,
fda."FDASystemObjects" b
WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
AND a."FDASystemObjectFieldsId" = CAST("InObjectFieldId" AS BIGINT)
AND a."CalenderDate" >= (CASE WHEN COALESCE(b."NewBaseLineInd",'N') = 'Y' THEN CAST(b."NewBaseLineDateTime" AS DATE) ELSE (CURRENT_DATE - INTERVAL '30 day') END ))

SELECT
(ABS("NullCount" - "AvgOfNullCount")/ (CASE WHEN "StdevNullCount" = 0 THEN 1 ELSE "StdevNullCount" END)) "Ratio",
(CASE
WHEN ((ABS("NullCount" - "AvgOfNullCount")/(CASE WHEN "StdevNullCount" = 0 THEN 1 ELSE "StdevNullCount" END)) > 1
AND (ABS("NullCount" - "AvgOfNullCount") > 0.4 * "AvgOfNullCount")) THEN 'Y' ELSE 'N'
END) "Ind"
INTO "lvRatio","lvNullCountOutlierInd"
FROM fda."FDAObjectFieldsScoreValue"
JOIN MEDIAN_TAB on 1=1
WHERE "FDAObjectFieldsScoreValueId" = "lvLastObjectFieldScoreId";

RAISE NOTICE 'lvNullCountOutlierInd : %', "lvNullCountOutlierInd";

---------------------------------------------------------------------------------------------------------------DistinctCountOutlier

WITH MEDIAN_TAB ("AvgOfDistinctCount","StdevDistinctCount")AS
(SELECT AVG(a."DistinctCount") "AvgOfDistinctCount",
STDDEV(a."DistinctCount") "StdevDistinctCount"
FROM fda."FDAObjectFieldsScoreValue" a ,
fda."FDASystemObjects" b
WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
AND a."FDASystemObjectFieldsId" = CAST("InObjectFieldId" AS BIGINT)
AND a."CalenderDate" >= (CASE WHEN COALESCE(b."NewBaseLineInd",'N') = 'Y' THEN CAST(b."NewBaseLineDateTime" AS DATE) ELSE (CURRENT_DATE - INTERVAL '30 day') END ))

SELECT
(ABS("DistinctCount" - "AvgOfDistinctCount")/ (CASE WHEN "StdevDistinctCount" = 0 THEN 1 ELSE "StdevDistinctCount" END)) "Ratio",
(CASE
WHEN ((ABS("DistinctCount" - "AvgOfDistinctCount")/(CASE WHEN "StdevDistinctCount" = 0 THEN 1 ELSE "StdevDistinctCount" END)) > 1
AND (ABS("DistinctCount" - "AvgOfDistinctCount") > 0.4 * "AvgOfDistinctCount")) THEN 'Y' ELSE 'N'
END) "Ind"
INTO "lvRatio","lvDistinctCountOutlierInd"
FROM fda."FDAObjectFieldsScoreValue"
JOIN MEDIAN_TAB on 1=1
WHERE "FDAObjectFieldsScoreValueId" = "lvLastObjectFieldScoreId";

RAISE NOTICE 'lvDistinctCountOutlierInd : %', "lvDistinctCountOutlierInd";

---------------------------------------------------------------------------------------------------------------NullCountPercentOutlier

WITH MEDIAN_TAB ("AvgNullCountPercent","StdevNullCountPercent")AS
(SELECT AVG(CAST(a."NullPercent" AS DECIMAL(18,2))) "AvgNullCountPercent",
STDDEV(CAST(a."NullPercent" AS DECIMAL(18,2))) "StdevNullCountPercent"
FROM fda."FDAObjectFieldsScoreValue" a ,
fda."FDASystemObjects" b
WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
AND a."FDASystemObjectFieldsId" = CAST("InObjectFieldId" AS BIGINT)
AND a."CalenderDate" >= (CASE WHEN COALESCE(b."NewBaseLineInd",'N') = 'Y' THEN CAST(b."NewBaseLineDateTime" AS DATE) ELSE (CURRENT_DATE - INTERVAL '30 day') END ))

SELECT
(ABS("NullPercent"::DECIMAL(18,2) - "AvgNullCountPercent")/ (CASE WHEN "StdevNullCountPercent" = 0 THEN 1 ELSE "StdevNullCountPercent" END)) "Ratio",
(CASE
WHEN ((ABS("NullPercent"::DECIMAL(18,2) - "AvgNullCountPercent")/(CASE WHEN "StdevNullCountPercent" = 0 THEN 1 ELSE "StdevNullCountPercent" END)) > 1
AND ABS("NullPercent"::DECIMAL(18,2) - "AvgNullCountPercent") > 0.4 * "AvgNullCountPercent") THEN 'Y' ELSE 'N'
END) "Ind"
INTO "lvRatio","lvNullCountPercentOutlierInd"
FROM fda."FDAObjectFieldsScoreValue"
JOIN MEDIAN_TAB on 1=1
WHERE "FDAObjectFieldsScoreValueId" = "lvLastObjectFieldScoreId";

RAISE NOTICE 'lvNullCountPercentOutlierInd : %', "lvNullCountPercentOutlierInd";

---------------------------------------------------------------------------------------------------------------DistinctCountPercentOutlier

WITH MEDIAN_TAB ("AvgDistinctCountPercent","StdevDistinctCountPercent")AS
(SELECT AVG(CAST(a."DistinctPercent" AS DECIMAL(18,2))) "AvgDistinctCountPercent",
STDDEV(CAST(a."DistinctPercent" AS DECIMAL(18,2))) "StdevDistinctCountPercent"
FROM fda."FDAObjectFieldsScoreValue" a ,
fda."FDASystemObjects" b
WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
AND a."FDASystemObjectFieldsId" = CAST("InObjectFieldId" AS BIGINT)
AND a."CalenderDate" >= (CASE WHEN COALESCE(b."NewBaseLineInd",'N') = 'Y' THEN CAST(b."NewBaseLineDateTime" AS DATE) ELSE (CURRENT_DATE - INTERVAL '30 day') END ))

SELECT
(ABS("DistinctPercent"::DECIMAL(18,2) - "AvgDistinctCountPercent")/ (CASE WHEN "StdevDistinctCountPercent" = 0 THEN 1 ELSE "StdevDistinctCountPercent" END)) "Ratio",
(CASE
WHEN ((ABS("DistinctPercent"::DECIMAL(18,2) - "AvgDistinctCountPercent")/(CASE WHEN "StdevDistinctCountPercent" = 0 THEN 1 ELSE "StdevDistinctCountPercent" END)) > 1
AND ABS("DistinctPercent"::DECIMAL(18,2) - "AvgDistinctCountPercent") > 0.4 * "AvgDistinctCountPercent") THEN 'Y' ELSE 'N'
END) "Ind"
INTO "lvRatio","lvDistinctCountPercentOutlierInd"
FROM fda."FDAObjectFieldsScoreValue"
JOIN MEDIAN_TAB on 1=1
WHERE "FDAObjectFieldsScoreValueId" = "lvLastObjectFieldScoreId";

RAISE NOTICE 'lvDistinctCountPercentOutlierInd : %', "lvDistinctCountPercentOutlierInd";

-------------------------------------------------------------------------------------------------------------
RAISE NOTICE 'Table Update %%';

UPDATE fda."FDAObjectFieldsScoreValue"
SET "NullCountOutlierInd" = "lvNullCountOutlierInd",
"DistinctCountOutlierInd" = "lvDistinctCountOutlierInd",
"NullCountPercentOutlierInd" = "lvNullCountPercentOutlierInd",
"DistinctCountPercentOutlierInd" = "lvDistinctCountPercentOutlierInd"
WHERE "FDAObjectFieldsScoreValueId" = "lvLastObjectFieldScoreId";

END IF;

ELSE IF COALESCE("InObjectId",'') > ''
AND COALESCE("InObjectFieldId",'') > ''
AND COALESCE("InFieldSegmentId",'') > ''
AND COALESCE("InObjectSegmentId",'') = ''
THEN

--Get Latest Field Score Id
SELECT MAX("FDAObjectFieldsScoreValueId")
INTO "lvLastObjectFieldScoreId"
FROM fda."FDAObjectFieldsScoreValue"
WHERE "FDAObjectScoreValueId" = "InObjectScoreId"
AND "FDASystemObjectFieldsId" = CAST("InObjectFieldId" AS BIGINT);

--Get Segmented By Column Name
SELECT "FieldName"
INTO "lvSegmentFieldName"
FROM fda."FDASystemObjectFields"
WHERE "FDASystemObjectFieldsId" = CAST("InFieldSegmentId" AS BIGINT);

FOR row IN "ITEM_CURSOR_FIELD_SEGMENT" LOOP

"lvSegmentValue" = REPLACE(CAST(row AS TEXT),'(','');
"lvSegmentValue" = REPLACE("lvSegmentValue",')','');
"lvSegmentValue" = REPLACE("lvSegmentValue",'"','');

--Get Latest Object Segmented Score Id By Segment Field Value
SELECT MAX("FDAObjectFieldsSegmentedScoreValueId")
INTO "lvLastFieldSegmentedScoreId"
FROM fda."FDAObjectFieldsSegmentedScoreValue"
WHERE "FDAObjectFieldsScoreValueId" = "lvLastObjectFieldScoreId"
AND "FDASystemObjectSegmentedFieldId" = CAST("InFieldSegmentId" AS BIGINT)
AND "SegmentFieldName" = "lvSegmentFieldName"
AND "SegmentFieldValue" = "lvSegmentValue";

IF "lvLastFieldSegmentedScoreId" > 0 THEN

---------------------------------------------------------------------------------------------------------------NullCountOutlier
WITH MEDIAN_TAB ("AvgOfNullCount","StdevNullCount")AS
(SELECT AVG(a."NullCount") "AvgOfNullCount",
STDDEV(a."NullCount") "StdevNullCount"
FROM fda."FDAObjectFieldsSegmentedScoreValue" a,
fda."FDASystemObjects" b
WHERE a."FDASystemObjectId" = b."FDASystemObjectsId"
AND a."FDASystemObjectFieldId" = CAST("InObjectFieldId" AS BIGINT)
AND a."FDASystemObjectId" = CAST("InObjectId" AS BIGINT)
AND a."FDASystemObjectSegmentedFieldId" = CAST("InFieldSegmentId" AS BIGINT)
AND a."SegmentFieldName" = "lvSegmentFieldName"
AND a."SegmentFieldValue" = "lvSegmentValue"
AND a."CalenderDate" >= (CASE WHEN COALESCE(b."NewBaseLineInd",'N') = 'Y' THEN CAST(b."NewBaseLineDateTime" AS DATE) ELSE (CURRENT_DATE - INTERVAL '30 day') END ))

SELECT
(ABS("NullCount" - "AvgOfNullCount")/ (CASE WHEN "StdevNullCount" = 0 THEN 1 ELSE "StdevNullCount" END)) "Ratio",
(CASE
WHEN ((ABS("NullCount" - "AvgOfNullCount")/(CASE WHEN "StdevNullCount" = 0 THEN 1 ELSE "StdevNullCount" END)) > 1
AND (ABS("NullCount" - "AvgOfNullCount") > 0.4 * "AvgOfNullCount")) THEN 'Y' ELSE 'N'
END) "Ind"
INTO "lvRatio","lvNullCountOutlierInd"
FROM fda."FDAObjectFieldsSegmentedScoreValue"
JOIN MEDIAN_TAB on 1=1
WHERE "FDAObjectFieldsSegmentedScoreValueId" = "lvLastFieldSegmentedScoreId";

RAISE NOTICE 'lvNullCountOutlierInd : %', "lvNullCountOutlierInd";

---------------------------------------------------------------------------------------------------------------DistinctCountOutlier
WITH MEDIAN_TAB ("AvgOfDistinctCount","StdevDistinctCount")AS
(SELECT AVG(a."DistinctCount") "AvgOfDistinctCount",
STDDEV(a."DistinctCount") "StdevDistinctCount"
FROM fda."FDAObjectFieldsSegmentedScoreValue" a,
fda."FDASystemObjects" b
WHERE a."FDASystemObjectId" = b."FDASystemObjectsId"
AND a."FDASystemObjectFieldId" = CAST("InObjectFieldId" AS BIGINT)
AND a."FDASystemObjectId" = CAST("InObjectId" AS BIGINT)
AND a."FDASystemObjectSegmentedFieldId" = CAST("InFieldSegmentId" AS BIGINT)
AND a."SegmentFieldName" = "lvSegmentFieldName"
AND a."SegmentFieldValue" = "lvSegmentValue"
AND a."CalenderDate" >= (CASE WHEN COALESCE(b."NewBaseLineInd",'N') = 'Y' THEN CAST(b."NewBaseLineDateTime" AS DATE) ELSE (CURRENT_DATE - INTERVAL '30 day') END ))

SELECT
(ABS("DistinctCount" - "AvgOfDistinctCount")/ (CASE WHEN "StdevDistinctCount" = 0 THEN 1 ELSE "StdevDistinctCount" END)) "Ratio",
(CASE
WHEN ((ABS("DistinctCount" - "AvgOfDistinctCount")/(CASE WHEN "StdevDistinctCount" = 0 THEN 1 ELSE "StdevDistinctCount" END)) > 1
AND (ABS("DistinctCount" - "AvgOfDistinctCount") > 0.4 * "AvgOfDistinctCount"))
THEN 'Y'
ELSE 'N'
END) "Ind"
INTO "lvRatio","lvDistinctCountOutlierInd"
FROM fda."FDAObjectFieldsSegmentedScoreValue"
JOIN MEDIAN_TAB on 1=1
WHERE "FDAObjectFieldsSegmentedScoreValueId" = "lvLastFieldSegmentedScoreId";

---------------------------------------------------------------------------------------------------------------NullCountPercentOutlier
WITH MEDIAN_TAB ("AvgNullCountPercent","StdevNullCountPercent")AS
(SELECT AVG(a."NullPercent"::DECIMAL(18,2)) "AvgNullCountPercent",
STDDEV(a."NullPercent"::DECIMAL(18,2)) "StdevNullCountPercent"
FROM fda."FDAObjectFieldsSegmentedScoreValue" a,
fda."FDASystemObjects" b
WHERE a."FDASystemObjectId" = b."FDASystemObjectsId"
AND a."FDASystemObjectFieldId" = CAST("InObjectFieldId" AS BIGINT)
AND a."FDASystemObjectId" = CAST("InObjectId" AS BIGINT)
AND a."FDASystemObjectSegmentedFieldId" = CAST("InFieldSegmentId" AS BIGINT)
AND a."SegmentFieldName" = "lvSegmentFieldName"
AND a."SegmentFieldValue" = "lvSegmentValue"
AND a."CalenderDate" >= (CASE WHEN COALESCE(b."NewBaseLineInd",'N') = 'Y' THEN CAST(b."NewBaseLineDateTime" AS DATE) ELSE (CURRENT_DATE - INTERVAL '30 day') END ))

SELECT
(ABS("NullPercent"::DECIMAL(18,2) - "AvgNullCountPercent")/ (CASE WHEN "StdevNullCountPercent" = 0 THEN 1 ELSE "StdevNullCountPercent" END)) "Ratio",
(CASE
WHEN ((ABS("NullPercent"::DECIMAL(18,2) - "AvgNullCountPercent")/(CASE WHEN "StdevNullCountPercent" = 0 THEN 1 ELSE "StdevNullCountPercent" END)) > 1
AND (ABS("NullPercent"::DECIMAL(18,2) - "AvgNullCountPercent") > 0.4 * "AvgNullCountPercent"))
THEN 'Y'
ELSE 'N'
END) "Ind"
INTO "lvRatio","lvNullCountPercentOutlierInd"
FROM fda."FDAObjectFieldsSegmentedScoreValue"
JOIN MEDIAN_TAB on 1=1
WHERE "FDAObjectFieldsSegmentedScoreValueId" = "lvLastFieldSegmentedScoreId";

---------------------------------------------------------------------------------------------------------------DistinctCountPercentOutlier
WITH MEDIAN_TAB ("AvgDistinctCountPercent","StdevDistinctCountPercent")AS
(SELECT AVG(CAST(a."DistinctPercent" AS DECIMAL(18,2))) "AvgDistinctCountPercent",
STDDEV(CAST(a."DistinctPercent" AS DECIMAL(18,2))) "StdevDistinctCountPercent"
FROM fda."FDAObjectFieldsSegmentedScoreValue" a,
fda."FDASystemObjects" b
WHERE a."FDASystemObjectId" = b."FDASystemObjectsId"
AND a."FDASystemObjectFieldId" = CAST("InObjectFieldId" AS BIGINT)
AND a."FDASystemObjectId" = CAST("InObjectId" AS BIGINT)
AND a."FDASystemObjectSegmentedFieldId" = CAST("InFieldSegmentId" AS BIGINT)
AND a."SegmentFieldName" = "lvSegmentFieldName"
AND a."SegmentFieldValue" = "lvSegmentValue"
AND a."CalenderDate" >= (CASE WHEN COALESCE(b."NewBaseLineInd",'N') = 'Y' THEN CAST(b."NewBaseLineDateTime" AS DATE) ELSE (CURRENT_DATE - INTERVAL '30 day') END ))

SELECT
(ABS("DistinctPercent"::DECIMAL(18,2) - "AvgDistinctCountPercent")/ (CASE WHEN "StdevDistinctCountPercent" = 0 THEN 1 ELSE "StdevDistinctCountPercent" END)) "Ratio",
(CASE
WHEN ((ABS("DistinctPercent"::DECIMAL(18,2) - "AvgDistinctCountPercent")/(CASE WHEN "StdevDistinctCountPercent" = 0 THEN 1 ELSE "StdevDistinctCountPercent" END)) > 1
AND (ABS("DistinctPercent"::DECIMAL(18,2) - "AvgDistinctCountPercent") > 0.4 * "AvgDistinctCountPercent"))
THEN 'Y'
ELSE 'N'
END) "Ind"
INTO "lvRatio","lvDistinctCountPercentOutlierInd"
FROM fda."FDAObjectFieldsSegmentedScoreValue"
JOIN MEDIAN_TAB on 1=1
WHERE "FDAObjectFieldsSegmentedScoreValueId" = "lvLastFieldSegmentedScoreId";

-------------------------------------------------------------------------------------------------------------

UPDATE fda."FDAObjectFieldsSegmentedScoreValue"
SET "NullCountOutlierInd" = "lvNullCountOutlierInd",
"DistinctCountOutlierInd" = "lvDistinctCountOutlierInd",
"NullCountPercentOutlierInd" = "lvNullCountPercentOutlierInd",
"DistinctCountPercentOutlierInd" = "lvDistinctCountPercentOutlierInd"
WHERE "FDAObjectFieldsSegmentedScoreValueId" = "lvLastFieldSegmentedScoreId";

END IF;

END LOOP;

ELSE IF COALESCE("InObjectId",'') > ''
AND COALESCE("InObjectFieldId",'') > ''
AND COALESCE("InFieldSegmentId",'') = ''
AND COALESCE("InObjectSegmentId",'') > ''
THEN

--Get Latest Object Score Id
SELECT MAX("FDAObjectScoreValueId")
INTO "lvObjectScoreId"
FROM fda."FDAObjectsScoreValue"
WHERE "FDASystemObjectsId" = CAST("InObjectId" AS BIGINT);

--Get Segmented By Column Name
SELECT "FieldName"
INTO "lvSegmentFieldName"
FROM fda."FDASystemObjectFields"
WHERE "FDASystemObjectFieldsId" = CAST("InObjectSegmentId" AS BIGINT);
/*
FOR row IN "ITEM_CURSOR_OBJ_SEGMENT" LOOP

"lvSegmentValue" = REPLACE(CAST(row AS TEXT),'(','');
"lvSegmentValue" = REPLACE("lvSegmentValue",')','');
"lvSegmentValue" = REPLACE("lvSegmentValue",'"','');

--Get Latest Object Segmented Score Id By Segment Field Value
SELECT MAX("FDAObjectsSegmentedScoreValuesId")
INTO "lvLastObjectSegmentedScoreId"
FROM fda."FDAObjectsSegmentedScoreValues"
WHERE "FDASystemObjectId" = CAST("InObjectId" AS BIGINT)
AND "FDAObjectScoreValueId" = "lvObjectScoreId"
AND "FDAObjectSegmentFieldId" = CAST("InObjectSegmentId" AS BIGINT)
AND "SegmentFieldName" = "lvSegmentFieldName"
AND "SegmentFieldValue" = "lvSegmentValue";

------------------------------------------------------------------------------------------------------------RowCountOutlier
WITH MEDIAN_TAB ("AvgRowCount","StdevRowCount") AS
(SELECT AVG(a."RowCount") "AvgRowCount",
STDDEV(a."RowCount") "StdevRowCount"
FROM fda."FDAObjectsSegmentedScoreValues" a,
fda."FDASystemObjects" b
WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
AND a."FDASystemObjectsId" = CAST("InObjectId" AS BIGINT)
AND a."FDAObjectSegmentFieldId" = CAST("InObjectSegmentId" AS BIGINT)
AND a."SegmentFieldName" = "lvSegmentFieldName"
AND a."SegmentFieldValue" = "lvSegmentValue"
AND a."CalenderDate" >= (CASE WHEN COALESCE(b."NewBaseLineInd",'N') = 'Y' THEN CAST(b."NewBaseLineDateTime" AS DATE) ELSE (CURRENT_DATE - INTERVAL '30 day') END ))

SELECT
(ABS("RowCount" - "AvgRowCount")/ (CASE WHEN "StdevRowCount" = 0 THEN 1 ELSE "StdevRowCount" END)) "Ratio",
(CASE
WHEN ((ABS("RowCount" - "AvgRowCount")/(CASE WHEN "StdevRowCount" = 0 THEN 1 ELSE "StdevRowCount" END)) > 1
AND ABS("RowCount") > 2 * ABS("AvgRowCount")) THEN 'Y'
ELSE 'N'
END) "Ind"
INTO "lvRatio","lvRowCountOutlierInd"
FROM fda."FDAObjectsSegmentedScoreValues"
JOIN MEDIAN_TAB on 1=1
WHERE "FDAObjectsSegmentedScoreValuesId" = "lvLastObjectSegmentedScoreId";
---------------------------------------------------------------------------------------------------------------NullCountOutlier
WITH MEDIAN_TAB  ("AvgOfNullCount","StdevNullCount")AS
(SELECT AVG(a."AvgNullCount") "AvgOfNullCount",
STDDEV(a."AvgNullCount") "StdevNullCount"
FROM fda."FDAObjectsSegmentedScoreValues" a,
fda."FDASystemObjects" b
WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
AND a."FDASystemObjectsId" = CAST("InObjectId" AS BIGINT)
AND a."FDAObjectSegmentFieldId" = CAST("InObjectSegmentId" AS BIGINT)
AND a."SegmentFieldName" = "lvSegmentFieldName"
AND a."SegmentFieldValue" = "lvSegmentValue"
AND a."CalenderDate" >= (CASE WHEN COALESCE(b."NewBaseLineInd",'N') = 'Y' THEN CAST(b."NewBaseLineDateTime" AS DATE) ELSE (CURRENT_DATE - INTERVAL '30 day') END ))

SELECT
(ABS("AvgNullCount" - "AvgOfNullCount")/ (CASE WHEN "StdevNullCount" = 0 THEN 1 ELSE "StdevNullCount" END)) "Ratio",
(CASE
WHEN ((ABS("AvgNullCount" - "AvgOfNullCount")/(CASE WHEN "StdevNullCount" = 0 THEN 1 ELSE "StdevNullCount" END)) > 1
AND ABS("AvgNullCount") > 2 * ABS("AvgOfNullCount")) THEN 'Y'
ELSE 'N'
END) "Ind"
INTO "lvRatio","lvNullCountOutlierInd"
FROM fda."FDAObjectsSegmentedScoreValues"
JOIN MEDIAN_TAB on 1=1
WHERE "FDAObjectsSegmentedScoreValuesId" = "lvLastObjectSegmentedScoreId";

RAISE NOTICE 'lvNullCountOutlierInd : %', "lvNullCountOutlierInd";

---------------------------------------------------------------------------------------------------------------DistinctCountOutlier
WITH MEDIAN_TAB ("AvgOfDistinctCount","StdevDistinctCount")AS
(SELECT AVG(a."AvgDistinctCount") "AvgOfDistinctCount",
STDDEV(a."AvgDistinctCount") "StdevDistinctCount"
FROM fda."FDAObjectsSegmentedScoreValues" a,
fda."FDASystemObjects" b
WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
AND a."FDASystemObjectsId" = CAST("InObjectId" AS BIGINT)
AND a."FDAObjectSegmentFieldId" = CAST("InObjectSegmentId" AS BIGINT)
AND a."SegmentFieldName" = "lvSegmentFieldName"
AND a."SegmentFieldValue" = "lvSegmentValue"
AND a."CalenderDate" >= (CASE WHEN COALESCE(b."NewBaseLineInd",'N') = 'Y' THEN CAST(b."NewBaseLineDateTime" AS DATE) ELSE (CURRENT_DATE - INTERVAL '30 day') END ))

SELECT
(ABS("AvgDistinctCount" - "AvgOfDistinctCount")/ (CASE WHEN "StdevDistinctCount" = 0 THEN 1 ELSE "StdevDistinctCount" END)) "Ratio",
(CASE
WHEN ((ABS("AvgDistinctCount" - "AvgOfDistinctCount")/(CASE WHEN "StdevDistinctCount" = 0 THEN 1 ELSE "StdevDistinctCount" END)) > 1
AND ABS("AvgDistinctCount") > 2 * ABS("AvgOfDistinctCount")) THEN 'Y'
ELSE 'N'
END) "Ind"
INTO "lvRatio","lvDistinctCountOutlierInd"
FROM fda."FDAObjectsSegmentedScoreValues"
JOIN MEDIAN_TAB on 1=1
WHERE "FDAObjectsSegmentedScoreValuesId" = "lvLastObjectSegmentedScoreId";

---------------------------------------------------------------------------------------------------------------NullCountPercentOutlier
WITH MEDIAN_TAB ("AvgNullCountPercent","StdevNullCountPercent")AS
(SELECT AVG(CAST(a."NullCountPercent" AS DECIMAL(18,2))) "AvgNullCountPercent",
STDDEV(CAST(a."NullCountPercent" AS DECIMAL(18,2))) "StdevNullCountPercent"
FROM fda."FDAObjectsSegmentedScoreValues" a,
fda."FDASystemObjects" b
WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
AND a."FDASystemObjectsId" = CAST("InObjectId" AS BIGINT)
AND a."FDAObjectSegmentFieldId" = CAST("InObjectSegmentId" AS BIGINT)
AND a."SegmentFieldName" = "lvSegmentFieldName"
AND a."SegmentFieldValue" = "lvSegmentValue"
AND a."CalenderDate" >= (CASE WHEN COALESCE(b."NewBaseLineInd",'N') = 'Y' THEN CAST(b."NewBaseLineDateTime" AS DATE) ELSE (CURRENT_DATE - INTERVAL '30 day') END ))

SELECT
(ABS(CAST("NullCountPercent" AS DECIMAL(18,2)) - "AvgNullCountPercent")/ (CASE WHEN "StdevNullCountPercent" = 0 THEN 1 ELSE "StdevNullCountPercent" END)) "Ratio",
(CASE
WHEN ((ABS(CAST("NullCountPercent" AS DECIMAL(18,2)) - "AvgNullCountPercent")/(CASE WHEN "StdevNullCountPercent" = 0 THEN 1 ELSE "StdevNullCountPercent" END)) > 1
AND ABS(CAST("NullCountPercent" AS DECIMAL(18,2))) > 2 * ABS("AvgNullCountPercent")) THEN 'Y'
ELSE 'N'
END) "Ind"
INTO "lvRatio","lvNullCountPercentOutlierInd"
FROM fda."FDAObjectsSegmentedScoreValues"
JOIN MEDIAN_TAB on 1=1
WHERE "FDAObjectsSegmentedScoreValuesId" = "lvLastObjectSegmentedScoreId";

---------------------------------------------------------------------------------------------------------------DistinctCountPercentOutlier
WITH MEDIAN_TAB ("AvgDistinctCountPercent","StdevDistinctCountPercent")AS
(SELECT AVG(CAST(a."DistinctCountPercent" AS DECIMAL(18,2))) "AvgDistinctCountPercent",
STDDEV(CAST(a."DistinctCountPercent" AS DECIMAL(18,2))) "StdevDistinctCountPercent"
FROM fda."FDAObjectsSegmentedScoreValues" a,
fda."FDASystemObjects" b
WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
AND a."FDASystemObjectsId" = CAST("InObjectId" AS BIGINT)
AND a."FDAObjectSegmentFieldId" = CAST("InObjectSegmentId" AS BIGINT)
AND a."SegmentFieldName" = "lvSegmentFieldName"
AND a."SegmentFieldValue" = "lvSegmentValue"
AND a."CalenderDate" >= (CASE WHEN COALESCE(b."NewBaseLineInd",'N') = 'Y' THEN CAST(b."NewBaseLineDateTime" AS DATE) ELSE (CURRENT_DATE - INTERVAL '30 day') END ))

SELECT
(ABS(CAST("DistinctCountPercent" AS DECIMAL(18,2)) - "AvgDistinctCountPercent")/ (CASE WHEN "StdevDistinctCountPercent" = 0 THEN 1 ELSE "StdevDistinctCountPercent" END)) "Ratio",
(CASE
WHEN ((ABS(CAST("DistinctCountPercent" AS DECIMAL(18,2)) - "AvgDistinctCountPercent")/(CASE WHEN "StdevDistinctCountPercent" = 0 THEN 1 ELSE "StdevDistinctCountPercent" END)) > 1
AND ABS(CAST("DistinctCountPercent" AS DECIMAL(18,2))) > 2 * ABS("AvgDistinctCountPercent")) THEN 'Y'
ELSE 'N'
END) "Ind"
INTO "lvRatio","lvDistinctCountPercentOutlierInd"
FROM fda."FDAObjectsSegmentedScoreValues"
JOIN MEDIAN_TAB on 1=1
WHERE "FDAObjectsSegmentedScoreValuesId" = "lvLastObjectSegmentedScoreId";

-------------------------------------------------------------------------------------------------------------

UPDATE fda."FDAObjectsSegmentedScoreValues"
SET "RowCountOutlierInd" = "lvRowCountOutlierInd",
"AvgNullCountOutlierInd" = "lvNullCountOutlierInd",
"AvgDistinctCountOutlierInd" = "lvDistinctCountOutlierInd",
"NullCountPercentOutlierInd" = "lvNullCountPercentOutlierInd",
"DistinctCountPercentOutlierInd" = "lvDistinctCountPercentOutlierInd"
WHERE "FDAObjectsSegmentedScoreValuesId" = "lvLastObjectSegmentedScoreId";

END LOOP;
*/

END IF;
END IF;
END IF;
END IF;

/*
SELECT fda."Proc_UpdateFDAObjectFieldsScoreDataOutliers"(
'1',  --"InSystemId" bigint,
'60',  --"InObjectId" character varying,
'',  --"InObjectFieldId" character varying,
'241'  --"InFieldSegmentId" character varying,
);
*/

END
$BODY$;

------------------------------------------------------

CREATE OR REPLACE FUNCTION fda."Proc_GetObjectRowCountOutlierStatusInd"(
	"InObjectId" bigint,
	"InObjectScoreId" bigint,
	"InUserName" character varying,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$

DECLARE "lvRatio" DECIMAL(18,3);
		"lvRowCountOutlierInd" VARCHAR(1);
		"lvScorecount" BIGINT;
		"lvlastrowcount" BIGINT;
		"lvRowCountCalType" TEXT;
		"lVRuleType" TEXT ;
		"lvRightFieldValue" TEXT;
		"lvUpperThreshold" TEXT;
		"lvLowerThreshold" TEXT;
BEGIN

SELECT e."RuleType",COALESCE(NULLIF(e."LeftFieldValue",''),'Statistical'),e."RightFieldValue",
	   COALESCE(NULLIF(NULLIF(NULLIF(e."UpperThreshold",'Unlimited'),''),'null'),'0'),
	   COALESCE(NULLIF(NULLIF(NULLIF(e."LowerThreshold",'Unlimited'),''),'null'),'0')
INTO "lVRuleType","lvRowCountCalType","lvRightFieldValue","lvUpperThreshold","lvLowerThreshold"
FROM fda."FDASystemObjects" a
INNER JOIN fda."FDASystemObjectFields" b
	ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
INNER JOIN fda."FDADataQualityMasterRuleObjectColumns" d
	ON b."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
		AND b."FDASystemsId" = d."FDASystemsId"
		AND b."FDASystemObjectsId" = d."FDASystemObjectsId"
INNER JOIN (SELECT x."FDASystemObjectsId",y."CreatedOn",y."FDADataQualityRulesId"
			FROM fda."FDASystemObjectFields" x
			INNER JOIN fda."FDADataQualityMasterRuleObjectColumns" d
				ON x."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
					AND x."FDASystemsId" = d."FDASystemsId"
					AND x."FDASystemObjectsId" = d."FDASystemObjectsId"
			INNER JOIN fda."FDADataQualityMasterRulesDetails" y
				ON d."FDADataQualityRulesId" = y."FDADataQualityRulesId"
			WHERE y."RuleType" = 'Row Count Variation'
				AND y."LeftFieldValue" > ''
				AND x."FDASystemObjectsId" = "InObjectId"
			ORDER BY "CreatedOn" DESC LIMIT 1
			) c 
	ON d."FDADataQualityRulesId" = c."FDADataQualityRulesId"
INNER JOIN fda."FDADataQualityMasterRulesDetails" e
	ON c."FDADataQualityRulesId" = e."FDADataQualityRulesId"
WHERE e."RuleType" = 'Row Count Variation'
	AND  b."FDASystemObjectsId" = "InObjectId";

IF UPPER("lVRuleType") = 'ROW COUNT VARIATION' 
THEN 

SELECT COUNT(*)
INTO "lvScorecount"
    FROM fda."FDAObjectsScoreValue"	
	WHERE "FDASystemObjectsId" = "InObjectId"
	AND "FDAObjectScoreValueId" != "InObjectScoreId";
	
	IF "lvScorecount" >= 1
	THEN
		SELECT "RowCount"
		INTO "lvlastrowcount"
		FROM
			(SELECT "FDAObjectScoreValueId", "RowCount"
			 FROM fda."FDAObjectsScoreValue"
			 WHERE "FDASystemObjectsId" = "InObjectId"
				AND "FDAObjectScoreValueId" < "InObjectScoreId" 
			 AND "RowCountOutlierInd" = 'N'
			 ORDER BY "FDAObjectScoreValueId" desc
			 LIMIT 1
			) x;
	END IF;
 
	IF UPPER("lvRowCountCalType") = UPPER('Manual') AND UPPER("lvRightFieldValue") = UPPER('Absolute')
	THEN

		RAISE NOTICE 'lvRightFieldValue : %',"lvRightFieldValue";
		RAISE NOTICE 'lvlastrowcount : %', "lvlastrowcount";
		---RAISE NOTICE 'Interval : %',"RowCount" - "lvlastrowcount";
		
		/*SELECT ( CASE WHEN "lvScorecount" >=1 and ("RowCount" - "lvlastrowcount") > "lvUpperThreshold"  
			OR  "lvScorecount" >=1 and ("RowCount" - "lvlastrowcount") < "lvLowerThreshold" THEN 'Y' 
				WHEN  "lvScorecount" < 1 THEN 'N'  ELSE 'N' END)
			INTO "lvRowCountOutlierInd"
			FROM fda."FDAObjectsScoreValue"
			WHERE "FDAObjectScoreValueId" = "InObjectScoreId";*/
			
		SELECT (CASE 
					WHEN  "lvScorecount" < 1 THEN 'N'
					WHEN "lvScorecount" >= 1 AND "lvUpperThreshold" IS NOT NULL AND  "lvLowerThreshold" IS NOT NULL 
							AND  "RowCount"  BETWEEN ("lvlastrowcount" - "lvLowerThreshold"::bigint) 
												AND ("lvlastrowcount" + "lvUpperThreshold"::bigint)  THEN 'N' 
					WHEN "lvScorecount" >= 1 AND "lvUpperThreshold" IS NOT NULL AND  "lvLowerThreshold" IS NOT NULL 
							AND  "RowCount"  NOT BETWEEN ("lvlastrowcount" - "lvLowerThreshold"::bigint) 
												AND ("lvlastrowcount" + "lvUpperThreshold"::bigint)  THEN 'Y'
					WHEN ("lvScorecount" >= 1 AND "lvUpperThreshold" IS NOT NULL AND "lvLowerThreshold" IS NULL 
							AND "RowCount" > ("lvlastrowcount" + "lvUpperThreshold"::bigint)) 
						OR ("lvScorecount" >= 1 AND "lvUpperThreshold" IS NULL AND "lvLowerThreshold" IS NOT NULL 
							AND "RowCount" < ("lvlastrowcount" - "lvLowerThreshold"::bigint))  THEN 'Y'
				ELSE 'N' 
				END)
			INTO "lvRowCountOutlierInd"
			FROM fda."FDAObjectsScoreValue"
			WHERE "FDAObjectScoreValueId" = "InObjectScoreId";
			
		---RAISE NOTICE 'lvRowCountOutlierInd : %', "lvRowCountOutlierInd";
	END IF;
	
	IF UPPER("lvRowCountCalType") = UPPER('Manual') AND UPPER("lvRightFieldValue") = UPPER('Percentage')
	THEN 
				
		SELECT 
				(CASE 
					WHEN "lvScorecount" >= 1 AND UPPER("lvUpperThreshold") = UPPER('Unlimited') AND UPPER("lvLowerThreshold") = UPPER('Unlimited') THEN 'N'
					WHEN "lvScorecount" >= 1 AND "lvUpperThreshold" IS NOT NULL AND  "lvLowerThreshold" IS NOT NULL 
						AND "RowCount"  BETWEEN  "lvlastrowcount" - ("lvlastrowcount" * ("lvLowerThreshold"::bigint/100::float8))   
											AND	 "lvlastrowcount" + ("lvlastrowcount" * ("lvUpperThreshold"::bigint/100::float8)) THEN 'N'
					WHEN "lvScorecount" >= 1 AND "lvUpperThreshold" IS NOT NULL AND  "lvLowerThreshold" IS NOT NULL
						AND "RowCount" NOT BETWEEN  "lvlastrowcount" - ("lvlastrowcount" * ("lvLowerThreshold"::bigint/100::float8))   
											AND	    "lvlastrowcount" + ("lvlastrowcount" * ("lvUpperThreshold"::bigint/100::float8)) THEN 'Y'
					WHEN ("lvScorecount" >= 1 AND "lvUpperThreshold" IS NOT NULL AND "lvLowerThreshold" IS NULL 
							AND "RowCount" > ("lvlastrowcount" + ("lvlastrowcount" * ("lvUpperThreshold"::bigint/100::float8))))
						OR ("lvScorecount" >= 1 AND "lvUpperThreshold" IS NULL  AND "lvLowerThreshold" IS NOT NULL 
							AND "RowCount" < ("lvlastrowcount" - ("lvlastrowcount" * ("lvLowerThreshold"::bigint/100::float8)))) THEN 'Y'
		
					ELSE 'N' 
				END)
	/*	(CASE 
					WHEN  "lvScorecount" >=1 AND UPPER("lvUpperThreshold") = UPPER('Unlimited') AND UPPER("lvLowerThreshold") = UPPER('Unlimited') THEN 'N'
					WHEN  "lvScorecount" >=1 AND "RowCount"  BETWEEN  "lvlastrowcount"-("lvlastrowcount"*("lvLowerThreshold"::bigint/100::float8)) AND  
													"lvlastrowcount"+("lvlastrowcount"*("lvUpperThreshold"::bigint/100::float8))THEN 'N' 
					WHEN "lvScorecount" >=1  AND "RowCount" NOT BETWEEN  "lvlastrowcount"-("lvlastrowcount"*("lvLowerThreshold"::bigint/100::float8)) AND  
													"lvlastrowcount"+("lvlastrowcount"*("lvUpperThreshold"::bigint/100::float8))THEN 'Y' 
					WHEN  "lvScorecount" < 1 THEN 'N' 
				ELSE 'N' 
				END) */
		INTO "lvRowCountOutlierInd"
		FROM fda."FDAObjectsScoreValue"
		WHERE "FDAObjectScoreValueId" = "InObjectScoreId";
	END IF;
	---------------------------------------Statistical--------------------------------------------------------
	---ELSE --UPPER("InLeftFieldValue") = UPPER('Statistical')
	IF UPPER("lvRowCountCalType") = UPPER('Statistical') 
	THEN 
	
			WITH MEDIAN_TAB("AvgRowCount","StdevRowCount") AS
			(SELECT AVG(a."RowCount") "AvgRowCount",
					COALESCE(STDDEV(a."RowCount"),0) "StdevRowCount"
			FROM fda."FDAObjectsScoreValue" a,
				fda."FDASystemObjects" b
			WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
				AND a."FDASystemObjectsId" = "InObjectId"
				AND a."CalenderDate" >= (CASE WHEN COALESCE(b."NewBaseLineInd",'N') = 'Y' THEN CAST(b."NewBaseLineDateTime" AS DATE) ELSE (CURRENT_DATE - INTERVAL '30 day') END ))
			
			SELECT 
				(ABS("RowCount" - "AvgRowCount")/ (CASE WHEN "StdevRowCount" = 0 THEN 1 ELSE "StdevRowCount" END)) "Ratio",	
				(CASE 
					WHEN ((ABS("RowCount" - "AvgRowCount")/(CASE WHEN "StdevRowCount" = 0 THEN 1 ELSE "StdevRowCount" END)) > 1
					AND (ABS("RowCount") > 2 * ABS("AvgRowCount") OR ABS("RowCount") <  ABS("AvgRowCount") )) THEN 'Y' 
					ELSE 'N' 
				END) "Ind"
			INTO "lvRatio","lvRowCountOutlierInd"
			FROM fda."FDAObjectsScoreValue"
				JOIN MEDIAN_TAB ON 1=1
			WHERE "FDAObjectScoreValueId" = "InObjectScoreId";
	END IF;
END IF;

		RAISE NOTICE 'lvRowCountOutlierInd : %', "lvRowCountOutlierInd";

		UPDATE fda."FDAObjectsScoreValue"
		SET "RowCountOutlierInd" = "lvRowCountOutlierInd","LastUpdatedBy" = "InUserName"
		WHERE "FDAObjectScoreValueId" = "InObjectScoreId";  
		
	OPEN $4 FOR
	
		SELECT (CASE WHEN "RowCountOutlierInd" = 'Y' THEN true ELSE false END) "RowCountOutlierInd"
		FROM fda."FDAObjectsScoreValue"
		WHERE "FDAObjectScoreValueId" = "InObjectScoreId" 
		AND "LastUpdatedBy" = "InUserName"; 
			
	RETURN NEXT $4;

		
END;
$BODY$;

-----------------------------------------------------------------------

CREATE OR REPLACE FUNCTION fda."Proc_SaveSystemEntityAttributeDataTypeInfo"(
	"InUserName" character varying,
	"InSystemName" character varying,
	"InTabInd" character varying,
	"InData" text)
    RETURNS void
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE "ITEM_CURSOR" CURSOR FOR SELECT "VALUE"
		FROM UNNEST(STRING_TO_ARRAY("InData" ,'|')) "VALUE"
		WHERE "VALUE" IS NOT NULL;
		
DECLARE "lvData" TEXT;
DECLARE "lvFDASystemId" BIGINT;
DECLARE "lvFDASystemObjectId" BIGINT;
DECLARE "lvFDASystemObjectFieldId" BIGINT;
--DECLARE	"lvMetaDataStatusInd1" TEXT;
--DECLARE	"lvMetaDataStatusInd2" TEXT;

BEGIN

SELECT "FDASystemsId"
INTO "lvFDASystemId" 
FROM fda."FDASystems" 
WHERE "SystemAliasName" = "InSystemName";

FOR row IN "ITEM_CURSOR" LOOP

	"lvData" = REPLACE(CAST(row AS TEXT),'(','');
	"lvData" = REPLACE("lvData",')','');
	"lvData" = REPLACE("lvData",'"','');

	INSERT INTO fda."FDASystemObjects"
				(
					"FDASystemsId",
					"ObjectName",
					"ObjectType",
					"ObsoleteInMetaDataInd",
					"LastSyncUpDate"
				)
	SELECT "FDASystemsId",
		"ObjectName",
		'DATA',
		'NEW',
		CURRENT_DATE
	FROM
		(
			SELECT "lvFDASystemId" "FDASystemsId",
					"ObjectName"
			FROM 
				(SELECT SPLIT_PART("lvData",'^',1) "ObjectName") X  
			EXCEPT
			SELECT "FDASystemsId","ObjectName"
			FROM fda."FDASystemObjects"
		) Y;
	
	--Get Entity Id
	SELECT "FDASystemObjectsId" 
		INTO "lvFDASystemObjectId"
	FROM fda."FDASystemObjects"
	WHERE "FDASystemsId" = "lvFDASystemId"
		AND "ObjectName" = SPLIT_PART("lvData",'^',1);  --EntityName 

	IF UPPER("InTabInd") = 'ATTRIBUTE' THEN  
	
	--update Entity User Friendly Name
	IF 	SPLIT_PART("lvData",'^',8) > ''
	THEN	
		UPDATE fda."FDASystemObjects"
		SET "UserFriendlyObjectName" = SPLIT_PART("lvData",'^',8)     --UserFriendlyEntityName
		WHERE "FDASystemsId" = "lvFDASystemId"
			AND "FDASystemObjectsId" = "lvFDASystemObjectId";
	END IF;
		
		--Get Field Id If Already Stored
		
		SELECT "FDASystemObjectFieldsId"
			INTO "lvFDASystemObjectFieldId"
		FROM fda."FDASystemObjectFields"
		WHERE "FDASystemsId" = "lvFDASystemId"
			AND "FDASystemObjectsId" = "lvFDASystemObjectId"
			AND UPPER("FieldName") = UPPER(SPLIT_PART("lvData",'^',2))
			AND UPPER("FieldDataType") = UPPER(SPLIT_PART("lvData",'^',3)) ;
			
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
/*		SELECT CONCAT(SPLIT_PART("lvData",'^',3),NULLIF(SPLIT_PART("lvData",'^',4),''))
	--CONCAT(SPLIT_PART("lvData",'^',3),NULLIF(SPLIT_PART("lvData",'^',4),''),SPLIT_PART("lvData",'^',5),SPLIT_PART("lvData",'^',6),SPLIT_PART("lvData",'^',7))	 
		INTO "lvMetaDataStatusInd1";
		
		SELECT CONCAT("FieldDataType","UserOverwriteDatatype")
	--CONCAT("FieldDataType","UserOverwriteDatatype","IsNullPossible","CharacterMaximumLength","ColumnPrecision")
			INTO "lvMetaDataStatusInd2"
		FROM fda."FDASystemObjectFields"	
		WHERE "FDASystemsId" = "lvFDASystemId"
			AND "FDASystemObjectsId" = "lvFDASystemObjectId"
			AND "FDASystemObjectFieldsId" = "lvFDASystemObjectFieldId";
		
		RAISE NOTICE 'lvMetaDataStatusIndDB1: %',"lvMetaDataStatusInd1";
		RAISE NOTICE 'lvMetaDataStatusIndDB2: %',"lvMetaDataStatusInd2";
*/
-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
		
		IF COALESCE("lvFDASystemObjectFieldId",0) > 0 THEN  --If Field Id Found

			UPDATE fda."FDASystemObjectFields"
			SET "FieldName" =  SPLIT_PART("lvData",'^',2),
				"FieldDataType" =  SPLIT_PART("lvData",'^',3),
				"UserOverwriteDatatype" = NULLIF(SPLIT_PART("lvData",'^',4),''),
				"IsNullPossible" =  SPLIT_PART("lvData",'^',5),
				"CharacterMaximumLength" =  SPLIT_PART("lvData",'^',6),
				"ColumnPrecision" = SPLIT_PART("lvData",'^',7),
				"UserFriendlyFieldName" =  SPLIT_PART("lvData",'^',9),
				"Comment" =  SPLIT_PART("lvData",'^',10),
				"IsSecured" =  SPLIT_PART("lvData",'^',11),
				"IsGDPRRelevant" =  SPLIT_PART("lvData",'^',12),
				"Owner" =  NULLIF(SPLIT_PART("lvData",'^',13),''),
				"AutoMetricsInd" = SPLIT_PART("lvData",'^',14),
				"SegmentedBy" = SPLIT_PART("lvData",'^',15)
				/*"ObsoleteInMetaDataInd" = 	(CASE WHEN "lvMetaDataStatusInd1" <> "lvMetaDataStatusInd2" THEN 'UPDATED'  
													ELSE(CASE WHEN "ObsoleteInMetaDataInd" = 'DELETED' THEN 'NEW'
															ELSE "ObsoleteInMetaDataInd" 
														END)
											END),
				"LastUpdatedOn" = 	(CASE WHEN "lvMetaDataStatusInd1" <> "lvMetaDataStatusInd2" THEN CURRENT_DATE 
											ELSE(CASE WHEN "ObsoleteInMetaDataInd" = 'DELETED' THEN CURRENT_DATE
														ELSE "LastUpdatedOn" 
													END) 			
									END),
				"LastSyncedBy" = 	(CASE WHEN "lvMetaDataStatusInd1" <> "lvMetaDataStatusInd2" THEN "InUserName" 
											ELSE(CASE WHEN "ObsoleteInMetaDataInd" = 'DELETED' THEN "InUserName"
													ELSE "LastSyncedBy" 
												END) 
									END)*/
				
			WHERE "FDASystemsId" = "lvFDASystemId"
				AND "FDASystemObjectsId" = "lvFDASystemObjectId"
				AND "FDASystemObjectFieldsId" = "lvFDASystemObjectFieldId";

		-------------------------------------------------------------------------  
		ELSE  --IF No Field Id Found

			INSERT INTO  fda."FDASystemObjectFields"
			(
				"FDASystemsId",
				"FDASystemObjectsId",
				"ObsoleteInMetaDataInd",
				"FieldName",
				"FieldDataType",
				"UserOverwriteDatatype",
				"IsNullPossible",
				"CharacterMaximumLength",
				"ColumnPrecision",				
				"UserFriendlyFieldName",
				"Comment",
				"IsSecured",
				"IsGDPRRelevant",
				"Owner",
				"AutoMetricsInd",
				"SegmentedBy",
				"LastUpdatedOn",
				"LastSyncedBy"
			)
			VALUES
			(
				"lvFDASystemId",                --FDASystemsId
				"lvFDASystemObjectId",   		--FDASystemObjectsId
				'NEW',                          --ObsoleteInMetaDataInd
				SPLIT_PART("lvData",'^',2),     --FieldName
				SPLIT_PART("lvData",'^',3),     --FieldDataType
				NULLIF(SPLIT_PART("lvData",'^',4),''),     --UserOverwriteDatatype 
				SPLIT_PART("lvData",'^',5),    	--IsNullPossible 
				SPLIT_PART("lvData",'^',6),    	--CharacterMaximumLength 
				SPLIT_PART("lvData",'^',7),    	--ColumnPrecision 
				SPLIT_PART("lvData",'^',9),    	--UserFriendlyFieldName 
				SPLIT_PART("lvData",'^',10),    --Comment 
				SPLIT_PART("lvData",'^',11),   	--IsSecured 
				SPLIT_PART("lvData",'^',12),    --IsGDPRRelevant
				NULLIF(SPLIT_PART("lvData",'^',13),''),    --Owner
				SPLIT_PART("lvData",'^',14),    --AutoMetricsInd
				SPLIT_PART("lvData",'^',15),     --SegmentedBy
               	CURRENT_TIMESTAMP ,             --LastUpdatedOn
				"InUserName"
			);
	
		END IF;
	ELSE IF UPPER("InTabInd") = 'ENTITY' THEN
	
		IF COALESCE("lvFDASystemObjectId",0) > 0 THEN  --If Enity Id Found
		
			UPDATE fda."FDASystemObjects"
			SET "ObjectName" =  SPLIT_PART("lvData",'^',1),
				"AutoMetricsInd" =  CASE WHEN SPLIT_PART("lvData",'^',2) IN ('','false') THEN NULL ELSE SPLIT_PART("lvData",'^',2) END,
				"SegmentedBy" =  SPLIT_PART("lvData",'^',3),
				"RefreshFrequency" = NULLIF(SPLIT_PART("lvData",'^',4),''),
				"RefreshTime"  = CAST(NULLIF(SPLIT_PART("lvData",'^',5),'') AS TIME),
				"Owner" = NULLIF(SPLIT_PART("lvData",'^',6),''),
				"BasicScoreInd" = CASE WHEN SPLIT_PART("lvData",'^',7) IN ('','false') THEN NULL ELSE SPLIT_PART("lvData",'^',7) END,
				"AdvanceScoreInd" = CASE WHEN SPLIT_PART("lvData",'^',8) IN ('','false') THEN NULL ELSE SPLIT_PART("lvData",'^',8) END,
				"ObjectGroup" = NULLIF(SPLIT_PART("lvData",'^',9),''),
				"Comment" = NULLIF(SPLIT_PART("lvData",'^',10),''),
				"ObsoleteInMetaDataInd" = 'UPDATED',
				"LastUpdatedDate" = CURRENT_TIMESTAMP,
				"LastUpdatedBy" = "InUserName"
			WHERE "FDASystemsId" = "lvFDASystemId"
			AND "FDASystemObjectsId" = "lvFDASystemObjectId";
		
		ELSE
		
			INSERT INTO  fda."FDASystemObjects"
			(
				"FDASystemsId",
				"ObjectType", 
				"ObjectName", 
				"AutoMetricsInd",
				"SegmentedBy",
				"RefreshFrequency",
				"RefreshTime",
				"Owner",
				"BasicScoreInd",
				"AdvanceScoreInd",
				"ObjectGroup",
				"Comment",
				"ObsoleteInMetaDataInd",
				"LastUpdatedDate"
			)
			VALUES
			(
				"lvFDASystemId",                --FDASystemsId
				'DATA',                         --ObjectType
				SPLIT_PART("lvData",'^',1),     --EntityName
				CASE WHEN SPLIT_PART("lvData",'^',2) IN ('','false') THEN NULL ELSE SPLIT_PART("lvData",'^',2) END,     --AutoMetricsInd
				SPLIT_PART("lvData",'^',3),     --SegmentedBy
				NULLIF(SPLIT_PART("lvData",'^',4),''),    --RefreshFrequency
				CAST(NULLIF(SPLIT_PART("lvData",'^',5),'') AS TIME), --RefreshBy
				NULLIF(SPLIT_PART("lvData",'^',6),''),     --Owner
				CASE WHEN SPLIT_PART("lvData",'^',7) IN ('','false') THEN NULL ELSE SPLIT_PART("lvData",'^',7) END,   --BasicScoreInd
				CASE WHEN SPLIT_PART("lvData",'^',8) IN ('','false') THEN NULL ELSE SPLIT_PART("lvData",'^',8) END,  --AdvanceScoreInd
				NULLIF(SPLIT_PART("lvData",'^',9),''), --ObjectGroup
				NULLIF(SPLIT_PART("lvData",'^',10),''), --"Comment"
				'NEW',   --ObsoleteInMetaDataInd
				CURRENT_TIMESTAMP   --LastUpdatedDate
			);
		
		END IF;
		
		IF SPLIT_PART("lvData",'^',3) > '' THEN
		
			UPDATE fda."FDASystemObjectFields"
			SET "SegmentedBy" = SPLIT_PART("lvData",'^',3)
			WHERE "FDASystemObjectsId" = "lvFDASystemObjectId"
			AND "FieldDataType" NOT IN ('VARCHAR','DATE','NVARCHAR','CHAR','BOOLEAN','TEXT','STRING','CHAR','CHARACTER','NCHAR','TEXT','NVARCHAR','NVARCHAR2','CHAR VARYING','NCHAR VARYING','VARCHAR2');
		
		END IF;
	
	END IF;
	END IF;

END LOOP;

END;
$BODY$;

------------------------------------------------------------

CREATE OR REPLACE FUNCTION fda."Proc_RuleCatalogOutlier"(
	"InRuleId" character varying,
	"InObjectId" character varying,
	"InObjectScoreId" character varying,
	refcursor,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$

BEGIN
---------------------------------------------OBJECT & RULE DETAILS------------------------------------
IF "InObjectId" = ''  AND "InObjectScoreId" = ''  THEN

OPEN $4 FOR

SELECT X."RuleId",
	X."FDASystemObjectsId",
	X."RuleName",
	X."RuleType",
	X."MasterRuleId",
	X."ObjectName",
	X."FDAObjectScoreId",
	X."SystemName",
	X."OutlierCount",
	X."ScoreRunDate"
	
FROM(SELECT a."FDADataQualityRulesId" AS "RuleId",
			a."RuleName",
			STRING_AGG(DISTINCT b."RuleType"::TEXT,',') "RuleType",
			b."MasterRuleId",
			e."ObjectName",
			e."FDASystemObjectsId",
			STRING_AGG(DISTINCT b."FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
			f."SystemAliasName" AS "SystemName",
			SUM(b."OutlierCount") "OutlierCount",
			LEFT("ScoreRunDate"::TEXT,10) AS "ScoreRunDate"
	FROM fda."FDADataQualityMasterRules" a
	INNER JOIN (SELECT  SUM("OutlierCount") AS "OutlierCount",
						"MasterRuleId",
						"RuleName" AS "RuleType",
						"FDAObjectScoreId",
						"FDAFieldScoreId",
						"LastUpdatedOn"::date AS "ScoreRunDate"
				FROM fda."FDAObjectScoreOutlierCountByCategory"
				WHERE "LastUpdatedOn" > current_date - 30
					AND "MasterRuleId" IS NOT NULL
				GROUP BY "MasterRuleId","RuleName","FDAObjectScoreId","FDAFieldScoreId","LastUpdatedOn"::date
				)b
		ON a."FDADataQualityRulesId" = b."MasterRuleId"
	LEFT JOIN fda."FDAObjectFieldsScoreValue" c
		ON  b."FDAFieldScoreId" = c."FDAObjectFieldsScoreValueId"
			AND b."FDAObjectScoreId" = c."FDAObjectScoreValueId"
	LEFT JOIN fda."FDASystemObjectFields" d
		ON c."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
	LEFT JOIN fda."FDASystemObjects" e
		ON d."FDASystemObjectsId" = e."FDASystemObjectsId"
	LEFT JOIN fda."FDASystems" f
		ON e."FDASystemsId" = f."FDASystemsId"
		
	WHERE  "FDADataQualityRulesId" =  "InRuleId"::bigint
		AND e."ObjectName" IS NOT NULL 
		AND f."SystemAliasName" IS NOT NULL 
	GROUP BY a."FDADataQualityRulesId",a."RuleName",e."ObjectName",
	 		f."SystemAliasName",e."FDASystemObjectsId","ScoreRunDate",b."MasterRuleId"
	)X;
	
RETURN NEXT $4;
---------------------
OPEN $5 FOR

SELECT 
	X."ObjectName",
	X."OutlierCount",
	( MIN("OutlierCount") OVER() ) * 0.8 "MinOutlierCount",
	( MAX("OutlierCount") OVER() ) * 1.2 "MaxOutlierCount"
FROM(SELECT e."ObjectName",
			SUM(b."OutlierCount") "OutlierCount"
	FROM fda."FDADataQualityMasterRules" a
	INNER JOIN (SELECT  SUM("OutlierCount") AS "OutlierCount",
						"MasterRuleId",
						"FDAObjectScoreId",
						"FDAFieldScoreId"
				FROM fda."FDAObjectScoreOutlierCountByCategory"
				WHERE "LastUpdatedOn" > current_date - 30
					AND "MasterRuleId" IS NOT NULL
				GROUP BY "MasterRuleId","RuleName","FDAObjectScoreId","FDAFieldScoreId"
				)b
		ON a."FDADataQualityRulesId" = b."MasterRuleId"
	LEFT JOIN fda."FDAObjectFieldsScoreValue" c
		ON  b."FDAFieldScoreId" = c."FDAObjectFieldsScoreValueId"
			AND b."FDAObjectScoreId" = c."FDAObjectScoreValueId"
	LEFT JOIN fda."FDASystemObjectFields" d
		ON c."FDASystemObjectFieldsId" = d."FDASystemObjectFieldsId"
	LEFT JOIN fda."FDASystemObjects" e
		ON d."FDASystemObjectsId" = e."FDASystemObjectsId"
	LEFT JOIN fda."FDASystems" f
		ON e."FDASystemsId" = f."FDASystemsId"
	 
	WHERE  "FDADataQualityRulesId" = "InRuleId"::bigint
		AND e."ObjectName" IS NOT NULL 
		AND f."SystemAliasName" IS NOT NULL 
	GROUP BY e."ObjectName"
	)X;
RETURN NEXT $5;
---------------------------------------------FIELD & RULE DETAILS------------------------------------
	
ELSE IF "InObjectId" > ''  AND "InObjectScoreId" > ''
THEN

OPEN $4 FOR

SELECT X."RuleName",
	X."RuleType",
	X."MasterRuleId",
	X."ObjectName",
	X."FieldName",
	X."FDAObjectScoreId",
	X."SystemAliasName",
	X."OutlierCount",
	X."ScoreRunDate"
FROM(SELECT a."RuleName",
		STRING_AGG(DISTINCT (b."MasterRuleId"||'-'||b."RuleName")::TEXT,',') "RuleType",
		b."MasterRuleId",
		f."ObjectName",
		e."FieldName",
		STRING_AGG(DISTINCT b."FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
		g."SystemAliasName",
		SUM(b."OutlierCount") "OutlierCount",
	 	LEFT(b."ScoreRunDate"::TEXT,10) AS "ScoreRunDate"
	FROM fda."FDADataQualityMasterRules" a
	INNER JOIN (SELECT 	"FDAObjectScoreOutlierCountByCategoryId",
						"FDAObjectScoreId",
						"FDAFieldScoreId",
						"RuleName",
						"OutlierCount",
						"MasterRuleId",
						"LastUpdatedOn"::date AS "ScoreRunDate"
				FROM fda."FDAObjectScoreOutlierCountByCategory"
				WHERE "LastUpdatedOn" > CURRENT_DATE - 30
					AND "MasterRuleId" IS NOT NULL			
				)b
		ON a."FDADataQualityRulesId" = b."MasterRuleId"
	LEFT JOIN  fda."FDAObjectFieldsScoreValue" d
		ON b."FDAFieldScoreId" = d."FDAObjectFieldsScoreValueId"
			AND b."FDAObjectScoreId" = d."FDAObjectScoreValueId"
	LEFT JOIN fda."FDASystemObjectFields" e
		ON d."FDASystemObjectFieldsId" = e."FDASystemObjectFieldsId"
	LEFT JOIN fda."FDASystemObjects" f
		ON e."FDASystemObjectsId" = f."FDASystemObjectsId"
	LEFT JOIN fda."FDASystems" g
		ON f."FDASystemsId" = g."FDASystemsId"
		
	WHERE a."FDADataQualityRulesId" = "InRuleId"::bigint
		AND f."FDASystemObjectsId" = "InObjectId"::bigint
	 	AND b."FDAObjectScoreId"::text IN ( SELECT "Result" FROM UNNEST(string_to_array("InObjectScoreId", ',')) "Result")
		AND f."ObjectName" IS NOT NULL
	GROUP BY a."FDADataQualityRulesId",a."RuleName",f."ObjectName",e."FieldName",g."SystemAliasName",b."ScoreRunDate",b."MasterRuleId"
	)X;
	
RETURN NEXT $4;

OPEN $5 FOR

SELECT '' "ObjectName",'' "OutlierCount",'' "MinOutlierCount",'' "MaxOutlierCount";

RETURN NEXT $5;

ELSE

OPEN $4 FOR
SELECT '';
RETURN NEXT $4;

OPEN $5 FOR
SELECT '';
RETURN NEXT $5;

END IF;
END IF;

/*
SELECT fda."Proc_RuleCatalogOutlier"(
	'107',--"InRuleId" character varying,
	'',--"InObjectId" character varying,
	'',--"InObjectScoreId" character varying,
	'refcursor1',
	'refcursor2');
FETCH ALL IN "refcursor1";
FETCH ALL IN "refcursor2";
*/

END;

$BODY$;

------------------------------------------------------

CREATE OR REPLACE FUNCTION fda."Proc_DAMAObjectRuleOutlier_V2"(
	"InSystemName" character varying,
	"InObjectName" character varying,
	"InDAMADimension" character varying,
	"InDaysInd" bigint,
	"InDate" character varying,
	refcursor,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$

BEGIN
"InSystemName" := CONCAT('%',"InSystemName",'%');
"InObjectName" := CONCAT('%',"InObjectName",'%');

---------------------------------------------------------------OBJECT(1- DAY)-----------------------------------------------
IF UPPER("InDAMADimension") = 'ACCURACY' --AND "InDaysInd" = 1
THEN

IF "InDaysInd" = 1
THEN

RAISE NOTICE 'DAMADimension : %', 'ACCURACY';
RAISE NOTICE 'DaysInd : %', '1';

OPEN $6 FOR
SELECT "RuleName",
		"OutlierCount",
	   ( MIN("OutlierCount") over() ) * 0.8 "MinOutlierCount",
	   ( MAX("OutlierCount") over() ) * 1.2 "MaxOutlierCount"
FROM(SELECT DISTINCT 
			   d."RuleName",
			   SUM("OutlierCount") AS "OutlierCount"		   
		FROM fda."FDASystems" aa
		INNER JOIN fda."FDASystemObjects" a
			ON aa."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemsId" = b."FDASystemId"
			AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
		INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
			ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON d."FDADataQualityRulesId" = c."MasterRuleId"
		WHERE c."LastUpdatedOn"	::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
			AND d."DAMADimension" ILIKE "InDAMADimension"
			AND aa."SystemAliasName" ILIKE "InSystemName" 
			AND a."ObjectName" ILIKE "InObjectName"
		GROUP BY d."RuleName"
	UNION
		SELECT DISTINCT 
			   "RuleName",
			   (COALESCE(SUM(X."SourceCriticalSeverity"),0) + COALESCE(SUM(X."TargetCriticalSeverity"),0)) AS "OutlierCount"
		FROM(SELECT DISTINCT "ReconciliationDate"::date,
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "SourceCriticalSeverity",
					(CASE WHEN aa."AlertTypeInd" = 'TargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "TargetCriticalSeverity",
					"AlertTag",
					aa."AlertTypeInd",
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN 'SourceCriticalSeverity'
							WHEN aa."AlertTypeInd" = 'TargetValue' THEN 'TargetCriticalSeverity' 
					END) "RuleName"
			FROM(SELECT "FDAAlertRulesId",
						"AlertTypeInd",
					 	"AlertTag",
						split_part("AlertTag", '.'::text, 1) AS "SystemAliasName",
						(split_part("AlertTag", '.'::text, 2) || '.'::text) || split_part("AlertTag", '.'::text, 3) AS "ObjectName"
				FROM fda."FDAAlertRules"
				) aa
			LEFT JOIN(SELECT "FDAAlertRulesId",
							"ReconciliationDate",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 1 THEN 1::bigint
								ELSE 0::bigint
							END) AS "CriticalSeverity",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 9 THEN 1::bigint
								ELSE 0::bigint
							END) AS "AllokSeverity"
					FROM fda."FDAAlertOutput"
					) bb								
				ON aa."FDAAlertRulesId" = bb."FDAAlertRulesId"
			LEFT JOIN fda."FDASystems" cc 
				ON aa."SystemAliasName" = cc."SystemAliasName"
			LEFT JOIN fda."FDASystemObjects" dd 
				ON aa."ObjectName" = dd."ObjectName"
				AND cc."FDASystemsId" = dd."FDASystemsId"
			WHERE bb."ReconciliationDate"::date  = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date	
				AND aa."SystemAliasName" ILIKE "InSystemName" 
				AND aa."ObjectName" ILIKE "InObjectName"			
			GROUP BY aa."AlertTypeInd",bb."ReconciliationDate","AlertTag"
			)X
		GROUP BY "RuleName"
	)Y
ORDER BY "OutlierCount" DESC;
RETURN NEXT $6;

OPEN $7 FOR
	SELECT *
	FROM(SELECT DISTINCT 
			   '' AS "AlertTag",
			   '' AS "AlertTypeInd",
			   c."MasterRuleId" AS "RuleId",
			   aa."SystemAliasName" AS "SystemName",
			   a."ObjectName",
			   c."MasterRuleId"||'-'||c."RuleName" AS "RuleName",
			   'DataQualityRule' AS "RuleType",
			   SUM("OutlierCount") AS "OutlierCount",
			   STRING_AGG(DISTINCT "FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
			   LEFT(c."LastUpdatedOn"::TEXT,10) AS "ScoreRunDate"			
		FROM fda."FDASystems" aa
		INNER JOIN fda."FDASystemObjects" a
			ON aa."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemsId" = b."FDASystemId"
			AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
		INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
			ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON d."FDADataQualityRulesId" = c."MasterRuleId"
		WHERE c."LastUpdatedOn"	::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
			AND d."DAMADimension" ILIKE "InDAMADimension"
			AND aa."SystemAliasName" ILIKE "InSystemName" 
			AND a."ObjectName" ILIKE "InObjectName"
		GROUP BY a."ObjectName",c."RuleName",LEFT(c."LastUpdatedOn"::TEXT,10),aa."SystemAliasName",c."MasterRuleId"
	UNION
		SELECT DISTINCT 
			   "AlertTag",
			   "AlertTypeInd",
			   "RuleId",
			   split_part("AlertTag", '.'::text, 1) AS "SystemName", 
			   (split_part("AlertTag", '.'::text, 2) || '.'::text) || split_part("AlertTag", '.'::text, 3) AS "ObjectName" ,
			   "RuleName",
			   'DataReconciliationRule' AS "RuleType",
			   (COALESCE(SUM(X."SourceCriticalSeverity"),0) + COALESCE(SUM(X."TargetCriticalSeverity"),0)) AS "OutlierCount",
			   '' AS "FDAObjectScoreId",
			   LEFT("ReconciliationDate"::TEXT,10) AS "ScoreRunDate"
		FROM(SELECT DISTINCT "ReconciliationDate"::date,
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "SourceCriticalSeverity",
					(CASE WHEN aa."AlertTypeInd" = 'TargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "TargetCriticalSeverity",
					"AlertTag",
					aa."AlertTypeInd",
					aa."FDAAlertRulesId" AS "RuleId",
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN 'SourceCriticalSeverity'
							WHEN aa."AlertTypeInd" = 'TargetValue' THEN 'TargetCriticalSeverity' 
					END) "RuleName"
			FROM(SELECT "FDAAlertRulesId",
						"AlertTypeInd",
					 	"AlertTag",
						split_part("AlertTag", '.'::text, 1) AS "SystemAliasName",
						(split_part("AlertTag", '.'::text, 2) || '.'::text) || split_part("AlertTag", '.'::text, 3) AS "ObjectName"
				FROM fda."FDAAlertRules"
				) aa
			LEFT JOIN(SELECT "FDAAlertRulesId",
							"ReconciliationDate",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 1 THEN 1::bigint
								ELSE 0::bigint
							END) AS "CriticalSeverity",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 9 THEN 1::bigint
								ELSE 0::bigint
							END) AS "AllokSeverity"
					FROM fda."FDAAlertOutput"
					) bb								
				ON aa."FDAAlertRulesId" = bb."FDAAlertRulesId"
			LEFT JOIN fda."FDASystems" cc 
				ON aa."SystemAliasName" = cc."SystemAliasName"
			LEFT JOIN fda."FDASystemObjects" dd 
				ON aa."ObjectName" = dd."ObjectName"
				AND cc."FDASystemsId" = dd."FDASystemsId" 				
			WHERE bb."ReconciliationDate"::date  = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date	
				AND aa."SystemAliasName" ILIKE "InSystemName" 
				AND aa."ObjectName" ILIKE "InObjectName"			
			GROUP BY aa."AlertTypeInd",bb."ReconciliationDate","AlertTag",aa."FDAAlertRulesId"
			)X
		GROUP BY "AlertTag","AlertTypeInd","RuleName",LEFT("ReconciliationDate"::TEXT,10),"RuleId"
		)Y
	WHERE "OutlierCount" <> 0
	ORDER BY "OutlierCount" DESC;
RETURN NEXT $7;

ELSE 

RAISE NOTICE 'DAMADimension : %', 'ACCURACY';
RAISE NOTICE 'DaysInd : %', '7';

OPEN $6 FOR

SELECT "RuleName",
	   "OutlierCount",
	   ( MIN("OutlierCount") over() ) * 0.8 "MinOutlierCount",
	   ( MAX("OutlierCount") over() ) * 1.2 "MaxOutlierCount"
FROM(SELECT DISTINCT 
			   c."RuleName",
			   SUM("OutlierCount") AS "OutlierCount"		   
		FROM fda."FDASystems" aa
		INNER JOIN fda."FDASystemObjects" a
			ON aa."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemsId" = b."FDASystemId"
			AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
		INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
			ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON d."FDADataQualityRulesId" = c."MasterRuleId"
		WHERE c."LastUpdatedOn"	::date BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
										AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
			AND d."DAMADimension" ILIKE "InDAMADimension"
			AND aa."SystemAliasName" ILIKE "InSystemName" 
			AND a."ObjectName" ILIKE "InObjectName"
		GROUP BY c."RuleName"
	UNION
		SELECT DISTINCT 
			   "RuleName",
			   (COALESCE(SUM(X."SourceCriticalSeverity"),0) + COALESCE(SUM(X."TargetCriticalSeverity"),0)) AS "OutlierCount"
		FROM(SELECT DISTINCT "ReconciliationDate"::date,
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "SourceCriticalSeverity",
					(CASE WHEN aa."AlertTypeInd" = 'TargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "TargetCriticalSeverity",
					"AlertTag",
					aa."AlertTypeInd",
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN 'SourceCriticalSeverity'
							WHEN aa."AlertTypeInd" = 'TargetValue' THEN 'TargetCriticalSeverity' 
					END) "RuleName"
			FROM(SELECT "FDAAlertRulesId",
						"AlertTypeInd",
					 	"AlertTag",
						split_part("AlertTag", '.'::text, 1) AS "SystemAliasName",
						(split_part("AlertTag", '.'::text, 2) || '.'::text) || split_part("AlertTag", '.'::text, 3) AS "ObjectName"
				FROM fda."FDAAlertRules"
				) aa
			LEFT JOIN(SELECT "FDAAlertRulesId",
							"ReconciliationDate",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 1 THEN 1::bigint
								ELSE 0::bigint
							END) AS "CriticalSeverity",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 9 THEN 1::bigint
								ELSE 0::bigint
							END) AS "AllokSeverity"
					FROM fda."FDAAlertOutput"
					) bb								
				ON aa."FDAAlertRulesId" = bb."FDAAlertRulesId"
			LEFT JOIN fda."FDASystems" cc 
				ON aa."SystemAliasName" = cc."SystemAliasName"
			LEFT JOIN fda."FDASystemObjects" dd 
				ON aa."ObjectName" = dd."ObjectName"
				AND cc."FDASystemsId" = dd."FDASystemsId" 		
			WHERE bb."ReconciliationDate"::date  BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
													AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
				AND aa."SystemAliasName" ILIKE "InSystemName" 
				AND aa."ObjectName" ILIKE "InObjectName"			
			GROUP BY aa."AlertTypeInd",bb."ReconciliationDate","AlertTag"
			)X
		GROUP BY "RuleName"
	)Y
ORDER BY "OutlierCount" DESC;
RETURN NEXT $6;

OPEN $7 FOR
	SELECT *
	FROM(SELECT DISTINCT 
			   '' AS "AlertTag",
			   '' AS "AlertTypeInd",
			   c."MasterRuleId" AS "RuleId",
			   aa."SystemAliasName" AS "SystemName",
			   a."ObjectName",
			   c."MasterRuleId"||'-'||c."RuleName" AS "RuleName",
			   'DataQualityRule' AS "RuleType",
			   SUM("OutlierCount") AS "OutlierCount",
			   STRING_AGG(DISTINCT "FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
			   LEFT(c."LastUpdatedOn"::TEXT,10) AS "ScoreRunDate"			
		FROM fda."FDASystems" aa
		INNER JOIN fda."FDASystemObjects" a
			ON aa."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemsId" = b."FDASystemId"
			AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
		INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
			ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON d."FDADataQualityRulesId" = c."MasterRuleId"
		WHERE c."LastUpdatedOn"	::date BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
										AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
			AND d."DAMADimension" ILIKE "InDAMADimension"
			AND aa."SystemAliasName" ILIKE "InSystemName" 
			AND a."ObjectName" ILIKE "InObjectName"
		GROUP BY a."ObjectName",c."RuleName",LEFT(c."LastUpdatedOn"::TEXT,10),aa."SystemAliasName",c."MasterRuleId"
	UNION
		SELECT DISTINCT 
			   "AlertTag",
			   "AlertTypeInd",
			   "RuleId",
			   split_part("AlertTag", '.'::text, 1) AS "SystemName", 
			   (split_part("AlertTag", '.'::text, 2) || '.'::text) || split_part("AlertTag", '.'::text, 3) AS "ObjectName" ,
			   "RuleName",
			   'DataReconciliationRule' AS "RuleType",
			   (COALESCE(SUM(X."SourceCriticalSeverity"),0) + COALESCE(SUM(X."TargetCriticalSeverity"),0)) AS "OutlierCount",
			   '' AS "FDAObjectScoreId",
			   LEFT("ReconciliationDate"::TEXT,10) AS "ScoreRunDate"
		FROM(SELECT DISTINCT "ReconciliationDate"::date,
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "SourceCriticalSeverity",
					(CASE WHEN aa."AlertTypeInd" = 'TargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "TargetCriticalSeverity",
					"AlertTag",
					aa."AlertTypeInd",
					aa."FDAAlertRulesId" AS "RuleId",
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN 'SourceCriticalSeverity'
							WHEN aa."AlertTypeInd" = 'TargetValue' THEN 'TargetCriticalSeverity' 
					END) "RuleName"
			FROM(SELECT "FDAAlertRulesId",
						"AlertTypeInd",
					 	"AlertTag",
						split_part("AlertTag", '.'::text, 1) AS "SystemAliasName",
						(split_part("AlertTag", '.'::text, 2) || '.'::text) || split_part("AlertTag", '.'::text, 3) AS "ObjectName"
				FROM fda."FDAAlertRules"
				) aa
			LEFT JOIN(SELECT "FDAAlertRulesId",
							"ReconciliationDate",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 1 THEN 1::bigint
								ELSE 0::bigint
							END) AS "CriticalSeverity",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 9 THEN 1::bigint
								ELSE 0::bigint
							END) AS "AllokSeverity"
					FROM fda."FDAAlertOutput"
					) bb								
				ON aa."FDAAlertRulesId" = bb."FDAAlertRulesId"
			LEFT JOIN fda."FDASystems" cc 
				ON aa."SystemAliasName" = cc."SystemAliasName"
			LEFT JOIN fda."FDASystemObjects" dd 
				ON aa."ObjectName" = dd."ObjectName"
				AND cc."FDASystemsId" = dd."FDASystemsId"				
			WHERE bb."ReconciliationDate"::date  BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
													AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
				AND aa."SystemAliasName" ILIKE "InSystemName" 
				AND aa."ObjectName" ILIKE "InObjectName"			
			GROUP BY aa."AlertTypeInd",bb."ReconciliationDate","AlertTag",aa."FDAAlertRulesId"
			)X
		GROUP BY "AlertTag","AlertTypeInd","RuleName",LEFT("ReconciliationDate"::TEXT,10),"RuleId"
		)Y
	WHERE "OutlierCount" <> 0
	ORDER BY "OutlierCount" DESC;
RETURN NEXT $7;
END IF;
---------------------------------------------------------------------------------------------------------
ELSE IF UPPER("InDAMADimension") = 'TIMELINESS'
THEN

IF  "InDaysInd" = 1 THEN

RAISE NOTICE 'DAMADimension : %', 'TIMELINESS';
RAISE NOTICE 'DaysInd : %', '1';

OPEN $6 FOR

SELECT  "RuleName",
		"OutlierCount",
	   ( MIN("OutlierCount") over() ) * 0.8 "MinOutlierCount",
	   ( MAX("OutlierCount") over() ) * 1.2 "MaxOutlierCount"
FROM(SELECT DISTINCT 
			c."RuleName",
			SUM("OutlierCount") AS "OutlierCount"			
	FROM fda."FDASystems" aa
	INNER JOIN fda."FDASystemObjects" a
		ON aa."FDASystemsId" = a."FDASystemsId"
	INNER JOIN fda."FDAObjectsScoreValue" b
		ON a."FDASystemsId" = b."FDASystemId"
		AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
	INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
		ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
	INNER JOIN fda."FDADataQualityMasterRules" d
		ON d."FDADataQualityRulesId" = c."MasterRuleId"
	WHERE c."LastUpdatedOn"	::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
		AND d."DAMADimension" ILIKE "InDAMADimension"
		AND aa."SystemAliasName" ILIKE "InSystemName" 
		AND a."ObjectName" ILIKE "InObjectName"
	GROUP BY c."RuleName"
UNION
	SELECT DISTINCT 
			'Freshness/SLA' AS "RuleName",
			SUM((CASE WHEN "Color" = 'RED' THEN 1 ELSE 0 END) + "RedSLA") AS "OutlierCount"
	FROM(SELECT b."LastRefreshedDateTime"::date AS "ScoreRunDate",
				(CASE WHEN a."RefreshFrequency" = 'Monthly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 30 THEN 'RED'
					WHEN a."RefreshFrequency" = 'Weekly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 7 THEN 'RED'
					WHEN a."RefreshFrequency" = 'Daily' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
					WHEN a."RefreshFrequency" = 'Daily Exclude Weekend' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
					WHEN a."RefreshFrequency" = 'Only Initial Refresh' THEN 'GREEN'
					ELSE 'GREEN' 
				END) "Color",
				(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) = to_char(b."LoadStartTime", 'HH24:MI'::text) 
						THEN 1
					ELSE 0
				END) AS "GreenSLA",
				(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) <> to_char(b."LoadStartTime", 'HH24:MI'::text) 
						THEN 1
					ELSE 0
				END) AS "RedSLA"			
		FROM fda."FDASystems" a1
		INNER JOIN fda."FDASystemObjects" a
			ON a1."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
		WHERE b."LastRefreshedDateTime"::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date	
			AND a1."SystemAliasName" ILIKE "InSystemName"
			AND a."ObjectName" ILIKE "InObjectName"
		)X
	)Y
ORDER BY "OutlierCount" DESC;
RETURN NEXT $6;		

OPEN $7 FOR

	SELECT *
	FROM(SELECT DISTINCT 
			   c."MasterRuleId" AS "RuleId",
			   aa."SystemAliasName" AS "SystemName",
			   a."ObjectName",
			   c."MasterRuleId"||'-'||c."RuleName" AS "RuleName",
			   'DataQualityRule' AS "RuleType",
			   SUM("OutlierCount") AS "OutlierCount",
			   STRING_AGG(DISTINCT "FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
			   LEFT(c."LastUpdatedOn"::TEXT,10) AS "ScoreRunDate"			
		FROM fda."FDASystems" aa
		INNER JOIN fda."FDASystemObjects" a
			ON aa."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemsId" = b."FDASystemId"
			AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
		INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
			ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON d."FDADataQualityRulesId" = c."MasterRuleId"
		WHERE c."LastUpdatedOn"	::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
			AND d."DAMADimension" ILIKE "InDAMADimension"
			AND aa."SystemAliasName" ILIKE "InSystemName" 
			AND a."ObjectName" ILIKE "InObjectName"
		GROUP BY a."ObjectName",c."RuleName",LEFT(c."LastUpdatedOn"::TEXT,10),aa."SystemAliasName",c."MasterRuleId"
	UNION
		SELECT DISTINCT 
				   0 AS "RuleId",
				   "SystemAliasName" AS "SystemName",
				   "ObjectName",
				   'Freshness/SLA' AS "RuleName",
				   'DataQualityFreshnessRule' AS "RuleType",
				   SUM((CASE WHEN "Color" = 'RED' THEN 1 ELSE 0 END) + "RedSLA") AS "OutlierCount",
				   '0' "FDAObjectScoreId",
				   LEFT("ScoreRunDate"::TEXT,10) AS "ScoreRunDate"
			FROM(SELECT b."LastRefreshedDateTime"::date AS "ScoreRunDate",
						(CASE WHEN a."RefreshFrequency" = 'Monthly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 30 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Weekly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 7 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Daily' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Daily Exclude Weekend' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Only Initial Refresh' THEN 'GREEN'
							ELSE 'GREEN' 
						END) "Color",
						(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) = to_char(b."LoadStartTime", 'HH24:MI'::text) 
								THEN 1
							ELSE 0
						END) AS "GreenSLA",
						(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) <> to_char(b."LoadStartTime", 'HH24:MI'::text) 
								THEN 1
							ELSE 0
						END) AS "RedSLA",
						a1."SystemAliasName",
						a."ObjectName"
				FROM fda."FDASystems" a1
				INNER JOIN fda."FDASystemObjects" a
					ON a1."FDASystemsId" = a."FDASystemsId"
				INNER JOIN fda."FDAObjectsScoreValue" b
					ON a."FDASystemObjectsId" = b."FDASystemObjectsId"	
				WHERE b."LastRefreshedDateTime"::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date	
					AND a1."SystemAliasName" ILIKE "InSystemName"
					AND a."ObjectName" ILIKE "InObjectName"
				)X
			GROUP BY "SystemAliasName","ObjectName",LEFT("ScoreRunDate"::TEXT,10)
		)Y
		WHERE "OutlierCount" <> 0
	ORDER BY "OutlierCount" DESC;
RETURN NEXT $7;

ELSE 

RAISE NOTICE 'DAMADimension : %', 'TIMELINESS';
RAISE NOTICE 'DaysInd : %', '7';

OPEN $6 FOR

SELECT  "RuleName",
		"OutlierCount",
	   ( MIN("OutlierCount") over() ) * 0.8 "MinOutlierCount",
	   ( MAX("OutlierCount") over() ) * 1.2 "MaxOutlierCount"
FROM(SELECT DISTINCT 
			c."RuleName",
			SUM("OutlierCount") AS "OutlierCount"			
	FROM fda."FDASystems" aa
	INNER JOIN fda."FDASystemObjects" a
		ON aa."FDASystemsId" = a."FDASystemsId"
	INNER JOIN fda."FDAObjectsScoreValue" b
		ON a."FDASystemsId" = b."FDASystemId"
		AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
	INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
		ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
	INNER JOIN fda."FDADataQualityMasterRules" d
		ON d."FDADataQualityRulesId" = c."MasterRuleId"
	WHERE c."LastUpdatedOn"	::date BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
									AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
		AND d."DAMADimension" ILIKE "InDAMADimension"
		AND aa."SystemAliasName" ILIKE "InSystemName" 
		AND a."ObjectName" ILIKE "InObjectName"
	GROUP BY c."RuleName"
UNION
		SELECT DISTINCT 
				'Freshness/SLA' AS "RuleName",
				SUM((CASE WHEN "Color" = 'RED' THEN 1 ELSE 0 END) + "RedSLA") AS "OutlierCount"
		FROM(SELECT b."LastRefreshedDateTime"::date AS "ScoreRunDate",
					(CASE WHEN a."RefreshFrequency" = 'Monthly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 30 THEN 'RED'
						WHEN a."RefreshFrequency" = 'Weekly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 7 THEN 'RED'
						WHEN a."RefreshFrequency" = 'Daily' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
						WHEN a."RefreshFrequency" = 'Daily Exclude Weekend' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
						WHEN a."RefreshFrequency" = 'Only Initial Refresh' THEN 'GREEN'
						ELSE 'GREEN' 
					END) "Color",
					(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) = to_char(b."LoadStartTime", 'HH24:MI'::text) 
							THEN 1
						ELSE 0
					END) AS "GreenSLA",
					(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) <> to_char(b."LoadStartTime", 'HH24:MI'::text) 
							THEN 1
						ELSE 0
					END) AS "RedSLA"			
			FROM fda."FDASystems" a1
			INNER JOIN fda."FDASystemObjects" a
				ON a1."FDASystemsId" = a."FDASystemsId"
			INNER JOIN fda."FDAObjectsScoreValue" b
				ON a."FDASystemObjectsId" = b."FDASystemObjectsId"	
			WHERE b."LastRefreshedDateTime"::date  BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
													AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date	
				AND a1."SystemAliasName" ILIKE "InSystemName"
				AND a."ObjectName" ILIKE "InObjectName"
			)X
	)Y
ORDER BY "OutlierCount" DESC;

RETURN NEXT $6;		

OPEN $7 FOR

	SELECT *
	FROM(SELECT DISTINCT 
			   c."MasterRuleId" AS "RuleId",
			   aa."SystemAliasName" AS "SystemName",
			   a."ObjectName",
			   c."MasterRuleId"||'-'||c."RuleName" AS "RuleName",
			   'DataQualityRule' AS "RuleType",
			   SUM("OutlierCount") AS "OutlierCount",
			   STRING_AGG(DISTINCT "FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
			   LEFT(c."LastUpdatedOn"::TEXT,10) AS "ScoreRunDate"			
		FROM fda."FDASystems" aa
		INNER JOIN fda."FDASystemObjects" a
			ON aa."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemsId" = b."FDASystemId"
			AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
		INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
			ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON d."FDADataQualityRulesId" = c."MasterRuleId"	
		WHERE c."LastUpdatedOn"	::date BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
										AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
			AND d."DAMADimension" ILIKE "InDAMADimension"
			AND aa."SystemAliasName" ILIKE "InSystemName" 
			AND a."ObjectName" ILIKE "InObjectName"
		GROUP BY a."ObjectName",c."RuleName",LEFT(c."LastUpdatedOn"::TEXT,10),aa."SystemAliasName",c."MasterRuleId"
	UNION
		SELECT DISTINCT 
				   0 AS "RuleId",
				   "SystemAliasName" AS "SystemName",
				   "ObjectName",
				   'Freshness/SLA' AS "RuleName",
				   'DataQualityFreshnessRule' AS "RuleType",
				   SUM((CASE WHEN "Color" = 'RED' THEN 1 ELSE 0 END) + "RedSLA") AS "OutlierCount",
				   '0' "FDAObjectScoreId",
				   LEFT("ScoreRunDate"::TEXT,10) AS "ScoreRunDate"
			FROM(SELECT b."LastRefreshedDateTime"::date AS "ScoreRunDate",
						(CASE WHEN a."RefreshFrequency" = 'Monthly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 30 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Weekly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 7 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Daily' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Daily Exclude Weekend' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Only Initial Refresh' THEN 'GREEN'
							ELSE 'GREEN' 
						END) "Color",
						(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) = to_char(b."LoadStartTime", 'HH24:MI'::text) 
								THEN 1
							ELSE 0
						END) AS "GreenSLA",
						(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) <> to_char(b."LoadStartTime", 'HH24:MI'::text) 
								THEN 1
							ELSE 0
						END) AS "RedSLA",
						a1."SystemAliasName",
						a."ObjectName"
				FROM fda."FDASystems" a1
				INNER JOIN fda."FDASystemObjects" a
					ON a1."FDASystemsId" = a."FDASystemsId"
				INNER JOIN fda."FDAObjectsScoreValue" b
					ON a."FDASystemObjectsId" = b."FDASystemObjectsId"	
				WHERE b."LastRefreshedDateTime"::date  BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
													AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date	
					AND a1."SystemAliasName" ILIKE "InSystemName"
					AND a."ObjectName" ILIKE "InObjectName"
				)X
			GROUP BY "SystemAliasName","ObjectName",LEFT("ScoreRunDate"::TEXT,10)
		)Y
		WHERE "OutlierCount" <> 0
	ORDER BY "OutlierCount" DESC;
RETURN NEXT $7;

END IF;
--------------------------------------------------------------------------------------------------------------
ELSE 

IF  "InDaysInd" = 1 THEN

RAISE NOTICE 'DAMADimension : %', 'OTHER RULES';
RAISE NOTICE 'DaysInd : %', '1';

OPEN $6 FOR 

SELECT "RuleName",
		"OutlierCount",
	   ( MIN("OutlierCount") over() ) * 0.8 "MinOutlierCount",
	   ( MAX("OutlierCount") over() ) * 1.2 "MaxOutlierCount"
FROM(SELECT DISTINCT 
			c."RuleName",
			SUM("OutlierCount") AS "OutlierCount"			
	FROM fda."FDASystems" aa
	INNER JOIN fda."FDASystemObjects" a
		ON aa."FDASystemsId" = a."FDASystemsId"
	INNER JOIN fda."FDAObjectsScoreValue" b
		ON a."FDASystemsId" = b."FDASystemId"
		AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
	INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
		ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
	INNER JOIN fda."FDADataQualityMasterRules" d
		ON d."FDADataQualityRulesId" = c."MasterRuleId"
	WHERE c."LastUpdatedOn"	::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
		AND d."DAMADimension" ILIKE "InDAMADimension"
		AND aa."SystemAliasName" ILIKE "InSystemName" 
		AND a."ObjectName" ILIKE "InObjectName"
	GROUP BY c."RuleName"
	)X
ORDER BY "OutlierCount" DESC;
RETURN NEXT $6;

OPEN $7 FOR 

SELECT DISTINCT 
		c."MasterRuleId" AS "RuleId",
		aa."SystemAliasName" AS "SystemName",
		a."ObjectName",
		c."MasterRuleId"||'-'||c."RuleName" AS "RuleName",
		'DataQualityRule' AS "RuleType",
		SUM("OutlierCount") AS "OutlierCount",
		STRING_AGG(DISTINCT "FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
		LEFT(c."LastUpdatedOn"::TEXT,10) AS "ScoreRunDate"			
FROM fda."FDASystems" aa
INNER JOIN fda."FDASystemObjects" a
	ON aa."FDASystemsId" = a."FDASystemsId"
INNER JOIN fda."FDAObjectsScoreValue" b
	ON a."FDASystemsId" = b."FDASystemId"
	AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
	ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
INNER JOIN fda."FDADataQualityMasterRules" d
	ON d."FDADataQualityRulesId" = c."MasterRuleId"
INNER JOIN fda. "FDADataQualityMasterRuleObjectColumns" e
	ON b."FDASystemObjectsId" = e. "FDASystemObjectsId"	
WHERE c."LastUpdatedOn"	::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
	AND d."DAMADimension" ILIKE "InDAMADimension"
	AND aa."SystemAliasName" ILIKE "InSystemName" 
	AND a."ObjectName" ILIKE "InObjectName"
GROUP BY a."ObjectName",c."MasterRuleId",c."RuleName",LEFT(c."LastUpdatedOn"::TEXT,10),aa."SystemAliasName"
ORDER BY "OutlierCount" DESC;

RETURN NEXT $7;

ELSE

RAISE NOTICE 'DAMADimension : %', 'OTHER RULES';
RAISE NOTICE 'DaysInd : %', '7';

OPEN $6 FOR 

SELECT  "RuleName",
		"OutlierCount",
	   ( MIN("OutlierCount") over() ) * 0.8 "MinOutlierCount",
	   ( MAX("OutlierCount") over() ) * 1.2 "MaxOutlierCount"
FROM(SELECT DISTINCT 
			c."RuleName",
			SUM("OutlierCount") AS "OutlierCount"			
	FROM fda."FDASystems" aa
	INNER JOIN fda."FDASystemObjects" a
		ON aa."FDASystemsId" = a."FDASystemsId"
	INNER JOIN fda."FDAObjectsScoreValue" b
		ON a."FDASystemsId" = b."FDASystemId"
		AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
	INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
		ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
	INNER JOIN fda."FDADataQualityMasterRules" d
		ON d."FDADataQualityRulesId" = c."MasterRuleId"
	WHERE c."LastUpdatedOn"	::date BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
										AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
		AND d."DAMADimension" ILIKE "InDAMADimension"
		AND aa."SystemAliasName" ILIKE "InSystemName" 
		AND a."ObjectName" ILIKE "InObjectName"
	GROUP BY c."RuleName"
	ORDER BY "OutlierCount" DESC
	)X;
RETURN NEXT $6;

OPEN $7 FOR 

SELECT DISTINCT 
		c."MasterRuleId" AS "RuleId",
		aa."SystemAliasName" AS "SystemName",
		a."ObjectName",
		c."MasterRuleId"||'-'||c."RuleName" AS "RuleName",
		'DataQualityRule' AS "RuleType",
		SUM("OutlierCount") AS "OutlierCount",
		STRING_AGG(DISTINCT "FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
		LEFT(c."LastUpdatedOn"::TEXT,10) AS "ScoreRunDate"			
FROM fda."FDASystems" aa
INNER JOIN fda."FDASystemObjects" a
	ON aa."FDASystemsId" = a."FDASystemsId"
INNER JOIN fda."FDAObjectsScoreValue" b
	ON a."FDASystemsId" = b."FDASystemId"
	AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
	ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
INNER JOIN fda."FDADataQualityMasterRules" d
	ON d."FDADataQualityRulesId" = c."MasterRuleId"
INNER JOIN fda. "FDADataQualityMasterRuleObjectColumns" e
	ON b."FDASystemObjectsId" = e. "FDASystemObjectsId"	
WHERE c."LastUpdatedOn"	::date BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
										AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
	AND d."DAMADimension" ILIKE "InDAMADimension"
	AND aa."SystemAliasName" ILIKE "InSystemName" 
	AND a."ObjectName" ILIKE "InObjectName"
GROUP BY a."ObjectName",c."MasterRuleId",c."RuleName",LEFT(c."LastUpdatedOn"::TEXT,10),aa."SystemAliasName"
ORDER BY "OutlierCount" DESC;

RETURN NEXT $7;

END IF;

END IF;
END IF;

END;
$BODY$;

----------------------------------------------------------------

CREATE OR REPLACE FUNCTION fda."Proc_DAMAFieldRuleOutlier"(
	"InObjectScoreId" character varying,
	"InObjectName" character varying,
	"InRuleName" character varying,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$

BEGIN
"InRuleName"   := CONCAT('%',"InRuleName",'%');
"InObjectName" := CONCAT('%',"InObjectName",'%');

OPEN $4 FOR

SELECT a."ObjectName",
	   b."FieldName",
	   SUM(d."OutlierCount") AS "OutlierCount",
		d."MasterRuleId"||'-'||d."RuleName" AS "RuleName", 
	   d."MasterRuleId" AS "RuleId",
	   STRING_AGG(d."FDAObjectScoreId"::text,',') AS "FDAObjectScoreId"
FROM fda."FDASystemObjects" a
INNER JOIN fda."FDASystemObjectFields" b
	ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
INNER JOIN fda."FDAObjectFieldsScoreValue" c
	ON b."FDASystemObjectFieldsId" = c."FDASystemObjectFieldsId"
INNER JOIN (SELECT "FDAObjectScoreOutlierCountByCategoryId",
					"FDAObjectScoreId",
					"FDAFieldScoreId",
					"OutlierCount",
					"LastUpdatedOn",
					"MasterRuleId",
					/*(CASE WHEN "RuleName" IN('Numeric DataType Check','Date DataType Check','Email DataType Check','Zip Code DataType Check') THEN 'DataTypeOutlier'
						WHEN "RuleName" IN ('Blank Check','Blank/NonBlank') THEN 'NullOutlier'
						WHEN "RuleName" IN ('Enumerated Value','Date Enumerated Value(Query)') THEN 'EnumerationCheckOutlier'
						WHEN "RuleName" = 'Date Distinct Check' THEN 'DistinctCheckOutlier'
						WHEN "RuleName" = 'Date Fixed static value' THEN 'FixedStaticValueOutlier'
						WHEN "RuleName" = 'Date Length Check' THEN 'FieldLengthCheckOutlier'
						WHEN "RuleName" = 'Possible Character' THEN 'InvalidCharacterOutlier'
						WHEN "RuleName" = 'Range of Values' THEN 'NumberRangeOutlier' 
					END) "RuleName"*/
					"RuleName"
			FROM  fda."FDAObjectScoreOutlierCountByCategory"
			) d
			
	ON c."FDAObjectFieldsScoreValueId" = d."FDAFieldScoreId"
INNER JOIN fda."FDADataQualityMasterRules" f
	ON f."FDADataQualityRulesId" = d."MasterRuleId"
WHERE d."FDAObjectScoreId"::TEXT IN ( SELECT "Result" FROM UNNEST(string_to_array("InObjectScoreId", ',')) "Result")
	AND a."ObjectName" ILIKE "InObjectName"
	AND d."MasterRuleId"||'-'||d."RuleName" ILIKE  "InRuleName"	
GROUP BY a."ObjectName",b."FieldName",d."RuleName",d."MasterRuleId";

RETURN NEXT $4;

END;
$BODY$;

----------------------------------------------------

CREATE OR REPLACE FUNCTION fda."Proc_DAMAObjectRuleOutlier_V2"(
	"InSystemName" character varying,
	"InObjectName" character varying,
	"InDAMADimension" character varying,
	"InDaysInd" bigint,
	"InDate" character varying,
	refcursor,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$

BEGIN
"InSystemName" := CONCAT('%',"InSystemName",'%');
"InObjectName" := CONCAT('%',"InObjectName",'%');

---------------------------------------------------------------OBJECT(1- DAY)-----------------------------------------------
IF UPPER("InDAMADimension") = 'ACCURACY' --AND "InDaysInd" = 1
THEN

IF "InDaysInd" = 1
THEN

RAISE NOTICE 'DAMADimension : %', 'ACCURACY';
RAISE NOTICE 'DaysInd : %', '1';

OPEN $6 FOR
SELECT "RuleName",
		"OutlierCount",
	   ( MIN("OutlierCount") over() ) * 0.8 "MinOutlierCount",
	   ( MAX("OutlierCount") over() ) * 1.2 "MaxOutlierCount"
FROM(SELECT DISTINCT 
			   d."RuleName",
			   SUM("OutlierCount") AS "OutlierCount"		   
		FROM fda."FDASystems" aa
		INNER JOIN fda."FDASystemObjects" a
			ON aa."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemsId" = b."FDASystemId"
			AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
		INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
			ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON d."FDADataQualityRulesId" = c."MasterRuleId"
		WHERE c."LastUpdatedOn"	::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
			AND d."DAMADimension" ILIKE "InDAMADimension"
			AND aa."SystemAliasName" ILIKE "InSystemName" 
			AND a."ObjectName" ILIKE "InObjectName"
		GROUP BY d."RuleName"
	UNION
		SELECT DISTINCT 
			   "RuleName",
			   (COALESCE(SUM(X."SourceCriticalSeverity"),0) + COALESCE(SUM(X."TargetCriticalSeverity"),0)) AS "OutlierCount"
		FROM(SELECT DISTINCT "ReconciliationDate"::date,
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "SourceCriticalSeverity",
					(CASE WHEN aa."AlertTypeInd" = 'TargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "TargetCriticalSeverity",
					"AlertTag",
					aa."AlertTypeInd",
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN 'SourceCriticalSeverity'
							WHEN aa."AlertTypeInd" = 'TargetValue' THEN 'TargetCriticalSeverity' 
					END) "RuleName"
			FROM(SELECT "FDAAlertRulesId",
						"AlertTypeInd",
					 	"AlertTag",
						split_part("AlertTag", '.'::text, 1) AS "SystemAliasName",
						(split_part("AlertTag", '.'::text, 2) || '.'::text) || split_part("AlertTag", '.'::text, 3) AS "ObjectName"
				FROM fda."FDAAlertRules"
				) aa
			LEFT JOIN(SELECT "FDAAlertRulesId",
							"ReconciliationDate",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 1 THEN 1::bigint
								ELSE 0::bigint
							END) AS "CriticalSeverity",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 9 THEN 1::bigint
								ELSE 0::bigint
							END) AS "AllokSeverity"
					FROM fda."FDAAlertOutput"
					) bb								
				ON aa."FDAAlertRulesId" = bb."FDAAlertRulesId"
			LEFT JOIN fda."FDASystems" cc 
				ON aa."SystemAliasName" = cc."SystemAliasName"
			LEFT JOIN fda."FDASystemObjects" dd 
				ON aa."ObjectName" = dd."ObjectName"
				AND cc."FDASystemsId" = dd."FDASystemsId"
			WHERE bb."ReconciliationDate"::date  = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date	
				AND aa."SystemAliasName" ILIKE "InSystemName" 
				AND aa."ObjectName" ILIKE "InObjectName"			
			GROUP BY aa."AlertTypeInd",bb."ReconciliationDate","AlertTag"
			)X
		GROUP BY "RuleName"
	)Y
ORDER BY "OutlierCount" DESC;
RETURN NEXT $6;

OPEN $7 FOR
	SELECT *
	FROM(SELECT DISTINCT 
			   '' AS "AlertTag",
			   '' AS "AlertTypeInd",
			   c."MasterRuleId" AS "RuleId",
			   aa."SystemAliasName" AS "SystemName",
			   a."ObjectName",
			   c."MasterRuleId"||'-'||c."RuleName" AS "RuleName",
			   'DataQualityRule' AS "RuleType",
			   SUM("OutlierCount") AS "OutlierCount",
			   STRING_AGG(DISTINCT "FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
			   LEFT(c."LastUpdatedOn"::TEXT,10) AS "ScoreRunDate"			
		FROM fda."FDASystems" aa
		INNER JOIN fda."FDASystemObjects" a
			ON aa."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemsId" = b."FDASystemId"
			AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
		INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
			ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON d."FDADataQualityRulesId" = c."MasterRuleId"
		WHERE c."LastUpdatedOn"	::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
			AND d."DAMADimension" ILIKE "InDAMADimension"
			AND aa."SystemAliasName" ILIKE "InSystemName" 
			AND a."ObjectName" ILIKE "InObjectName"
		GROUP BY a."ObjectName",c."RuleName",LEFT(c."LastUpdatedOn"::TEXT,10),aa."SystemAliasName",c."MasterRuleId"
	UNION
		SELECT DISTINCT 
			   "AlertTag",
			   "AlertTypeInd",
			   "RuleId",
			   split_part("AlertTag", '.'::text, 1) AS "SystemName", 
			   (split_part("AlertTag", '.'::text, 2) || '.'::text) || split_part("AlertTag", '.'::text, 3) AS "ObjectName" ,
			   "RuleName",
			   'DataReconciliationRule' AS "RuleType",
			   (COALESCE(SUM(X."SourceCriticalSeverity"),0) + COALESCE(SUM(X."TargetCriticalSeverity"),0)) AS "OutlierCount",
			   '' AS "FDAObjectScoreId",
			   LEFT("ReconciliationDate"::TEXT,10) AS "ScoreRunDate"
		FROM(SELECT DISTINCT "ReconciliationDate"::date,
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "SourceCriticalSeverity",
					(CASE WHEN aa."AlertTypeInd" = 'TargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "TargetCriticalSeverity",
					"AlertTag",
					aa."AlertTypeInd",
					aa."FDAAlertRulesId" AS "RuleId",
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN 'SourceCriticalSeverity'
							WHEN aa."AlertTypeInd" = 'TargetValue' THEN 'TargetCriticalSeverity' 
					END) "RuleName"
			FROM(SELECT "FDAAlertRulesId",
						"AlertTypeInd",
					 	"AlertTag",
						split_part("AlertTag", '.'::text, 1) AS "SystemAliasName",
						(split_part("AlertTag", '.'::text, 2) || '.'::text) || split_part("AlertTag", '.'::text, 3) AS "ObjectName"
				FROM fda."FDAAlertRules"
				) aa
			LEFT JOIN(SELECT "FDAAlertRulesId",
							"ReconciliationDate",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 1 THEN 1::bigint
								ELSE 0::bigint
							END) AS "CriticalSeverity",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 9 THEN 1::bigint
								ELSE 0::bigint
							END) AS "AllokSeverity"
					FROM fda."FDAAlertOutput"
					) bb								
				ON aa."FDAAlertRulesId" = bb."FDAAlertRulesId"
			LEFT JOIN fda."FDASystems" cc 
				ON aa."SystemAliasName" = cc."SystemAliasName"
			LEFT JOIN fda."FDASystemObjects" dd 
				ON aa."ObjectName" = dd."ObjectName"
				AND cc."FDASystemsId" = dd."FDASystemsId" 				
			WHERE bb."ReconciliationDate"::date  = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date	
				AND aa."SystemAliasName" ILIKE "InSystemName" 
				AND aa."ObjectName" ILIKE "InObjectName"			
			GROUP BY aa."AlertTypeInd",bb."ReconciliationDate","AlertTag",aa."FDAAlertRulesId"
			)X
		GROUP BY "AlertTag","AlertTypeInd","RuleName",LEFT("ReconciliationDate"::TEXT,10),"RuleId"
		)Y
	WHERE "OutlierCount" <> 0
	ORDER BY "OutlierCount" DESC;
RETURN NEXT $7;

ELSE 

RAISE NOTICE 'DAMADimension : %', 'ACCURACY';
RAISE NOTICE 'DaysInd : %', '7';

OPEN $6 FOR

SELECT "RuleName",
	   "OutlierCount",
	   ( MIN("OutlierCount") over() ) * 0.8 "MinOutlierCount",
	   ( MAX("OutlierCount") over() ) * 1.2 "MaxOutlierCount"
FROM(SELECT DISTINCT 
			   c."RuleName",
			   SUM("OutlierCount") AS "OutlierCount"		   
		FROM fda."FDASystems" aa
		INNER JOIN fda."FDASystemObjects" a
			ON aa."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemsId" = b."FDASystemId"
			AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
		INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
			ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON d."FDADataQualityRulesId" = c."MasterRuleId"
		WHERE c."LastUpdatedOn"	::date BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
										AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
			AND d."DAMADimension" ILIKE "InDAMADimension"
			AND aa."SystemAliasName" ILIKE "InSystemName" 
			AND a."ObjectName" ILIKE "InObjectName"
		GROUP BY c."RuleName"
	UNION
		SELECT DISTINCT 
			   "RuleName",
			   (COALESCE(SUM(X."SourceCriticalSeverity"),0) + COALESCE(SUM(X."TargetCriticalSeverity"),0)) AS "OutlierCount"
		FROM(SELECT DISTINCT "ReconciliationDate"::date,
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "SourceCriticalSeverity",
					(CASE WHEN aa."AlertTypeInd" = 'TargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "TargetCriticalSeverity",
					"AlertTag",
					aa."AlertTypeInd",
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN 'SourceCriticalSeverity'
							WHEN aa."AlertTypeInd" = 'TargetValue' THEN 'TargetCriticalSeverity' 
					END) "RuleName"
			FROM(SELECT "FDAAlertRulesId",
						"AlertTypeInd",
					 	"AlertTag",
						split_part("AlertTag", '.'::text, 1) AS "SystemAliasName",
						(split_part("AlertTag", '.'::text, 2) || '.'::text) || split_part("AlertTag", '.'::text, 3) AS "ObjectName"
				FROM fda."FDAAlertRules"
				) aa
			LEFT JOIN(SELECT "FDAAlertRulesId",
							"ReconciliationDate",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 1 THEN 1::bigint
								ELSE 0::bigint
							END) AS "CriticalSeverity",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 9 THEN 1::bigint
								ELSE 0::bigint
							END) AS "AllokSeverity"
					FROM fda."FDAAlertOutput"
					) bb								
				ON aa."FDAAlertRulesId" = bb."FDAAlertRulesId"
			LEFT JOIN fda."FDASystems" cc 
				ON aa."SystemAliasName" = cc."SystemAliasName"
			LEFT JOIN fda."FDASystemObjects" dd 
				ON aa."ObjectName" = dd."ObjectName"
				AND cc."FDASystemsId" = dd."FDASystemsId" 		
			WHERE bb."ReconciliationDate"::date  BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
													AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
				AND aa."SystemAliasName" ILIKE "InSystemName" 
				AND aa."ObjectName" ILIKE "InObjectName"			
			GROUP BY aa."AlertTypeInd",bb."ReconciliationDate","AlertTag"
			)X
		GROUP BY "RuleName"
	)Y
ORDER BY "OutlierCount" DESC;
RETURN NEXT $6;

OPEN $7 FOR
	SELECT *
	FROM(SELECT DISTINCT 
			   '' AS "AlertTag",
			   '' AS "AlertTypeInd",
			   c."MasterRuleId" AS "RuleId",
			   aa."SystemAliasName" AS "SystemName",
			   a."ObjectName",
			   c."MasterRuleId"||'-'||c."RuleName" AS "RuleName",
			   'DataQualityRule' AS "RuleType",
			   SUM("OutlierCount") AS "OutlierCount",
			   STRING_AGG(DISTINCT "FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
			   LEFT(c."LastUpdatedOn"::TEXT,10) AS "ScoreRunDate"			
		FROM fda."FDASystems" aa
		INNER JOIN fda."FDASystemObjects" a
			ON aa."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemsId" = b."FDASystemId"
			AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
		INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
			ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON d."FDADataQualityRulesId" = c."MasterRuleId"
		WHERE c."LastUpdatedOn"	::date BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
										AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
			AND d."DAMADimension" ILIKE "InDAMADimension"
			AND aa."SystemAliasName" ILIKE "InSystemName" 
			AND a."ObjectName" ILIKE "InObjectName"
		GROUP BY a."ObjectName",c."RuleName",LEFT(c."LastUpdatedOn"::TEXT,10),aa."SystemAliasName",c."MasterRuleId"
	UNION
		SELECT DISTINCT 
			   "AlertTag",
			   "AlertTypeInd",
			   "RuleId",
			   split_part("AlertTag", '.'::text, 1) AS "SystemName", 
			   (split_part("AlertTag", '.'::text, 2) || '.'::text) || split_part("AlertTag", '.'::text, 3) AS "ObjectName" ,
			   "RuleName",
			   'DataReconciliationRule' AS "RuleType",
			   (COALESCE(SUM(X."SourceCriticalSeverity"),0) + COALESCE(SUM(X."TargetCriticalSeverity"),0)) AS "OutlierCount",
			   '' AS "FDAObjectScoreId",
			   LEFT("ReconciliationDate"::TEXT,10) AS "ScoreRunDate"
		FROM(SELECT DISTINCT "ReconciliationDate"::date,
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "SourceCriticalSeverity",
					(CASE WHEN aa."AlertTypeInd" = 'TargetValue' THEN  SUM(bb."CriticalSeverity") ELSE 0 END) "TargetCriticalSeverity",
					"AlertTag",
					aa."AlertTypeInd",
					aa."FDAAlertRulesId" AS "RuleId",
					(CASE WHEN aa."AlertTypeInd" = 'SourceTargetValue' THEN 'SourceCriticalSeverity'
							WHEN aa."AlertTypeInd" = 'TargetValue' THEN 'TargetCriticalSeverity' 
					END) "RuleName"
			FROM(SELECT "FDAAlertRulesId",
						"AlertTypeInd",
					 	"AlertTag",
						split_part("AlertTag", '.'::text, 1) AS "SystemAliasName",
						(split_part("AlertTag", '.'::text, 2) || '.'::text) || split_part("AlertTag", '.'::text, 3) AS "ObjectName"
				FROM fda."FDAAlertRules"
				) aa
			LEFT JOIN(SELECT "FDAAlertRulesId",
							"ReconciliationDate",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 1 THEN 1::bigint
								ELSE 0::bigint
							END) AS "CriticalSeverity",
							(CASE 
								WHEN "FDAAlertOutput"."Severity" = 9 THEN 1::bigint
								ELSE 0::bigint
							END) AS "AllokSeverity"
					FROM fda."FDAAlertOutput"
					) bb								
				ON aa."FDAAlertRulesId" = bb."FDAAlertRulesId"
			LEFT JOIN fda."FDASystems" cc 
				ON aa."SystemAliasName" = cc."SystemAliasName"
			LEFT JOIN fda."FDASystemObjects" dd 
				ON aa."ObjectName" = dd."ObjectName"
				AND cc."FDASystemsId" = dd."FDASystemsId"				
			WHERE bb."ReconciliationDate"::date  BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
													AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
				AND aa."SystemAliasName" ILIKE "InSystemName" 
				AND aa."ObjectName" ILIKE "InObjectName"			
			GROUP BY aa."AlertTypeInd",bb."ReconciliationDate","AlertTag",aa."FDAAlertRulesId"
			)X
		GROUP BY "AlertTag","AlertTypeInd","RuleName",LEFT("ReconciliationDate"::TEXT,10),"RuleId"
		)Y
	WHERE "OutlierCount" <> 0
	ORDER BY "OutlierCount" DESC;
RETURN NEXT $7;
END IF;
---------------------------------------------------------------------------------------------------------
ELSE IF UPPER("InDAMADimension") = 'TIMELINESS'
THEN

IF  "InDaysInd" = 1 THEN

RAISE NOTICE 'DAMADimension : %', 'TIMELINESS';
RAISE NOTICE 'DaysInd : %', '1';

OPEN $6 FOR

SELECT  "RuleName",
		"OutlierCount",
	   ( MIN("OutlierCount") over() ) * 0.8 "MinOutlierCount",
	   ( MAX("OutlierCount") over() ) * 1.2 "MaxOutlierCount"
FROM(SELECT DISTINCT 
			c."RuleName",
			SUM("OutlierCount") AS "OutlierCount"			
	FROM fda."FDASystems" aa
	INNER JOIN fda."FDASystemObjects" a
		ON aa."FDASystemsId" = a."FDASystemsId"
	INNER JOIN fda."FDAObjectsScoreValue" b
		ON a."FDASystemsId" = b."FDASystemId"
		AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
	INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
		ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
	INNER JOIN fda."FDADataQualityMasterRules" d
		ON d."FDADataQualityRulesId" = c."MasterRuleId"
	WHERE c."LastUpdatedOn"	::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
		AND d."DAMADimension" ILIKE "InDAMADimension"
		AND aa."SystemAliasName" ILIKE "InSystemName" 
		AND a."ObjectName" ILIKE "InObjectName"
	GROUP BY c."RuleName"
UNION
	SELECT DISTINCT 
			'Freshness/SLA' AS "RuleName",
			SUM((CASE WHEN "Color" = 'RED' THEN 1 ELSE 0 END) + "RedSLA") AS "OutlierCount"
	FROM(SELECT b."LastRefreshedDateTime"::date AS "ScoreRunDate",
				(CASE WHEN a."RefreshFrequency" = 'Monthly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 30 THEN 'RED'
					WHEN a."RefreshFrequency" = 'Weekly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 7 THEN 'RED'
					WHEN a."RefreshFrequency" = 'Daily' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
					WHEN a."RefreshFrequency" = 'Daily Exclude Weekend' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
					WHEN a."RefreshFrequency" = 'Only Initial Refresh' THEN 'GREEN'
					ELSE 'GREEN' 
				END) "Color",
				(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) = to_char(b."LoadStartTime", 'HH24:MI'::text) 
						THEN 1
					ELSE 0
				END) AS "GreenSLA",
				(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) <> to_char(b."LoadStartTime", 'HH24:MI'::text) 
						THEN 1
					ELSE 0
				END) AS "RedSLA"			
		FROM fda."FDASystems" a1
		INNER JOIN fda."FDASystemObjects" a
			ON a1."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
		WHERE b."LastRefreshedDateTime"::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date	
			AND a1."SystemAliasName" ILIKE "InSystemName"
			AND a."ObjectName" ILIKE "InObjectName"
		)X
	)Y
ORDER BY "OutlierCount" DESC;
RETURN NEXT $6;		

OPEN $7 FOR

	SELECT *
	FROM(SELECT DISTINCT 
			   c."MasterRuleId" AS "RuleId",
			   aa."SystemAliasName" AS "SystemName",
			   a."ObjectName",
			   c."MasterRuleId"||'-'||c."RuleName" AS "RuleName",
			   'DataQualityRule' AS "RuleType",
			   SUM("OutlierCount") AS "OutlierCount",
			   STRING_AGG(DISTINCT "FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
			   LEFT(c."LastUpdatedOn"::TEXT,10) AS "ScoreRunDate"			
		FROM fda."FDASystems" aa
		INNER JOIN fda."FDASystemObjects" a
			ON aa."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemsId" = b."FDASystemId"
			AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
		INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
			ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON d."FDADataQualityRulesId" = c."MasterRuleId"
		WHERE c."LastUpdatedOn"	::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
			AND d."DAMADimension" ILIKE "InDAMADimension"
			AND aa."SystemAliasName" ILIKE "InSystemName" 
			AND a."ObjectName" ILIKE "InObjectName"
		GROUP BY a."ObjectName",c."RuleName",LEFT(c."LastUpdatedOn"::TEXT,10),aa."SystemAliasName",c."MasterRuleId"
	UNION
		SELECT DISTINCT 
				   0 AS "RuleId",
				   "SystemAliasName" AS "SystemName",
				   "ObjectName",
				   'Freshness/SLA' AS "RuleName",
				   'DataQualityFreshnessRule' AS "RuleType",
				   SUM((CASE WHEN "Color" = 'RED' THEN 1 ELSE 0 END) + "RedSLA") AS "OutlierCount",
				   '0' "FDAObjectScoreId",
				   LEFT("ScoreRunDate"::TEXT,10) AS "ScoreRunDate"
			FROM(SELECT b."LastRefreshedDateTime"::date AS "ScoreRunDate",
						(CASE WHEN a."RefreshFrequency" = 'Monthly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 30 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Weekly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 7 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Daily' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Daily Exclude Weekend' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Only Initial Refresh' THEN 'GREEN'
							ELSE 'GREEN' 
						END) "Color",
						(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) = to_char(b."LoadStartTime", 'HH24:MI'::text) 
								THEN 1
							ELSE 0
						END) AS "GreenSLA",
						(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) <> to_char(b."LoadStartTime", 'HH24:MI'::text) 
								THEN 1
							ELSE 0
						END) AS "RedSLA",
						a1."SystemAliasName",
						a."ObjectName"
				FROM fda."FDASystems" a1
				INNER JOIN fda."FDASystemObjects" a
					ON a1."FDASystemsId" = a."FDASystemsId"
				INNER JOIN fda."FDAObjectsScoreValue" b
					ON a."FDASystemObjectsId" = b."FDASystemObjectsId"	
				WHERE b."LastRefreshedDateTime"::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date	
					AND a1."SystemAliasName" ILIKE "InSystemName"
					AND a."ObjectName" ILIKE "InObjectName"
				)X
			GROUP BY "SystemAliasName","ObjectName",LEFT("ScoreRunDate"::TEXT,10)
		)Y
		WHERE "OutlierCount" <> 0
	ORDER BY "OutlierCount" DESC;
RETURN NEXT $7;

ELSE 

RAISE NOTICE 'DAMADimension : %', 'TIMELINESS';
RAISE NOTICE 'DaysInd : %', '7';

OPEN $6 FOR

SELECT  "RuleName",
		"OutlierCount",
	   ( MIN("OutlierCount") over() ) * 0.8 "MinOutlierCount",
	   ( MAX("OutlierCount") over() ) * 1.2 "MaxOutlierCount"
FROM(SELECT DISTINCT 
			c."RuleName",
			SUM("OutlierCount") AS "OutlierCount"			
	FROM fda."FDASystems" aa
	INNER JOIN fda."FDASystemObjects" a
		ON aa."FDASystemsId" = a."FDASystemsId"
	INNER JOIN fda."FDAObjectsScoreValue" b
		ON a."FDASystemsId" = b."FDASystemId"
		AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
	INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
		ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
	INNER JOIN fda."FDADataQualityMasterRules" d
		ON d."FDADataQualityRulesId" = c."MasterRuleId"
	WHERE c."LastUpdatedOn"	::date BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
									AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
		AND d."DAMADimension" ILIKE "InDAMADimension"
		AND aa."SystemAliasName" ILIKE "InSystemName" 
		AND a."ObjectName" ILIKE "InObjectName"
	GROUP BY c."RuleName"
UNION
		SELECT DISTINCT 
				'Freshness/SLA' AS "RuleName",
				SUM((CASE WHEN "Color" = 'RED' THEN 1 ELSE 0 END) + "RedSLA") AS "OutlierCount"
		FROM(SELECT b."LastRefreshedDateTime"::date AS "ScoreRunDate",
					(CASE WHEN a."RefreshFrequency" = 'Monthly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 30 THEN 'RED'
						WHEN a."RefreshFrequency" = 'Weekly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 7 THEN 'RED'
						WHEN a."RefreshFrequency" = 'Daily' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
						WHEN a."RefreshFrequency" = 'Daily Exclude Weekend' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
						WHEN a."RefreshFrequency" = 'Only Initial Refresh' THEN 'GREEN'
						ELSE 'GREEN' 
					END) "Color",
					(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) = to_char(b."LoadStartTime", 'HH24:MI'::text) 
							THEN 1
						ELSE 0
					END) AS "GreenSLA",
					(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) <> to_char(b."LoadStartTime", 'HH24:MI'::text) 
							THEN 1
						ELSE 0
					END) AS "RedSLA"			
			FROM fda."FDASystems" a1
			INNER JOIN fda."FDASystemObjects" a
				ON a1."FDASystemsId" = a."FDASystemsId"
			INNER JOIN fda."FDAObjectsScoreValue" b
				ON a."FDASystemObjectsId" = b."FDASystemObjectsId"	
			WHERE b."LastRefreshedDateTime"::date  BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
													AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date	
				AND a1."SystemAliasName" ILIKE "InSystemName"
				AND a."ObjectName" ILIKE "InObjectName"
			)X
	)Y
ORDER BY "OutlierCount" DESC;

RETURN NEXT $6;		

OPEN $7 FOR

	SELECT *
	FROM(SELECT DISTINCT 
			   c."MasterRuleId" AS "RuleId",
			   aa."SystemAliasName" AS "SystemName",
			   a."ObjectName",
			   c."MasterRuleId"||'-'||c."RuleName" AS "RuleName",
			   'DataQualityRule' AS "RuleType",
			   SUM("OutlierCount") AS "OutlierCount",
			   STRING_AGG(DISTINCT "FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
			   LEFT(c."LastUpdatedOn"::TEXT,10) AS "ScoreRunDate"			
		FROM fda."FDASystems" aa
		INNER JOIN fda."FDASystemObjects" a
			ON aa."FDASystemsId" = a."FDASystemsId"
		INNER JOIN fda."FDAObjectsScoreValue" b
			ON a."FDASystemsId" = b."FDASystemId"
			AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
		INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
			ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
		INNER JOIN fda."FDADataQualityMasterRules" d
			ON d."FDADataQualityRulesId" = c."MasterRuleId"	
		WHERE c."LastUpdatedOn"	::date BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
										AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
			AND d."DAMADimension" ILIKE "InDAMADimension"
			AND aa."SystemAliasName" ILIKE "InSystemName" 
			AND a."ObjectName" ILIKE "InObjectName"
		GROUP BY a."ObjectName",c."RuleName",LEFT(c."LastUpdatedOn"::TEXT,10),aa."SystemAliasName",c."MasterRuleId"
	UNION
		SELECT DISTINCT 
				   0 AS "RuleId",
				   "SystemAliasName" AS "SystemName",
				   "ObjectName",
				   'Freshness/SLA' AS "RuleName",
				   'DataQualityFreshnessRule' AS "RuleType",
				   SUM((CASE WHEN "Color" = 'RED' THEN 1 ELSE 0 END) + "RedSLA") AS "OutlierCount",
				   '0' "FDAObjectScoreId",
				   LEFT("ScoreRunDate"::TEXT,10) AS "ScoreRunDate"
			FROM(SELECT b."LastRefreshedDateTime"::date AS "ScoreRunDate",
						(CASE WHEN a."RefreshFrequency" = 'Monthly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 30 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Weekly' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 7 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Daily' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Daily Exclude Weekend' AND CURRENT_DATE - CAST(b."LastRefreshedDateTime" AS DATE) > 1 THEN 'RED'
							WHEN a."RefreshFrequency" = 'Only Initial Refresh' THEN 'GREEN'
							ELSE 'GREEN' 
						END) "Color",
						(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) = to_char(b."LoadStartTime", 'HH24:MI'::text) 
								THEN 1
							ELSE 0
						END) AS "GreenSLA",
						(CASE WHEN to_char(a."RefreshTime"::interval, 'HH24:MI'::text) <> to_char(b."LoadStartTime", 'HH24:MI'::text) 
								THEN 1
							ELSE 0
						END) AS "RedSLA",
						a1."SystemAliasName",
						a."ObjectName"
				FROM fda."FDASystems" a1
				INNER JOIN fda."FDASystemObjects" a
					ON a1."FDASystemsId" = a."FDASystemsId"
				INNER JOIN fda."FDAObjectsScoreValue" b
					ON a."FDASystemObjectsId" = b."FDASystemObjectsId"	
				WHERE b."LastRefreshedDateTime"::date  BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
													AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date	
					AND a1."SystemAliasName" ILIKE "InSystemName"
					AND a."ObjectName" ILIKE "InObjectName"
				)X
			GROUP BY "SystemAliasName","ObjectName",LEFT("ScoreRunDate"::TEXT,10)
		)Y
		WHERE "OutlierCount" <> 0
	ORDER BY "OutlierCount" DESC;
RETURN NEXT $7;

END IF;
--------------------------------------------------------------------------------------------------------------
ELSE 

IF  "InDaysInd" = 1 THEN

RAISE NOTICE 'DAMADimension : %', 'OTHER RULES';
RAISE NOTICE 'DaysInd : %', '1';

OPEN $6 FOR 

SELECT "RuleName",
		"OutlierCount",
	   ( MIN("OutlierCount") over() ) * 0.8 "MinOutlierCount",
	   ( MAX("OutlierCount") over() ) * 1.2 "MaxOutlierCount"
FROM(SELECT DISTINCT 
			c."RuleName",
			SUM("OutlierCount") AS "OutlierCount"			
	FROM fda."FDASystems" aa
	INNER JOIN fda."FDASystemObjects" a
		ON aa."FDASystemsId" = a."FDASystemsId"
	INNER JOIN fda."FDAObjectsScoreValue" b
		ON a."FDASystemsId" = b."FDASystemId"
		AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
	INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
		ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
	INNER JOIN fda."FDADataQualityMasterRules" d
		ON d."FDADataQualityRulesId" = c."MasterRuleId"
	WHERE c."LastUpdatedOn"	::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
		AND d."DAMADimension" ILIKE "InDAMADimension"
		AND aa."SystemAliasName" ILIKE "InSystemName" 
		AND a."ObjectName" ILIKE "InObjectName"
	GROUP BY c."RuleName"
	)X
ORDER BY "OutlierCount" DESC;
RETURN NEXT $6;

OPEN $7 FOR 

SELECT DISTINCT 
		c."MasterRuleId" AS "RuleId",
		aa."SystemAliasName" AS "SystemName",
		a."ObjectName",
		c."MasterRuleId"||'-'||c."RuleName" AS "RuleName",
		'DataQualityRule' AS "RuleType",
		SUM("OutlierCount") AS "OutlierCount",
		STRING_AGG(DISTINCT "FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
		LEFT(c."LastUpdatedOn"::TEXT,10) AS "ScoreRunDate"			
FROM fda."FDASystems" aa
INNER JOIN fda."FDASystemObjects" a
	ON aa."FDASystemsId" = a."FDASystemsId"
INNER JOIN fda."FDAObjectsScoreValue" b
	ON a."FDASystemsId" = b."FDASystemId"
	AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
	ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
INNER JOIN fda."FDADataQualityMasterRules" d
	ON d."FDADataQualityRulesId" = c."MasterRuleId"	
WHERE c."LastUpdatedOn"	::date = (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
	AND d."DAMADimension" ILIKE "InDAMADimension"
	AND aa."SystemAliasName" ILIKE "InSystemName" 
	AND a."ObjectName" ILIKE "InObjectName"
GROUP BY a."ObjectName",c."MasterRuleId",c."RuleName",LEFT(c."LastUpdatedOn"::TEXT,10),aa."SystemAliasName"
ORDER BY "OutlierCount" DESC;

RETURN NEXT $7;

ELSE

RAISE NOTICE 'DAMADimension : %', 'OTHER RULES';
RAISE NOTICE 'DaysInd : %', '7';

OPEN $6 FOR 

SELECT  "RuleName",
		"OutlierCount",
	   ( MIN("OutlierCount") over() ) * 0.8 "MinOutlierCount",
	   ( MAX("OutlierCount") over() ) * 1.2 "MaxOutlierCount"
FROM(SELECT DISTINCT 
			c."RuleName",
			SUM("OutlierCount") AS "OutlierCount"			
	FROM fda."FDASystems" aa
	INNER JOIN fda."FDASystemObjects" a
		ON aa."FDASystemsId" = a."FDASystemsId"
	INNER JOIN fda."FDAObjectsScoreValue" b
		ON a."FDASystemsId" = b."FDASystemId"
		AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
	INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
		ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
	INNER JOIN fda."FDADataQualityMasterRules" d
		ON d."FDADataQualityRulesId" = c."MasterRuleId"
	WHERE c."LastUpdatedOn"	::date BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
										AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
		AND d."DAMADimension" ILIKE "InDAMADimension"
		AND aa."SystemAliasName" ILIKE "InSystemName" 
		AND a."ObjectName" ILIKE "InObjectName"
	GROUP BY c."RuleName"
	ORDER BY "OutlierCount" DESC
	)X;
RETURN NEXT $6;

OPEN $7 FOR 

SELECT DISTINCT 
		c."MasterRuleId" AS "RuleId",
		aa."SystemAliasName" AS "SystemName",
		a."ObjectName",
		c."MasterRuleId"||'-'||c."RuleName" AS "RuleName",
		'DataQualityRule' AS "RuleType",
		SUM("OutlierCount") AS "OutlierCount",
		STRING_AGG(DISTINCT "FDAObjectScoreId"::TEXT,',')"FDAObjectScoreId",
		LEFT(c."LastUpdatedOn"::TEXT,10) AS "ScoreRunDate"			
FROM fda."FDASystems" aa
INNER JOIN fda."FDASystemObjects" a
	ON aa."FDASystemsId" = a."FDASystemsId"
INNER JOIN fda."FDAObjectsScoreValue" b
	ON a."FDASystemsId" = b."FDASystemId"
	AND  a."FDASystemObjectsId" = b."FDASystemObjectsId"
INNER JOIN fda."FDAObjectScoreOutlierCountByCategory" c
	ON b."FDAObjectScoreValueId" = c."FDAObjectScoreId"
INNER JOIN fda."FDADataQualityMasterRules" d
	ON d."FDADataQualityRulesId" = c."MasterRuleId"
WHERE c."LastUpdatedOn"	::date BETWEEN ((COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date - INTERVAL '6 DAYS') 
										AND (COALESCE(NULLIF("InDate",''),CURRENT_DATE::text))::date
	AND d."DAMADimension" ILIKE "InDAMADimension"
	AND aa."SystemAliasName" ILIKE "InSystemName" 
	AND a."ObjectName" ILIKE "InObjectName"
GROUP BY a."ObjectName",c."MasterRuleId",c."RuleName",LEFT(c."LastUpdatedOn"::TEXT,10),aa."SystemAliasName"
ORDER BY "OutlierCount" DESC;

RETURN NEXT $7;

END IF;

END IF;
END IF;

END;
$BODY$;


--------------------------------------------------

