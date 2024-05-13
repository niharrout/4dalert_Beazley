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
INNER JOIN (SELECT x."FDASystemObjectsId",y."CreatedOn",y."FDADataQualityRulesId"
			FROM fda."FDASystemObjectFields" x
			INNER JOIN fda."FDADataQualityMasterRulesDetails" y
				ON x."MasterRuleId" = y."FDADataQualityRulesId"
			WHERE y."RuleType" = 'Row Count Variation'
				AND y."LeftFieldValue" > ''
				AND "FDASystemObjectsId" = "InObjectId"
			ORDER BY "CreatedOn" DESC LIMIT 1
			) c 
	ON b."MasterRuleId" = c."FDADataQualityRulesId"
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
------------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: fda.Proc_ListAlertOutputSourceAndTargetValueWithSeviorityAdvance_V2(bigint, bigint, bigint, bigint, character varying, character varying, character varying, character varying, character varying, refcursor, refcursor)

-- DROP FUNCTION IF EXISTS fda."Proc_ListAlertOutputSourceAndTargetValueWithSeviorityAdvance_V2"(bigint, bigint, bigint, bigint, character varying, character varying, character varying, character varying, character varying, refcursor, refcursor);

CREATE OR REPLACE FUNCTION fda."Proc_ListAlertOutputSourceAndTargetValueWithSeviorityAdvance_V2"(
	"InFDAAlertOutputId" bigint,
	"InFDAAlertRulesId" bigint,
	"InOffSet" bigint,
	"InLimit" bigint,
	"InOrderByColumnName" character varying,
	"InOrderBy" character varying,
	"InFromDate" character varying,
	"InToDate" character varying,
	"InTabInd" character varying,
	refcursor,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
DECLARE 
"SourceType" VARCHAR(10);
"TargetType" VARCHAR(10);
"lvThresholdType" VARCHAR(20);
"lvAlertTypeInd" VARCHAR(30);
DECLARE 
"SourceSegment1" VARCHAR(50);
"SourceSegment2" VARCHAR(50);
"SourceSegment3" VARCHAR(50);
"SourceSegment4" VARCHAR(50);
"SourceSegment5" VARCHAR(50);
"TargetSegment1" VARCHAR(50);
"TargetSegment2" VARCHAR(50);
"TargetSegment3" VARCHAR(50);
"TargetSegment4" VARCHAR(50);
"TargetSegment5" VARCHAR(50);
"OutTotalRecordCount" INT;
		
DECLARE	
"OutAlertName" TEXT;
"OutAlertDescription" TEXT;
"OutNotes" TEXT;
"OutAlertInd" VARCHAR(1);
"OutNewBaseLineInd" VARCHAR(1);
"OutConfirmedByUser" VARCHAR(1);
"OutThreshold" TEXT;
"OutTIMEGMT" TEXT;
"OutAlertStatus" Text;
"OutSegmentCountStatus" Text;
"OutSegmentCountColorInd" Text;
"OutSegmentCountCriticalStatus" Text;
"OutSummaryStatus" Text;

"OutThreshold1"  VARCHAR(100);
"OutThreshold2"  VARCHAR(100);
"OutThreshold3"  VARCHAR(100);
"OutThreshold4"  VARCHAR(100);
"OutThreshold5"  VARCHAR(100);
"OutThreshold6"  VARCHAR(100);
"OutThreshold7"  VARCHAR(100);
"OutThreshold8"  VARCHAR(100);
"OutThreshold9"  VARCHAR(100);
"OutThreshold10" VARCHAR(100);
"OutThreshold11" VARCHAR(100);
"OutThreshold12" VARCHAR(100);
"OutThreshold13" VARCHAR(100);
"OutThreshold14" VARCHAR(100);
"OutThreshold15" VARCHAR(100);
"OutThreshold16" VARCHAR(100);
"OutThreshold17" VARCHAR(100);
"OutThreshold18" VARCHAR(100);
"OutThreshold19" VARCHAR(100);
"OutThreshold20" VARCHAR(100);

"OutSegmentName1" VARCHAR(100);
"OutSegmentName2" VARCHAR(100);
"OutSegmentName3" VARCHAR(100);
"OutSegmentName4" VARCHAR(100);
"OutSegmentName5" VARCHAR(100);

"OutSourceColumnName1"  VARCHAR(100);
"OutTargetColumnName1"  VARCHAR(100);
"OutSourceColumnName2"  VARCHAR(100);
"OutTargetColumnName2"  VARCHAR(100);
"OutSourceColumnName3"  VARCHAR(100);
"OutTargetColumnName3"  VARCHAR(100);
"OutSourceColumnName4"  VARCHAR(100);
"OutTargetColumnName4"  VARCHAR(100);
"OutSourceColumnName5"  VARCHAR(100);
"OutTargetColumnName5"  VARCHAR(100);
"OutSourceColumnName6"  VARCHAR(100);
"OutTargetColumnName6"  VARCHAR(100);
"OutSourceColumnName7"  VARCHAR(100);
"OutTargetColumnName7"  VARCHAR(100);
"OutSourceColumnName8"  VARCHAR(100);
"OutTargetColumnName8"  VARCHAR(100);
"OutSourceColumnName9"  VARCHAR(100);
"OutTargetColumnName9"  VARCHAR(100);
"OutSourceColumnName10"  VARCHAR(100);
"OutTargetColumnName10"  VARCHAR(100);
"OutSourceColumnName11"  VARCHAR(100);
"OutTargetColumnName11"  VARCHAR(100);
"OutSourceColumnName12"  VARCHAR(100);
"OutTargetColumnName12"  VARCHAR(100);
"OutSourceColumnName13"  VARCHAR(100);
"OutTargetColumnName13"  VARCHAR(100);
"OutSourceColumnName14"  VARCHAR(100);
"OutTargetColumnName14"  VARCHAR(100);
"OutSourceColumnName15"  VARCHAR(100);
"OutTargetColumnName15"  VARCHAR(100);
"OutSourceColumnName16"  VARCHAR(100);
"OutTargetColumnName16"  VARCHAR(100);
"OutSourceColumnName17"  VARCHAR(100);
"OutTargetColumnName17"  VARCHAR(100);
"OutSourceColumnName18"  VARCHAR(100);
"OutTargetColumnName18"  VARCHAR(100);
"OutSourceColumnName19"  VARCHAR(100);
"OutTargetColumnName19"  VARCHAR(100);
"OutSourceColumnName20"  VARCHAR(100);
"OutTargetColumnName20"  VARCHAR(100);

"OutSourceTargetValue1DifferencePercent" VARCHAR(10);
"OutSourceTargetValue2DifferencePercent" VARCHAR(10);
"OutSourceTargetValue3DifferencePercent" VARCHAR(10);
"OutSourceTargetValue4DifferencePercent" VARCHAR(10);
"OutSourceTargetValue5DifferencePercent" VARCHAR(10);
"OutSourceTargetValue6DifferencePercent" VARCHAR(10);
"OutSourceTargetValue7DifferencePercent" VARCHAR(10);
"OutSourceTargetValue8DifferencePercent" VARCHAR(10);
"OutSourceTargetValue9DifferencePercent" VARCHAR(10);
"OutSourceTargetValue10DifferencePercent" VARCHAR(10);
"OutSourceTargetValue11DifferencePercent" VARCHAR(10);
"OutSourceTargetValue12DifferencePercent" VARCHAR(10);
"OutSourceTargetValue13DifferencePercent" VARCHAR(10);
"OutSourceTargetValue14DifferencePercent" VARCHAR(10);
"OutSourceTargetValue15DifferencePercent" VARCHAR(10);
"OutSourceTargetValue16DifferencePercent" VARCHAR(10);
"OutSourceTargetValue17DifferencePercent" VARCHAR(10);
"OutSourceTargetValue18DifferencePercent" VARCHAR(10);
"OutSourceTargetValue19DifferencePercent" VARCHAR(10);
"OutSourceTargetValue20DifferencePercent" VARCHAR(10);

DECLARE 
"ResultPercentage1"  VARCHAR(100);
"ResultPercentage2"  VARCHAR(100);
"ResultPercentage3"  VARCHAR(100);
"ResultPercentage4"  VARCHAR(100);
"ResultPercentage5"  VARCHAR(100);
"ResultPercentage6"  VARCHAR(100);
"ResultPercentage7"  VARCHAR(100);
"ResultPercentage8"  VARCHAR(100);
"ResultPercentage9"  VARCHAR(100);
"ResultPercentage10" VARCHAR(100);
"ResultPercentage11" VARCHAR(100);
"ResultPercentage12" VARCHAR(100);
"ResultPercentage13" VARCHAR(100);
"ResultPercentage14" VARCHAR(100);
"ResultPercentage15" VARCHAR(100);
"ResultPercentage16" VARCHAR(100);
"ResultPercentage17" VARCHAR(100);
"ResultPercentage18" VARCHAR(100);
"ResultPercentage19" VARCHAR(100);
"ResultPercentage20" VARCHAR(100);

DECLARE 
"SelectQueryString" TEXT;
"FromString" TEXT;
"WhereConditionString" TEXT;
"WhereConditionString2" TEXT;
"OrderByString" TEXT;

DECLARE
SourceSegmentCount BIGINT;
TargetSegmentCount BIGINT;
SourceColumnCount BIGINT;
TargetColumnCount BIGINT;
"lvBaseLineInd" VARCHAR(20);
"lvBaseLineValue" BIGINT;
"lvAlertType" VARCHAR(20);
"SecondarySegmentCount" BIGINT;

BEGIN

"InTabInd" := upper("InTabInd");

SELECT "AlertTypeInd"
	INTO "lvAlertType"
FROM fda."FDAAlertRules" 
WHERE "FDAAlertRulesId" =  "InFDAAlertRulesId";
		
SELECT 
"AlertTypeInd",
CAST("BaseLineValue" AS BIGINT),
"BaseLineValueType",
"SourceInfoEntryType",
"TargetInfoEntryType",
"ThresholdType"
/*CONCAT(
(CASE 
	WHEN "LowerThresholdType" = 'Percentage' THEN CONCAT(CAST("LowerThresholdValue" AS NUMERIC(17,1)),'% LCL')
	WHEN "LowerThresholdType" = 'StandardDeviation' THEN CONCAT(CAST("LowerThresholdValue" AS NUMERIC(17,1)),'σ LCL')
	WHEN "LowerThresholdType" = 'Absolute' THEN  CONCAT("LowerThresholdValue",' LCL')
	ELSE 'No LCL'
END),
'-',
(CASE 
	WHEN "UpperThresholdType" = 'Percentage' THEN CONCAT(CAST("UpperThresholdValue" AS NUMERIC(17,1)),'% UCL')
	WHEN "UpperThresholdType" = 'StandardDeviation' THEN CONCAT(CAST("UpperThresholdValue" AS NUMERIC(17,1)),'σ UCL')
	WHEN "UpperThresholdType" = 'Absolute' THEN  CONCAT("UpperThresholdValue",'UCL')
	ELSE 'No UCL'
 END))*/
INTO 
"lvAlertTypeInd",
"lvBaseLineValue",
"lvBaseLineInd",
"SourceType",
"TargetType",
"lvThresholdType"
--"OutThreshold"
FROM fda."FDAAlertRules"
WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";

SELECT COALESCE("ThresholdInfo",'') 
INTO "OutThreshold"
FROM fda."FDAAlertOutput"
WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
AND "FDAAlertOutputId" = "InFDAAlertOutputId";

RAISE NOTICE 'VALUE: %','11111';
---------------------------------------------COLUMN AND SEGMENT COUNT----------------------------------------
SELECT COUNT(*) 
INTO SourceSegmentCount
FROM fda."FDAAlertRulesSourceSegment"
WHERE "FDAAlertRulesId" =  "InFDAAlertRulesId";

SELECT COUNT(*) 
INTO TargetSegmentCount
FROM fda."FDAAlertRulesTargetSegment"
WHERE "FDAAlertRulesId" =  "InFDAAlertRulesId";

SELECT COUNT(*) 
INTO SourceColumnCount
FROM fda."FDAAlertRulesSourceColumn"
WHERE "FDAAlertRulesId" =  "InFDAAlertRulesId"
AND "Status" = 'true';

SELECT COUNT(*) 
INTO TargetColumnCount
FROM fda."FDAAlertRulesTargetColumn"
WHERE "FDAAlertRulesId" =  "InFDAAlertRulesId"
AND "Status" = 'true';

SELECT COUNT(*) 
INTO "SecondarySegmentCount"
FROM fda."FDAAlertRulesTargetSegmentSecondary"
WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";

--------------------------------------------------------------------------------------------------------------
IF LOWER("lvThresholdType") = 'customize' THEN

SELECT COALESCE(MAX(CASE WHEN RowNum = 1 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL'),
	   COALESCE(MAX(CASE WHEN RowNum = 2 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL'),
	   COALESCE(MAX(CASE WHEN RowNum = 3 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL'),
	   COALESCE(MAX(CASE WHEN RowNum = 4 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL'),
	   COALESCE(MAX(CASE WHEN RowNum = 5 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL'),
	   COALESCE(MAX(CASE WHEN RowNum = 6 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL'),
	   COALESCE(MAX(CASE WHEN RowNum = 7 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL'),
	   COALESCE(MAX(CASE WHEN RowNum = 8 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL'),
	   COALESCE(MAX(CASE WHEN RowNum = 9 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL'),
	   COALESCE(MAX(CASE WHEN RowNum = 10 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL'),
	   COALESCE(MAX(CASE WHEN RowNum = 11 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL'),
	   COALESCE(MAX(CASE WHEN RowNum = 12 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL'),
	   COALESCE(MAX(CASE WHEN RowNum = 13 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL'),
	   COALESCE(MAX(CASE WHEN RowNum = 14 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL'),
	   COALESCE(MAX(CASE WHEN RowNum = 15 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL'),
	   COALESCE(MAX(CASE WHEN RowNum = 16 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL'),
	   COALESCE(MAX(CASE WHEN RowNum = 17 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL'),
	   COALESCE(MAX(CASE WHEN RowNum = 18 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL'),
	   COALESCE(MAX(CASE WHEN RowNum = 19 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL'),
	   COALESCE(MAX(CASE WHEN RowNum = 20 THEN "ThresholdInfo" ELSE NULL END)::TEXT,'No LCL - No UCL')
INTO
	"OutThreshold1", 
	"OutThreshold2", 
	"OutThreshold3", 
	"OutThreshold4", 
	"OutThreshold5",
	"OutThreshold6", 
	"OutThreshold7", 
	"OutThreshold8", 
	"OutThreshold9", 
	"OutThreshold10",
	"OutThreshold11",
	"OutThreshold12",
	"OutThreshold13",
	"OutThreshold14",
	"OutThreshold15",
	"OutThreshold16",
	"OutThreshold17",
	"OutThreshold18",
	"OutThreshold19",
	"OutThreshold20"
FROM(SELECT	DISTINCT 
			RowNum :: int,
			"ThresholdInfo"	   
	FROM(SELECT SPLIT_PART("VALUE",'(~)',1)::int RowNum,
			   SPLIT_PART("VALUE",'(~)',2) "ThresholdInfo"
		FROM UNNEST(STRING_TO_ARRAY("OutThreshold",'(^)')) "VALUE"
		)X
	)Y;
	
ELSE 

    "OutThreshold1"  := "OutThreshold";
	"OutThreshold2"  := "OutThreshold";
	"OutThreshold3"  := "OutThreshold";
	"OutThreshold4"  := "OutThreshold";
	"OutThreshold5"  := "OutThreshold";
	"OutThreshold6"  := "OutThreshold";
	"OutThreshold7"  := "OutThreshold";
	"OutThreshold8"  := "OutThreshold";
	"OutThreshold9"  := "OutThreshold";
	"OutThreshold10" := "OutThreshold";
	"OutThreshold11" := "OutThreshold";
	"OutThreshold12" := "OutThreshold";
	"OutThreshold13" := "OutThreshold";
	"OutThreshold14" := "OutThreshold";
	"OutThreshold15" := "OutThreshold";
	"OutThreshold16" := "OutThreshold";
	"OutThreshold17" := "OutThreshold";
	"OutThreshold18" := "OutThreshold";
	"OutThreshold19" := "OutThreshold";
	"OutThreshold20" := "OutThreshold";
END IF;

------------------------------------------------------------FETCH SEGMENT NAMES---------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------FETCH SOURCE SEGMENT
--IF COALESCE(SourceSegmentCount,0) > 0 THEN 
	IF UPPER("SourceType") = 'EDITOR' THEN
	RAISE NOTICE 'SourceType: %','SourceType EDITOR';
		/*SELECT  
		MAX(CASE WHEN RowNum = 1 THEN "SegmentName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 2 THEN "SegmentName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 3 THEN "SegmentName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 4 THEN "SegmentName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 5 THEN "SegmentName" ELSE NULL END) 
		INTO 
		"SourceSegment1",
		"SourceSegment2",
		"SourceSegment3",
		"SourceSegment4",
		"SourceSegment5"
		FROM
		(
		SELECT DISTINCT 
			a."GroupBySourceColumnName" "SegmentName",
			ROW_NUMBER ( ) OVER ( ORDER BY a."FDAAlertRulesSourceSegmentId" ASC )  RowNum
		FROM fda."FDAAlertRulesSourceSegment" a
		WHERE a."FDAAlertRulesId" =  "InFDAAlertRulesId"
		) X;*/
		SELECT  
			MAX(CASE WHEN RowNum = 1 THEN "SegmentName" ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 2 THEN "SegmentName" ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 3 THEN "SegmentName" ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 4 THEN "SegmentName" ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 5 THEN "SegmentName" ELSE NULL END) 
		INTO 
		"SourceSegment1",
		"SourceSegment2",
		"SourceSegment3",
		"SourceSegment4",
		"SourceSegment5"
		FROM
		(
		SELECT DISTINCT 
			RowNum :: int,
			"SegmentName"
		FROM (SELECT 
			  		SPLIT_PART("SegmentName",'~','1') ::int RowNum,
			  		SPLIT_PART("SegmentName",'~','2') "SegmentName"
			  FROM(SELECT UNNEST(STRING_TO_ARRAY("SegmentInfo",'^')) "SegmentName"
					FROM fda."FDAAlertOutputByAdvancedSegment"
					WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
					AND  "FDAAlertOutputId"  = "InFDAAlertOutputId"
				)Y
			) X
		)Z;
	
	ELSE
	RAISE NOTICE 'SourceType: %','SourceType wizard';
		/*SELECT  
		MAX(CASE WHEN RowNum = 1 THEN "SegmentName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 2 THEN "SegmentName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 3 THEN "SegmentName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 4 THEN "SegmentName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 5 THEN "SegmentName" ELSE NULL END) 
		INTO 
		"SourceSegment1",
		"SourceSegment2",
		"SourceSegment3",
		"SourceSegment4",
		"SourceSegment5"
		FROM
		(
		SELECT  b."FieldName" "SegmentName",
				ROW_NUMBER ( ) OVER ( ORDER BY a."FDAAlertRulesSourceSegmentId" ASC )  RowNum
		FROM fda."FDAAlertRulesSourceSegment" a,
			fda."FDASystemObjectFields" b
		WHERE a."GroupBySourceColumnId" = b."FDASystemObjectFieldsId"
		AND a."FDAAlertRulesId" =  "InFDAAlertRulesId"
		) X;
		*/
		SELECT  
			MAX(CASE WHEN RowNum = 1 THEN "SegmentName" ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 2 THEN "SegmentName" ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 3 THEN "SegmentName" ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 4 THEN "SegmentName" ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 5 THEN "SegmentName" ELSE NULL END) 
		INTO 
		"SourceSegment1",
		"SourceSegment2",
		"SourceSegment3",
		"SourceSegment4",
		"SourceSegment5"
		FROM
		(
		SELECT DISTINCT
			RowNum :: int,
			"SegmentName"
		FROM (SELECT 
			  		SPLIT_PART("SegmentName",'~','1') ::int RowNum,
			  		SPLIT_PART("SegmentName",'~','2') "SegmentName"
			FROM(SELECT UNNEST(STRING_TO_ARRAY("SegmentInfo",'^')) "SegmentName"
				 FROM fda."FDAAlertOutputByAdvancedSegment"
				 WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
				 AND  "FDAAlertOutputId"  = "InFDAAlertOutputId"
				)Y
			) X
		) Z;
	
	
	END IF;
--END IF;

RAISE NOTICE 'TargetSegment1: %',"SourceSegment1";
		RAISE NOTICE 'TargetSegment2: %',"SourceSegment2";
		RAISE NOTICE 'TargetSegment3: %',"SourceSegment3";
		RAISE NOTICE 'TargetSegment4: %',"SourceSegment4";
		RAISE NOTICE 'TargetSegment5: %',"SourceSegment5";

RAISE NOTICE 'VALUE: %','FETCH TARGET SEGMENTS';
------------------------------------------------------------FETCH TARGET SEGMENTS

--IF COALESCE(TargetSegmentCount,0) > 0 THEN

	IF UPPER("TargetType") = 'EDITOR' THEN
	
	RAISE NOTICE 'TargetType: %','TargetType EDITOR';
		/*SELECT  
		MAX(CASE WHEN RowNum = 1 THEN "SegmentName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 2 THEN "SegmentName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 3 THEN "SegmentName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 4 THEN "SegmentName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 5 THEN "SegmentName" ELSE NULL END) 
		INTO 
		"TargetSegment1",
		"TargetSegment2",
		"TargetSegment3",
		"TargetSegment4",
		"TargetSegment5"
		FROM 
		(
		SELECT  DISTINCT 
			a."GroupByTargetColumnName" "SegmentName",
			ROW_NUMBER ( ) OVER ( ORDER BY a."FDAAlertRulesTargetSegmentId" ASC )  RowNum
		FROM fda."FDAAlertRulesTargetSegment" a
		WHERE a."FDAAlertRulesId" =  "InFDAAlertRulesId"
		) X;*/
		SELECT  
			MAX(CASE WHEN RowNum = 1 THEN "SegmentName" ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 2 THEN "SegmentName" ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 3 THEN "SegmentName" ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 4 THEN "SegmentName" ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 5 THEN "SegmentName" ELSE NULL END) 
		INTO 
		"SourceSegment1",
		"SourceSegment2",
		"SourceSegment3",
		"SourceSegment4",
		"SourceSegment5"
		FROM
		(
		SELECT DISTINCT
			RowNum :: int,
			"SegmentName"
		FROM (SELECT 
			  		SPLIT_PART("SegmentName",'~','1') ::int RowNum,
			  		SPLIT_PART("SegmentName",'~','2') "SegmentName"
			FROM(SELECT UNNEST(STRING_TO_ARRAY("SegmentInfo",'^')) "SegmentName"
				 FROM fda."FDAAlertOutputByAdvancedSegment"
				 WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
				 AND  "FDAAlertOutputId"  = "InFDAAlertOutputId"
				)Y
			) X
		) Z;
			
		RAISE NOTICE 'TargetSegment1: %',"TargetSegment1";
		RAISE NOTICE 'TargetSegment2: %',"TargetSegment2";
		RAISE NOTICE 'TargetSegment3: %',"TargetSegment3";
		RAISE NOTICE 'TargetSegment4: %',"TargetSegment4";
		RAISE NOTICE 'TargetSegment5: %',"TargetSegment5";
	
	ELSE
	
			RAISE NOTICE 'TargetType: %','TargetType WIZARD';

		/*SELECT  
		MAX(CASE WHEN RowNum = 1 THEN "SegmentName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 2 THEN "SegmentName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 3 THEN "SegmentName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 4 THEN "SegmentName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 5 THEN "SegmentName" ELSE NULL END) 
		INTO 
		"TargetSegment1",	
		"TargetSegment2",
		"TargetSegment3",
		"TargetSegment4",
		"TargetSegment5"
		FROM
		(
		SELECT  
			b."FieldName" "SegmentName",
			ROW_NUMBER ( ) OVER ( ORDER BY a."FDAAlertRulesTargetSegmentId" ASC )  RowNum
		FROM fda."FDAAlertRulesTargetSegment" a,
			fda."FDASystemObjectFields" b
		WHERE a."GroupByTargetColumnId" = b."FDASystemObjectFieldsId"
		AND a."FDAAlertRulesId" = "InFDAAlertRulesId"
		) X;
		*/
		SELECT  
			MAX(CASE WHEN RowNum = 1 THEN "SegmentName" ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 2 THEN "SegmentName" ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 3 THEN "SegmentName" ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 4 THEN "SegmentName" ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 5 THEN "SegmentName" ELSE NULL END) 
		INTO 
		"TargetSegment1",	
		"TargetSegment2",
		"TargetSegment3",
		"TargetSegment4",
		"TargetSegment5"
		FROM
		(
		SELECT DISTINCT
			RowNum :: int,
			"SegmentName"
			
		FROM (SELECT 
			  		SPLIT_PART("SegmentName",'~','1') ::int RowNum,
			  		SPLIT_PART("SegmentName",'~','2') "SegmentName"
			FROM(SELECT UNNEST(STRING_TO_ARRAY("SegmentInfo",'^')) "SegmentName"
				 FROM fda."FDAAlertOutputByAdvancedSegment"
				 WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
				 AND  "FDAAlertOutputId"  = "InFDAAlertOutputId"
				)Y
			) X
		) Z;
	
	END IF;

--END IF;

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 "OutSegmentName1" := COALESCE("SourceSegment1","TargetSegment1");
 "OutSegmentName2" := COALESCE("SourceSegment2","TargetSegment2");
 "OutSegmentName3" := COALESCE("SourceSegment3","TargetSegment3");
 "OutSegmentName4" := COALESCE("SourceSegment4","TargetSegment4");
 "OutSegmentName5" := COALESCE("SourceSegment5","TargetSegment5");
 
 
 
RAISE NOTICE 'OutSegmentName1: %',"OutSegmentName1";
RAISE NOTICE 'OutSegmentName2: %',"OutSegmentName2";
RAISE NOTICE 'OutSegmentName3: %',"OutSegmentName3";
RAISE NOTICE 'OutSegmentName4: %',"OutSegmentName4";
RAISE NOTICE 'OutSegmentName5: %',"OutSegmentName5";

-----------------------------------------------------------COLUMN NAMES---------------------------------------------------------------------------------------------------------
RAISE NOTICE 'VALUE: %','33333';
-----------------------------------------------------------FETCH SOURCE COLUMNS

IF COALESCE(SourceColumnCount,0) > 0 THEN 

	IF UPPER("SourceType") = 'EDITOR' THEN
	
		/*SELECT 
		MAX(CASE WHEN RowNum = 1  THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 2  THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 3  THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 4  THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 5  THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 6  THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 7  THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 8  THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 9  THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 10 THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 11 THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 12 THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 13 THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 14 THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 15 THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 16 THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 17 THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 18 THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 19 THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 20 THEN CONCAT("Function",' Of ',"ColumnName",'')  ELSE NULL END)
		INTO 
		"OutSourceColumnName1" ,
		"OutSourceColumnName2" ,
		"OutSourceColumnName3" ,
		"OutSourceColumnName4" ,
		"OutSourceColumnName5" ,
		"OutSourceColumnName6" ,
		"OutSourceColumnName7" ,
		"OutSourceColumnName8" ,
		"OutSourceColumnName9" ,
		"OutSourceColumnName10",
		"OutSourceColumnName11",
		"OutSourceColumnName12",
		"OutSourceColumnName13",
		"OutSourceColumnName14",
		"OutSourceColumnName15",
		"OutSourceColumnName16",
		"OutSourceColumnName17",
		"OutSourceColumnName18",
		"OutSourceColumnName19",
		"OutSourceColumnName20"
		FROM
		(
		SELECT DISTINCT 
		RANK () OVER ( ORDER BY a."Position" ASC ) RowNum,
		a."SourceColumnName" "ColumnName",
		a."Function" "Function"
		FROM fda."FDAAlertRulesSourceColumn" a
		WHERE a."FDAAlertRulesId" =  "InFDAAlertRulesId"
		AND a."Status" = 'true'
		) X; */
		SELECT 
			MAX(CASE WHEN RowNum = 1  THEN "ColumnName" ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 2  THEN "ColumnName"  ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 3  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 4  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 5  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 6  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 7  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 8  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 9  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 10  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 11 THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 12  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 13  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 14  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 15  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 16  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 17  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 18  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 19  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 20  THEN "ColumnName" ELSE NULL END)
		INTO 
			"OutSourceColumnName1" ,
			"OutSourceColumnName2" ,
			"OutSourceColumnName3" ,
			"OutSourceColumnName4" ,
			"OutSourceColumnName5" ,
			"OutSourceColumnName6" ,
			"OutSourceColumnName7" ,
			"OutSourceColumnName8" ,
			"OutSourceColumnName9" ,
			"OutSourceColumnName10",
			"OutSourceColumnName11",
			"OutSourceColumnName12",
			"OutSourceColumnName13",
			"OutSourceColumnName14",
			"OutSourceColumnName15",
			"OutSourceColumnName16",
			"OutSourceColumnName17",
			"OutSourceColumnName18",
			"OutSourceColumnName19",
			"OutSourceColumnName20"
		FROM
		(SELECT  
				SPLIT_PART("ColumnName",'^',1):: INT RowNum,
				SPLIT_PART("ColumnName",'^',2) "ColumnName"
	
			FROM (SELECT DISTINCT
		UNNEST(STRING_TO_ARRAY("ColumnInfo",'|')) "ColumnName"
		FROM fda."FDAAlertOutputByAdvancedSegment"
		WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
		AND  "FDAAlertOutputId"  = "InFDAAlertOutputId")x
		)y;
	
	ELSE
	
		/*SELECT  
		MAX(CASE WHEN RowNum = 1  THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 2  THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 3  THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 4  THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 5  THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 6  THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 7  THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 8  THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 9  THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 10 THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 11 THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 12 THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 13 THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 14 THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 15 THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 16 THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 17 THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 18 THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 19 THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 20 THEN CONCAT("Function",' Of ',"SegmentName",'') ELSE NULL END) 
		INTO 
		"OutSourceColumnName1" ,
		"OutSourceColumnName2" ,
		"OutSourceColumnName3" ,
		"OutSourceColumnName4" ,
		"OutSourceColumnName5" ,
		"OutSourceColumnName6" ,
		"OutSourceColumnName7" ,
		"OutSourceColumnName8" ,
		"OutSourceColumnName9" ,
		"OutSourceColumnName10",
		"OutSourceColumnName11",
		"OutSourceColumnName12",
		"OutSourceColumnName13",
		"OutSourceColumnName14",
		"OutSourceColumnName15",
		"OutSourceColumnName16",
		"OutSourceColumnName17",
		"OutSourceColumnName18",
		"OutSourceColumnName19",
		"OutSourceColumnName20"
		FROM
		(
		SELECT  
		RANK () OVER ( ORDER BY a."Position" ASC ) RowNum,
		a."SourceColumnName" "SegmentName",
		a."Function" "Function"
		FROM fda."FDAAlertRulesSourceColumn" a
		WHERE a."FDAAlertRulesId" = "InFDAAlertRulesId"
		AND a."Status" = 'true'
		) X;*/
		SELECT 
			MAX(CASE WHEN RowNum = 1  THEN "ColumnName" ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 2  THEN "ColumnName"  ELSE NULL END) ,
			MAX(CASE WHEN RowNum = 3  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 4  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 5  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 6  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 7  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 8  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 9  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 10  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 11 THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 12  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 13  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 14  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 15  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 16  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 17  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 18  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 19  THEN "ColumnName" ELSE NULL END),
			MAX(CASE WHEN RowNum = 20  THEN "ColumnName" ELSE NULL END)
		INTO 
			"OutSourceColumnName1" ,
			"OutSourceColumnName2" ,
			"OutSourceColumnName3" ,
			"OutSourceColumnName4" ,
			"OutSourceColumnName5" ,
			"OutSourceColumnName6" ,
			"OutSourceColumnName7" ,
			"OutSourceColumnName8" ,
			"OutSourceColumnName9" ,
			"OutSourceColumnName10",
			"OutSourceColumnName11",
			"OutSourceColumnName12",
			"OutSourceColumnName13",
			"OutSourceColumnName14",
			"OutSourceColumnName15",
			"OutSourceColumnName16",
			"OutSourceColumnName17",
			"OutSourceColumnName18",
			"OutSourceColumnName19",
			"OutSourceColumnName20"
		FROM
		(SELECT  
				SPLIT_PART("ColumnName",'^',1):: INT  RowNum ,
				SPLIT_PART("ColumnName",'^',2) "ColumnName"
	
			FROM (SELECT DISTINCT
		UNNEST(STRING_TO_ARRAY("ColumnInfo",'|')) "ColumnName"
		FROM fda."FDAAlertOutputByAdvancedSegment"
		WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
		AND  "FDAAlertOutputId"  = "InFDAAlertOutputId")x
		)y;
	
	END IF;

END IF;

--------------------------------------------------------------FETCH TARGET COLUMNS

IF COALESCE(TargetColumnCount,0) > 0 THEN

	IF UPPER("TargetType") = 'EDITOR' THEN
	
		SELECT 
		MAX(CASE WHEN RowNum = 1  THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 2  THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 3  THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 4  THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 5  THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 6  THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 7  THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 8  THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 9  THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 10 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 11 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 12 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 13 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 14 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 15 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 16 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 17 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 18 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 19 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 20 THEN "ColumnName" ELSE NULL END) 
		INTO 
		"OutTargetColumnName1",
		"OutTargetColumnName2",
		"OutTargetColumnName3",
		"OutTargetColumnName4",
		"OutTargetColumnName5",
		"OutTargetColumnName6",
		"OutTargetColumnName7",
		"OutTargetColumnName8",
		"OutTargetColumnName9",
		"OutTargetColumnName10",
		"OutTargetColumnName11",
		"OutTargetColumnName12",
		"OutTargetColumnName13",
		"OutTargetColumnName14",
		"OutTargetColumnName15",
		"OutTargetColumnName16",
		"OutTargetColumnName17",
		"OutTargetColumnName18",
		"OutTargetColumnName19",
		"OutTargetColumnName20"
		FROM
		(SELECT  
				SPLIT_PART("ColumnName",'^',1):: INT  RowNum ,
				COALESCE(NULLIF(SPLIT_PART("ColumnName",'^',3),''),SPLIT_PART("ColumnName",'^',2)) "ColumnName"
	
			FROM (SELECT DISTINCT
		UNNEST(STRING_TO_ARRAY("ColumnInfo",'|')) "ColumnName"
		FROM fda."FDAAlertOutputByAdvancedSegment"
		WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
		AND  "FDAAlertOutputId"  = "InFDAAlertOutputId")x
		)y;
	
	ELSE
	
		SELECT  
		MAX(CASE WHEN RowNum = 1  THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 2  THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 3  THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 4  THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 5  THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 6  THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 7  THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 8  THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 9  THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 10 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 11 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 12 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 13 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 14 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 15 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 16 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 17 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 18 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 19 THEN "ColumnName" ELSE NULL END) ,
		MAX(CASE WHEN RowNum = 20 THEN "ColumnName" ELSE NULL END) 
		INTO 
		"OutTargetColumnName1",
		"OutTargetColumnName2",
		"OutTargetColumnName3",
		"OutTargetColumnName4",
		"OutTargetColumnName5",
		"OutTargetColumnName6",
		"OutTargetColumnName7",
		"OutTargetColumnName8",
		"OutTargetColumnName9",
		"OutTargetColumnName10",
		"OutTargetColumnName11",
		"OutTargetColumnName12",
		"OutTargetColumnName13",
		"OutTargetColumnName14",
		"OutTargetColumnName15",
		"OutTargetColumnName16",
		"OutTargetColumnName17",
		"OutTargetColumnName18",
		"OutTargetColumnName19",
		"OutTargetColumnName20"
		FROM
		(SELECT  
				SPLIT_PART("ColumnName",'^',1):: INT  RowNum ,
				COALESCE(NULLIF(SPLIT_PART("ColumnName",'^',3),''),SPLIT_PART("ColumnName",'^',2)) "ColumnName"
	
			FROM (SELECT DISTINCT
		UNNEST(STRING_TO_ARRAY("ColumnInfo",'|')) "ColumnName"
		FROM fda."FDAAlertOutputByAdvancedSegment"
		WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
		AND  "FDAAlertOutputId"  = "InFDAAlertOutputId")x
		)y;
	
	END IF;

END IF;

RAISE NOTICE 'VALUE: %','4444';

IF COALESCE("OutTargetColumnName1",'') = '' AND COALESCE("OutTargetColumnName2",'') = '' 
THEN
RAISE NOTICE 'VALUE: %','row count block';
	"OutSourceColumnName1" := COALESCE("OutSourceColumnName1",'Row Count');
	"OutTargetColumnName1" := COALESCE("OutTargetColumnName1",'Row Count');
END IF;
IF COALESCE("OutSourceColumnName1",'') = '' AND COALESCE("OutTargetColumnName1",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
				THEN CONCAT("OutTargetColumnName1",' ( Last Run )') 
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName1",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName1",' ( AVG of Last ',"lvBaseLineValue",' Run )')  END )
	INTO "OutSourceColumnName1"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName1",' ( Latest Run )') 
	INTO "OutTargetColumnName1";
END IF;
IF COALESCE("OutSourceColumnName2",'') = '' AND COALESCE("OutTargetColumnName2",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN CONCAT("OutTargetColumnName2",' ( Last Run )') 
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName2",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName2",' (AVG of Last ',"lvBaseLineValue",' Run )') END )
	INTO "OutSourceColumnName2"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName2",' ( Latest Run )')  
	INTO "OutTargetColumnName2";
	
END IF;

IF COALESCE("OutSourceColumnName3",'') = '' AND COALESCE("OutTargetColumnName3",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN CONCAT("OutTargetColumnName3",' ( Last Run )')
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName3",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName3",' ( AVG of Last ',"lvBaseLineValue",' Run )') END )
	INTO "OutSourceColumnName3"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName3",' ( Latest Run )') 
	INTO "OutTargetColumnName3";
	
END IF;
IF COALESCE("OutSourceColumnName4",'') = '' AND COALESCE("OutTargetColumnName4",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
				THEN CONCAT("OutTargetColumnName4",' ( Last Run )' )
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName4",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName4",' ( AVG of Last ',"lvBaseLineValue",' Run )') END )
	INTO "OutSourceColumnName4"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName4",' ( Latest Run )') 
	INTO "OutTargetColumnName4";
	
END IF;

IF COALESCE("OutSourceColumnName5",'') = '' AND COALESCE("OutTargetColumnName5",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
				THEN CONCAT("OutTargetColumnName5",' ( Last Run )' ) 
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName5",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName5",' ( AVG of Last ',"lvBaseLineValue",' Run )') END )
	INTO "OutSourceColumnName5"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName5",' ( Latest Run )')  
	INTO "OutTargetColumnName5";
END IF;

IF COALESCE("OutSourceColumnName6",'') = '' AND COALESCE("OutTargetColumnName6",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
				THEN CONCAT("OutTargetColumnName6",' ( Last Run )' ) 
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName6",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName6",' ( AVG of Last ',"lvBaseLineValue",' Run )') END )
	INTO "OutSourceColumnName6"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName6",' ( Latest Run )')  
	INTO "OutTargetColumnName6";
END IF;

IF COALESCE("OutSourceColumnName7",'') = '' AND COALESCE("OutTargetColumnName7",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
				THEN CONCAT("OutTargetColumnName7",' ( Last Run )' ) 
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName7",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName7",' ( AVG of Last ',"lvBaseLineValue",' Run )') END )
	INTO "OutSourceColumnName7"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName7",' ( Latest Run )')  
	INTO "OutTargetColumnName7";
END IF;

IF COALESCE("OutSourceColumnName8",'') = '' AND COALESCE("OutTargetColumnName8",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
				THEN CONCAT("OutTargetColumnName8",' ( Last Run )' ) 
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName8",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName8",' ( AVG of Last ',"lvBaseLineValue",' Run )') END )
	INTO "OutSourceColumnName8"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName8",' ( Latest Run )')  
	INTO "OutTargetColumnName8";
END IF;

IF COALESCE("OutSourceColumnName9",'') = '' AND COALESCE("OutTargetColumnName9",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
				THEN CONCAT("OutTargetColumnName9",' ( Last Run )' ) 
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName9",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName9",' ( AVG of Last ',"lvBaseLineValue",' Run )') END )
	INTO "OutSourceColumnName9"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName9",' ( Latest Run )')  
	INTO "OutTargetColumnName9";
END IF;

IF COALESCE("OutSourceColumnName10",'') = '' AND COALESCE("OutTargetColumnName10",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
				THEN CONCAT("OutTargetColumnName10",' ( Last Run )' ) 
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName10",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName10",' ( AVG of Last ',"lvBaseLineValue",' Run )') END )
	INTO "OutSourceColumnName10"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName10",' ( Latest Run )')  
	INTO "OutTargetColumnName10";
END IF;

IF COALESCE("OutSourceColumnName11",'') = '' AND COALESCE("OutTargetColumnName11",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
				THEN CONCAT("OutTargetColumnName11",' ( Last Run )' ) 
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName11",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName11",' ( AVG of Last ',"lvBaseLineValue",' Run )') END )
	INTO "OutSourceColumnName11"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName11",' ( Latest Run )')  
	INTO "OutTargetColumnName11";
END IF;

IF COALESCE("OutSourceColumnName12",'') = '' AND COALESCE("OutTargetColumnName12",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
				THEN CONCAT("OutTargetColumnName12",' ( Last Run )' ) 
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName12",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName12",' ( AVG of Last ',"lvBaseLineValue",' Run )') END )
	INTO "OutSourceColumnName12"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName12",' ( Latest Run )')  
	INTO "OutTargetColumnName12";
END IF;

IF COALESCE("OutSourceColumnName13",'') = '' AND COALESCE("OutTargetColumnName13",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
				THEN CONCAT("OutTargetColumnName13",' ( Last Run )' ) 
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName13",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName13",' ( AVG of Last ',"lvBaseLineValue",' Run )') END )
	INTO "OutSourceColumnName13"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName13",' ( Latest Run )')  
	INTO "OutTargetColumnName13";
END IF;

IF COALESCE("OutSourceColumnName14",'') = '' AND COALESCE("OutTargetColumnName14",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
				THEN CONCAT("OutTargetColumnName14",' ( Last Run )' ) 
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName14",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName14",' ( AVG of Last ',"lvBaseLineValue",' Run )') END )
	INTO "OutSourceColumnName14"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName14",' ( Latest Run )')  
	INTO "OutTargetColumnName14";
END IF;

IF COALESCE("OutSourceColumnName15",'') = '' AND COALESCE("OutTargetColumnName15",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
				THEN CONCAT("OutTargetColumnName15",' ( Last Run )' ) 
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName15",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName15",' ( AVG of Last ',"lvBaseLineValue",' Run )') END )
	INTO "OutSourceColumnName15"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName15",' ( Latest Run )')  
	INTO "OutTargetColumnName15";
END IF;

IF COALESCE("OutSourceColumnName16",'') = '' AND COALESCE("OutTargetColumnName16",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
				THEN CONCAT("OutTargetColumnName16",' ( Last Run )' ) 
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName16",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName16",' ( AVG of Last ',"lvBaseLineValue",' Run )') END )
	INTO "OutSourceColumnName16"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName16",' ( Latest Run )')  
	INTO "OutTargetColumnName16";
END IF;

IF COALESCE("OutSourceColumnName17",'') = '' AND COALESCE("OutTargetColumnName17",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
				THEN CONCAT("OutTargetColumnName17",' ( Last Run )' ) 
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName17",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName17",' ( AVG of Last ',"lvBaseLineValue",' Run )') END )
	INTO "OutSourceColumnName17"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName17",' ( Latest Run )')  
	INTO "OutTargetColumnName17";
END IF;

IF COALESCE("OutSourceColumnName18",'') = '' AND COALESCE("OutTargetColumnName18",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
				THEN CONCAT("OutTargetColumnName18",' ( Last Run )' ) 
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName18",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName18",' ( AVG of Last ',"lvBaseLineValue",' Run )') END )
	INTO "OutSourceColumnName18"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName18",' ( Latest Run )')  
	INTO "OutTargetColumnName18";
END IF;

IF COALESCE("OutSourceColumnName19",'') = '' AND COALESCE("OutTargetColumnName19",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
				THEN CONCAT("OutTargetColumnName19",' ( Last Run )' ) 
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName19",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName19",' ( AVG of Last ',"lvBaseLineValue",' Run )') END )
	INTO "OutSourceColumnName19"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName19",' ( Latest Run )')  
	INTO "OutTargetColumnName19";
END IF;

IF COALESCE("OutSourceColumnName20",'') = '' AND COALESCE("OutTargetColumnName20",'') > '' 
THEN

    SELECT (CASE WHEN UPPER("BaseLineValueType") = 'LASTVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
				THEN CONCAT("OutTargetColumnName20",' ( Last Run )' ) 
			 WHEN UPPER("BaseLineValueType") = 'FIXEDVALUE' AND UPPER("lvAlertTypeInd") IN ('TARGETVALUE','TARGETCOUNT') 
						THEN  CONCAT("OutTargetColumnName20",' ( FixedValue )')
			ELSE CONCAT("OutTargetColumnName20",' ( AVG of Last ',"lvBaseLineValue",' Run )') END )
	INTO "OutSourceColumnName20"
	FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	SELECT CONCAT("OutTargetColumnName20",' ( Latest Run )')  
	INTO "OutTargetColumnName20";
END IF;

RAISE NOTICE 'VALUE: %','55555';
----------------------------------------------------------------------------------------------------------------------------------------------------------
"SelectQueryString" := CONCAT(' 
                SELECT *,(CASE WHEN ',"SecondarySegmentCount",' > 0 AND UPPER(''',"lvAlertTypeInd",''') != UPPER(''TargetValue'') AND  "CritIcalInd" = ''Y'' THEN ''Y''
							ELSE ''N'' END) "DrillThroughInd"
				FROM
				(
				SELECT c."FDAAlertOutputByAdvancedSegmentId",
                       c."FDAAlertOutputId",
                       SUBSTRING(CAST(c."ReconciliationDate" AS VARCHAR),6,5) "RunDate",
                       CAST(CAST(c."ReconciliationTime" AS TIME)AS VARCHAR(15)) "ReconciliationTime",
					   COALESCE((CASE WHEN COALESCE(c."SourceSegment1",''TOTAL'')  = COALESCE(c."TargetSegment1",''TOTAL'') 
								THEN COALESCE(c."TargetSegment1",''TOTAL'') 
					   		 WHEN COALESCE(c."SourceSegment1",'''')  = '''' AND COALESCE(c."TargetSegment1",'''') > '''' 
								THEN c."TargetSegment1"
					   		 WHEN COALESCE(c."TargetSegment1",'''')  = '''' AND COALESCE(c."SourceSegment1",'''') > '''' 
								THEN c."SourceSegment1"
					   		 ELSE c."TargetSegment1" 
					   	END),'''') "SegmentValue1",
					    COALESCE((CASE WHEN COALESCE(c."SourceSegment2",''TOTAL'')  = COALESCE(c."TargetSegment2",''TOTAL'') 
								THEN c."TargetSegment2" 
					    	  WHEN COALESCE(c."SourceSegment2",'''')  = '''' AND COALESCE(c."TargetSegment2",'''') > '''' 
								THEN c."TargetSegment2"
					    	  WHEN COALESCE(c."TargetSegment2",'''')  = '''' AND COALESCE(c."SourceSegment2",'''') > '''' 
								THEN c."SourceSegment2"
					    	  ELSE c."TargetSegment2"
					    END),'''') "SegmentValue2",
					    COALESCE((CASE WHEN COALESCE(c."SourceSegment3",''TOTAL'')  = COALESCE(c."TargetSegment3",''TOTAL'') 
								THEN c."TargetSegment3"
					    	  WHEN COALESCE(c."SourceSegment3",'''')  = '''' AND COALESCE(c."TargetSegment3",'''') != '''' 
								THEN c."TargetSegment3"
					    	  WHEN COALESCE(c."TargetSegment3",'''')  = '''' AND COALESCE(c."SourceSegment3",'''') != '''' 
								THEN c."SourceSegment3"
					    	  ELSE c."TargetSegment3"
					    END),'''') "SegmentValue3",
					    COALESCE((CASE WHEN COALESCE(c."SourceSegment4",''TOTAL'')  = COALESCE(c."TargetSegment4",''TOTAL'') 
								THEN c."TargetSegment4"
					    	  WHEN COALESCE(c."SourceSegment4",'''')  = '''' AND COALESCE(c."TargetSegment4",'''') != '''' 
								THEN c."TargetSegment4"
					    	  WHEN COALESCE(c."TargetSegment4",'''')  = '''' AND COALESCE(c."SourceSegment4",'''') != '''' 
								THEN c."SourceSegment4"
					    	  ELSE c."TargetSegment4" 
					    END),'''') "SegmentValue4",
					    COALESCE((CASE WHEN COALESCE(c."SourceSegment5",''TOTAL'')  = COALESCE(c."TargetSegment5",''TOTAL'') 
								THEN c."TargetSegment5"
					    	  WHEN COALESCE(c."SourceSegment5",'''')  = '''' AND COALESCE(c."TargetSegment5",'''') != '''' 
								THEN c."TargetSegment5"
					    	  WHEN COALESCE(c."TargetSegment5",'''')  = '''' AND COALESCE(c."SourceSegment5",'''') != '''' 
								THEN c."SourceSegment5"
					    	  ELSE c."TargetSegment5"
					    END),'''') "SegmentValue5",		
								
					    CAST(c."SourceValue1" AS  NUMERIC(39,2)) "SourceValue1",
                        CAST(c."TargetValue1" AS   NUMERIC(39,2)) "TargetValue1",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue1" AS  NUMERIC(39,2)),CAST(c."TargetValue1" AS   NUMERIC(39,2))) "ValueDiff1",						
					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold1",'''')  = ''1''  THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold1",'''')  = ''2''  THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold1",'''')  = ''3''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold1",'''')  = ''9''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold1",'''')  = ''93''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold1",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
					    END) "ColorBasedSeviority1",

					    CAST( c."SourceValue2" AS  NUMERIC(39,2))  "SourceValue2",
                        CAST(c."TargetValue2"   AS  NUMERIC(39,2)) "TargetValue2",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue2" AS  NUMERIC(39,2)),CAST(c."TargetValue2" AS   NUMERIC(39,2))) "ValueDiff2",						
						
					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold2",'''')  = ''1''  THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold2",'''')  = ''2''  THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold2",'''')  = ''3''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold2",'''')  = ''9''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold2",'''')  = ''93''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold2",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
						END) "ColorBasedSeviority2",

					    CAST( c."SourceValue3"  AS  NUMERIC(39,2)) "SourceValue3",
                        CAST(c."TargetValue3"  AS  NUMERIC(39,2)) "TargetValue3",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue3" AS  NUMERIC(39,2)),CAST(c."TargetValue3" AS   NUMERIC(39,2))) "ValueDiff3",						
						
					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold3",'''')  = ''1'' THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold3",'''')  = ''2''   THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold3",'''')  = ''3''   THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold3",'''')  = ''9''   THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold3",'''')  = ''93''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold3",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
					    END) "ColorBasedSeviority3",

					    CAST(c."SourceValue4" AS  NUMERIC(39,2)) "SourceValue4",
                        CAST(c."TargetValue4"  AS  NUMERIC(39,2)) "TargetValue4",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue4" AS  NUMERIC(39,2)),CAST(c."TargetValue4" AS   NUMERIC(39,2))) "ValueDiff4",						
						
					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold4",'''')  = ''1''  THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold4",'''')  = ''2''  THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold4",'''')  = ''3''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold4",'''')  = ''9''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold4",'''')  = ''93''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold4",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
					    END) "ColorBasedSeviority4",

					    CAST(c."SourceValue5" AS  NUMERIC(39,2)) "SourceValue5",
                        CAST(c."TargetValue5" AS  NUMERIC(39,2)) "TargetValue5",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue5" AS  NUMERIC(39,2)),CAST(c."TargetValue5" AS   NUMERIC(39,2))) "ValueDiff5",						
						
					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold5",'''')  = ''1''  THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold5",'''')  = ''2''  THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold5",'''')  = ''3''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold5",'''')  = ''9''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold5",'''')  = ''93''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold5",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
					    END) "ColorBasedSeviority5",
						
						CAST(c."SourceValue6" AS  NUMERIC(39,2)) "SourceValue6",
                        CAST(c."TargetValue6" AS  NUMERIC(39,2)) "TargetValue6",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue6" AS  NUMERIC(39,2)),CAST(c."TargetValue6" AS   NUMERIC(39,2))) "ValueDiff6",						

						
					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold6",'''')  = ''1''  THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold6",'''')  = ''2''  THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold6",'''')  = ''3''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold6",'''')  = ''9''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold6",'''')  = ''93''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold6",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
					    END) "ColorBasedSeviority6", 
						
						CAST(c."SourceValue7" AS  NUMERIC(39,2)) "SourceValue7",
                        CAST(c."TargetValue7" AS  NUMERIC(39,2)) "TargetValue7",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue7" AS  NUMERIC(39,2)),CAST(c."TargetValue7" AS   NUMERIC(39,2))) "ValueDiff7",						

					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold7",'''')  = ''1''  THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold7",'''')  = ''2''  THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold7",'''')  = ''3''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold7",'''')  = ''9''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold7",'''')  = ''93''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold7",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
					    END) "ColorBasedSeviority7",
						
						CAST(c."SourceValue8" AS  NUMERIC(39,2)) "SourceValue8",
                        CAST(c."TargetValue8" AS  NUMERIC(39,2)) "TargetValue8",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue8" AS  NUMERIC(39,2)),CAST(c."TargetValue8" AS   NUMERIC(39,2))) "ValueDiff8",						

					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold8",'''')  = ''1''  THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold8",'''')  = ''2''  THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold8",'''')  = ''3''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold8",'''')  = ''9''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold8",'''')  = ''93''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold8",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
					    END) "ColorBasedSeviority8",
						
						CAST(c."SourceValue9" AS  NUMERIC(39,2)) "SourceValue9",
                        CAST(c."TargetValue9" AS  NUMERIC(39,2)) "TargetValue9",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue9" AS  NUMERIC(39,2)),CAST(c."TargetValue9" AS   NUMERIC(39,2))) "ValueDiff9",						

					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold9",'''')  = ''1''  THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold9",'''')  = ''2''  THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold9",'''')  = ''3''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold9",'''')  = ''9''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold9",'''')  = ''93''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold9",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
					    END) "ColorBasedSeviority9",
						
						CAST(c."SourceValue10" AS  NUMERIC(39,2)) "SourceValue10",
                        CAST(c."TargetValue10" AS  NUMERIC(39,2)) "TargetValue10",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue10" AS  NUMERIC(39,2)),CAST(c."TargetValue10" AS   NUMERIC(39,2))) "ValueDiff10",						

					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold10",'''')  = ''1''  THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold10",'''')  = ''2''  THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold10",'''')  = ''3''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold10",'''')  = ''9''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold10",'''')  = ''93''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold10",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
					    END) "ColorBasedSeviority10",
						
						CAST(c."SourceValue11" AS  NUMERIC(39,2)) "SourceValue11",
                        CAST(c."TargetValue11" AS  NUMERIC(39,2)) "TargetValue11",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue11" AS  NUMERIC(39,2)),CAST(c."TargetValue11" AS   NUMERIC(39,2))) "ValueDiff11",						

						
					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold11",'''')  = ''1''  THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold11",'''')  = ''2''  THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold11",'''')  = ''3''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold11",'''')  = ''9''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold11",'''')  = ''93''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold11",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
					    END) "ColorBasedSeviority11",
						
						CAST(c."SourceValue12" AS  NUMERIC(39,2)) "SourceValue12",
                        CAST(c."TargetValue12" AS  NUMERIC(39,2)) "TargetValue12",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue12" AS  NUMERIC(39,2)),CAST(c."TargetValue12" AS   NUMERIC(39,2))) "ValueDiff12",						
						
					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold12",'''')  = ''1''  THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold12",'''')  = ''2''  THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold12",'''')  = ''3''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold12",'''')  = ''9''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold12",'''')  = ''93''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold12",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
					    END) "ColorBasedSeviority12",
						
						CAST(c."SourceValue13" AS  NUMERIC(39,2)) "SourceValue13",
                        CAST(c."TargetValue13" AS  NUMERIC(39,2)) "TargetValue13",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue13" AS  NUMERIC(39,2)),CAST(c."TargetValue13" AS   NUMERIC(39,2))) "ValueDiff13",						

					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold13",'''')  = ''1''  THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold13",'''')  = ''2''  THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold13",'''')  = ''3''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold13",'''')  = ''9''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold13",'''')  = ''93''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold13",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
					    END) "ColorBasedSeviority13",
						
						CAST(c."SourceValue14" AS  NUMERIC(39,2)) "SourceValue14",
                        CAST(c."TargetValue14" AS  NUMERIC(39,2)) "TargetValue14",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue14" AS  NUMERIC(39,2)),CAST(c."TargetValue14" AS   NUMERIC(39,2))) "ValueDiff14",						

					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold14",'''')  = ''1''  THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold14",'''')  = ''2''  THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold14",'''')  = ''3''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold14",'''')  = ''9''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold14",'''')  = ''93''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold14",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
					    END) "ColorBasedSeviority14",
						
						CAST(c."SourceValue15" AS  NUMERIC(39,2)) "SourceValue15",
                        CAST(c."TargetValue15" AS  NUMERIC(39,2)) "TargetValue15",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue15" AS  NUMERIC(39,2)),CAST(c."TargetValue15" AS   NUMERIC(39,2))) "ValueDiff15",						

					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold15",'''')  = ''1''  THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold15",'''')  = ''2''  THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold15",'''')  = ''3''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold15",'''')  = ''9''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold15",'''')  = ''93''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold15",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
					    END) "ColorBasedSeviority15",
						
						CAST(c."SourceValue16" AS  NUMERIC(39,2)) "SourceValue16",
                        CAST(c."TargetValue16" AS  NUMERIC(39,2)) "TargetValue16",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue16" AS  NUMERIC(39,2)),CAST(c."TargetValue16" AS   NUMERIC(39,2))) "ValueDiff16",						

					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold16",'''')  = ''1''  THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold16",'''')  = ''2''  THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold16",'''')  = ''3''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold16",'''')  = ''9''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold16",'''')  = ''93''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold16",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
					    END) "ColorBasedSeviority16",
						
						CAST(c."SourceValue17" AS  NUMERIC(39,2)) "SourceValue17",
                        CAST(c."TargetValue17" AS  NUMERIC(39,2)) "TargetValue17",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue17" AS  NUMERIC(39,2)),CAST(c."TargetValue17" AS   NUMERIC(39,2))) "ValueDiff17",

					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold17",'''')  = ''1''  THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold17",'''')  = ''2''  THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold17",'''')  = ''3''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold17",'''')  = ''9''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold17",'''')  = ''93''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold17",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
					    END) "ColorBasedSeviority17",
						
						CAST(c."SourceValue18" AS  NUMERIC(39,2)) "SourceValue18",
                        CAST(c."TargetValue18" AS  NUMERIC(39,2)) "TargetValue18",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue18" AS  NUMERIC(39,2)),CAST(c."TargetValue18" AS   NUMERIC(39,2))) "ValueDiff18",

					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold18",'''')  = ''1''  THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold18",'''')  = ''2''  THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold18",'''')  = ''3''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold18",'''')  = ''9''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold18",'''')  = ''93''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold18",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
					    END) "ColorBasedSeviority18",
						
						CAST(c."SourceValue19" AS  NUMERIC(39,2)) "SourceValue19",
                        CAST(c."TargetValue19" AS  NUMERIC(39,2)) "TargetValue19",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue19" AS  NUMERIC(39,2)),CAST(c."TargetValue19" AS   NUMERIC(39,2))) "ValueDiff19",

					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold19",'''')  = ''1''  THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold19",'''')  = ''2''  THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold19",'''')  = ''3''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold19",'''')  = ''9''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold19",'''')  = ''93''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold19",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
					    END) "ColorBasedSeviority19",
						
						CAST(c."SourceValue20" AS  NUMERIC(39,2)) "SourceValue20",
                        CAST(c."TargetValue20" AS  NUMERIC(39,2)) "TargetValue20",
						fda."fn_GetFDASourceTargetDiffPercentage"(CAST(c."SourceValue20" AS  NUMERIC(39,2)),CAST(c."TargetValue20" AS   NUMERIC(39,2))) "ValueDiff20",						

					    (CASE 
							WHEN COALESCE(c."ColorBasedoThreasold20",'''')  = ''1''  THEN ''RED''
					    	WHEN COALESCE(c."ColorBasedoThreasold20",'''')  = ''2''  THEN ''YELLOW''
					    	WHEN COALESCE(c."ColorBasedoThreasold20",'''')  = ''3''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold20",'''')  = ''9''  THEN ''WHITE''
							WHEN COALESCE(c."ColorBasedoThreasold20",'''')  = ''93''  THEN ''WHITE''
					    	WHEN COALESCE(c."ColorBasedoThreasold20",'''')  = '''' THEN ''WHITE''
					    	ELSE ''WHITE''
					    END) "ColorBasedSeviority20",
						
						(CASE
							WHEN c."ColorBasedoThreasold1" = ''1'' OR c."ColorBasedoThreasold2"  = ''1'' 
								OR c."ColorBasedoThreasold3" = ''1'' OR c."ColorBasedoThreasold4"  = ''1'' 
									OR c."ColorBasedoThreasold5" = ''1'' OR c."ColorBasedoThreasold6"  = ''1'' 
										OR c."ColorBasedoThreasold7" = ''1'' OR c."ColorBasedoThreasold8"  = ''1'' 
											OR c."ColorBasedoThreasold9" = ''1'' OR c."ColorBasedoThreasold10" = ''1'' 
												OR c."ColorBasedoThreasold11" = ''1'' OR c."ColorBasedoThreasold12" = ''1'' 
													OR c."ColorBasedoThreasold13" = ''1'' OR c."ColorBasedoThreasold14" = ''1'' 
														OR c."ColorBasedoThreasold15" = ''1'' OR c."ColorBasedoThreasold16" = ''1'' 
															OR c."ColorBasedoThreasold17" = ''1'' OR c."ColorBasedoThreasold18" = ''1'' 
																OR c."ColorBasedoThreasold19" = ''1'' OR c."ColorBasedoThreasold20" = ''1''
								THEN ''Y''
							ELSE ''N''
						END) "CritIcalInd" 
						');

 "FromString" := ' FROM fda."FDAAlertOutputByAdvancedSegment"  AS c,
 fda."FDAAlertRules" a
 ';

 "WhereConditionString" := CONCAT('
WHERE c."FDAAlertRulesId" = a."FDAAlertRulesId"
  AND c."FDAAlertRulesId" = ',"InFDAAlertRulesId",'
  AND c."FDAAlertOutputId" = ',"InFDAAlertOutputId",'
  AND c."TargetSegment1" NOT IN (SELECT "TargetSegmentValue1"
								FROM fda."FDAAlertRulesTargetSegmentValue"
							    WHERE "FDAAlertRulesId" = ',"InFDAAlertRulesId",'
								  AND "CheckedStatus" = ''FALSE'') )x');
"WhereConditionString2" :=CONCAT(' WHERE CONCAT("ColorBasedSeviority1","ColorBasedSeviority2","ColorBasedSeviority3","ColorBasedSeviority4","ColorBasedSeviority5","ColorBasedSeviority6","ColorBasedSeviority7","ColorBasedSeviority8","ColorBasedSeviority9","ColorBasedSeviority10",
												"ColorBasedSeviority11","ColorBasedSeviority12","ColorBasedSeviority13","ColorBasedSeviority14","ColorBasedSeviority15","ColorBasedSeviority16","ColorBasedSeviority17","ColorBasedSeviority18","ColorBasedSeviority19","ColorBasedSeviority20"	) LIKE ''%RED%''
								OR CONCAT("ColorBasedSeviority1","ColorBasedSeviority2","ColorBasedSeviority3","ColorBasedSeviority4","ColorBasedSeviority5","ColorBasedSeviority6","ColorBasedSeviority7","ColorBasedSeviority8","ColorBasedSeviority9","ColorBasedSeviority10",
												"ColorBasedSeviority11","ColorBasedSeviority12","ColorBasedSeviority13","ColorBasedSeviority14","ColorBasedSeviority15","ColorBasedSeviority16","ColorBasedSeviority17","ColorBasedSeviority18","ColorBasedSeviority19","ColorBasedSeviority20"	) LIKE ''%YELLOW%'' ');

 "OrderByString" := CASE WHEN "InOrderByColumnName" > '' AND "InOrderBy" > '' AND "InTabInd" = 'Y' THEN
                        CONCAT(' ORDER BY "',"InOrderByColumnName",'","ColorBasedSeviority1","ColorBasedSeviority2","ColorBasedSeviority3","ColorBasedSeviority4","ColorBasedSeviority5","ColorBasedSeviority6","ColorBasedSeviority7","ColorBasedSeviority8","ColorBasedSeviority9","ColorBasedSeviority10",
								"ColorBasedSeviority11","ColorBasedSeviority12","ColorBasedSeviority13","ColorBasedSeviority14","ColorBasedSeviority15","ColorBasedSeviority16","ColorBasedSeviority17","ColorBasedSeviority18","ColorBasedSeviority19","ColorBasedSeviority20" ',"InOrderBy",' 
	                     OFFSET ',"InOffSet",' ROWS
	                     FETCH NEXT ',"InLimit",' ROWS ONLY;')
						 WHEN "InOrderByColumnName" = '' AND "InOrderBy" = '' AND "InTabInd" = 'Y' THEN
                        CONCAT(' ORDER BY "ColorBasedSeviority1","ColorBasedSeviority2","ColorBasedSeviority3","ColorBasedSeviority4","ColorBasedSeviority5","ColorBasedSeviority6","ColorBasedSeviority7","ColorBasedSeviority8","ColorBasedSeviority9","ColorBasedSeviority10",
								"ColorBasedSeviority11","ColorBasedSeviority12","ColorBasedSeviority13","ColorBasedSeviority14","ColorBasedSeviority15","ColorBasedSeviority16","ColorBasedSeviority17","ColorBasedSeviority18","ColorBasedSeviority19","ColorBasedSeviority20" ',"InOrderBy",' 
	                     OFFSET ',"InOffSet",' ROWS
	                     FETCH NEXT ',"InLimit",' ROWS ONLY;')
						 WHEN "InOrderByColumnName" > '' AND "InOrderBy" > '' THEN
						 CONCAT(' ORDER BY "',"InOrderByColumnName",'" ',"InOrderBy",' 
	                     OFFSET ',"InOffSet",' ROWS
	                     FETCH NEXT ',"InLimit",' ROWS ONLY;')
                        ELSE 						
							 CONCAT(' ORDER BY "SegmentValue1","SegmentValue2","SegmentValue3","SegmentValue4","SegmentValue5" ASC
	                     OFFSET ',"InOffSet",' ROWS
	                     FETCH NEXT ',"InLimit",' ROWS ONLY;')
                        /*ELSE CONCAT(' ORDER BY x."ColorBasedSeviority1",
						                       x."ColorBasedSeviority2",
                                               x."ColorBasedSeviority3",
		                                       x."ColorBasedSeviority4",
		                                       x."ColorBasedSeviority5" ASC
                                      OFFSET ',"InOffSet",' ROWS
                                      FETCH NEXT ',"InLimit",' ROWS ONLY')
									*/
                         END;

IF "InTabInd" = 'Y' THEN 
 "SelectQueryString" := CONCAT("SelectQueryString","FromString","WhereConditionString","WhereConditionString2","OrderByString");
 ELSE 
"SelectQueryString" := CONCAT("SelectQueryString","FromString","WhereConditionString","OrderByString");
END IF;
--RAISE NOTICE 'SelectQueryString: %',"SelectQueryString";
--RAISE NOTICE 'WhereConditionString: %',"WhereConditionString";
RAISE NOTICE 'VALUE: %',"SelectQueryString";

OPEN $10 FOR
	EXECUTE  "SelectQueryString" ;
RETURN NEXT $10;
  
--WHERE SegmentValue1 >''
SELECT COUNT(*) INTO "OutTotalRecordCount" 
FROM
(SELECT c."FDAAlertOutputByAdvancedSegmentId",
        c."FDAAlertOutputId"  
FROM fda."FDAAlertOutputByAdvancedSegment"  AS c
WHERE c."FDAAlertRulesId" = "InFDAAlertRulesId"
  AND c."FDAAlertOutputId" = "InFDAAlertOutputId" )x ;
  
----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 "ResultPercentage1" := ((((SELECT COUNT("ColorBasedoThreasold1") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold1",''),'0') AS NUMERIC) NOT IN (1,2)) * 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END 
                                                                                  FROM fda."FDAAlertOutputByAdvancedSegment"
												                                  WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ) ) *100);
 "ResultPercentage2" := ((((SELECT COUNT("ColorBasedoThreasold2") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold2",''),'0') AS NUMERIC) NOT IN (1,2))* 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END
                                                                                  FROM fda."FDAAlertOutputByAdvancedSegment"
												                                  WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ))*100);
 "ResultPercentage3" := ((((SELECT COUNT("ColorBasedoThreasold3") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold3",''),'0') AS NUMERIC) NOT IN (1,2))* 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END 
                                                                                 FROM fda."FDAAlertOutputByAdvancedSegment"
												                                 WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ))*100);
 "ResultPercentage4" := ((((SELECT COUNT("ColorBasedoThreasold4") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold4",''),'0') AS NUMERIC) NOT IN (1,2))* 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END
                                                                                 FROM fda."FDAAlertOutputByAdvancedSegment"
												                                 WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ))*100);
 "ResultPercentage5" := ((((SELECT COUNT("ColorBasedoThreasold5") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold5",''),'0') AS NUMERIC) NOT IN (1,2))* 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END
                                                                                 FROM fda."FDAAlertOutputByAdvancedSegment"
												                                 WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ))*100);
 "ResultPercentage6" := ((((SELECT COUNT("ColorBasedoThreasold6") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold6",''),'0') AS NUMERIC) NOT IN (1,2))* 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END
                                                                                 FROM fda."FDAAlertOutputByAdvancedSegment"
												                                 WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ))*100);
 "ResultPercentage7" := ((((SELECT COUNT("ColorBasedoThreasold7") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold7",''),'0') AS NUMERIC) NOT IN (1,2))* 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END
                                                                                 FROM fda."FDAAlertOutputByAdvancedSegment"
												                                 WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ))*100);
 "ResultPercentage8" := ((((SELECT COUNT("ColorBasedoThreasold8") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold8",''),'0') AS NUMERIC) NOT IN (1,2))* 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END
                                                                                 FROM fda."FDAAlertOutputByAdvancedSegment"
												                                 WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ))*100);
 "ResultPercentage9" := ((((SELECT COUNT("ColorBasedoThreasold9") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold9",''),'0') AS NUMERIC) NOT IN (1,2))* 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END
                                                                                 FROM fda."FDAAlertOutputByAdvancedSegment"
												                                 WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ))*100);
 "ResultPercentage10" := ((((SELECT COUNT("ColorBasedoThreasold10") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold10",''),'0') AS NUMERIC) NOT IN (1,2))* 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END
                                                                                 FROM fda."FDAAlertOutputByAdvancedSegment"
												                                 WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ))*100);
 "ResultPercentage11" := ((((SELECT COUNT("ColorBasedoThreasold11") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold11",''),'0') AS NUMERIC) NOT IN (1,2))* 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END
                                                                                 FROM fda."FDAAlertOutputByAdvancedSegment"
												                                 WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ))*100);
 "ResultPercentage12" := ((((SELECT COUNT("ColorBasedoThreasold12") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold12",''),'0') AS NUMERIC) NOT IN (1,2))* 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END
                                                                                 FROM fda."FDAAlertOutputByAdvancedSegment"
												                                 WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ))*100);
 "ResultPercentage13" := ((((SELECT COUNT("ColorBasedoThreasold13") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold13",''),'0') AS NUMERIC) NOT IN (1,2))* 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END
                                                                                 FROM fda."FDAAlertOutputByAdvancedSegment"
												                                 WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ))*100);
 "ResultPercentage14" := ((((SELECT COUNT("ColorBasedoThreasold14") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold14",''),'0') AS NUMERIC) NOT IN (1,2))* 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END
                                                                                 FROM fda."FDAAlertOutputByAdvancedSegment"
												                                 WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ))*100);
 "ResultPercentage15" := ((((SELECT COUNT("ColorBasedoThreasold15") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold15",''),'0') AS NUMERIC) NOT IN (1,2))* 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END
                                                                                 FROM fda."FDAAlertOutputByAdvancedSegment"
												                                 WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ))*100);
 "ResultPercentage16" := ((((SELECT COUNT("ColorBasedoThreasold16") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold16",''),'0') AS NUMERIC) NOT IN (1,2))* 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END
                                                                                 FROM fda."FDAAlertOutputByAdvancedSegment"
												                                 WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ))*100);
 "ResultPercentage17" := ((((SELECT COUNT("ColorBasedoThreasold17") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold17",''),'0') AS NUMERIC) NOT IN (1,2))* 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END
                                                                                 FROM fda."FDAAlertOutputByAdvancedSegment"
												                                 WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ))*100);
 "ResultPercentage18" := ((((SELECT COUNT("ColorBasedoThreasold18") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold18",''),'0') AS NUMERIC) NOT IN (1,2))* 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END
                                                                                 FROM fda."FDAAlertOutputByAdvancedSegment"
												                                 WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ))*100);
 "ResultPercentage19" := ((((SELECT COUNT("ColorBasedoThreasold19") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold19",''),'0') AS NUMERIC) NOT IN (1,2))* 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END
                                                                                 FROM fda."FDAAlertOutputByAdvancedSegment"
												                                 WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ))*100);
 "ResultPercentage20" := ((((SELECT COUNT("ColorBasedoThreasold20") 
                                FROM fda."FDAAlertOutputByAdvancedSegment"
								WHERE "FDAAlertOutputId" = "InFDAAlertOutputId"
								AND CAST(COALESCE(NULLIF("ColorBasedoThreasold20",''),'0') AS NUMERIC) NOT IN (1,2))* 0.1 )/((SELECT CASE WHEN COUNT(*) = 0 THEN 1 ELSE COUNT(*) END
                                                                                 FROM fda."FDAAlertOutputByAdvancedSegment"
												                                 WHERE "FDAAlertOutputId" = "InFDAAlertOutputId") * 0.1 ))*100);																				 

--PRINT(123)
SELECT (CASE WHEN  "ResultPercentage1" LIKE '0.00%' THEN '0'
WHEN  "ResultPercentage1" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage1",1,2),'.','') END) INTO "OutSourceTargetValue1DifferencePercent";			
SELECT (CASE WHEN  "ResultPercentage2" LIKE '0.00%' THEN '0'
WHEN  "ResultPercentage2" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage2",1,2),'.','') END) INTO "OutSourceTargetValue2DifferencePercent";							   
SELECT (CASE WHEN  "ResultPercentage3" LIKE '0.00%' THEN '0'
WHEN  "ResultPercentage3" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage3",1,2),'.','') END) INTO "OutSourceTargetValue3DifferencePercent";							   
SELECT (CASE WHEN "ResultPercentage4" LIKE '0.00%' THEN '0'
WHEN "ResultPercentage4" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage4",1,2),'.','') END) INTO "OutSourceTargetValue4DifferencePercent";							   
SELECT (CASE WHEN "ResultPercentage5" LIKE '0.00%' THEN '0'
WHEN "ResultPercentage5" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage5",1,2),'.','') END) INTO "OutSourceTargetValue5DifferencePercent";
SELECT (CASE WHEN "ResultPercentage6" LIKE '0.00%' THEN '0'
WHEN "ResultPercentage6" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage6",1,2),'.','') END) INTO "OutSourceTargetValue6DifferencePercent";
SELECT (CASE WHEN "ResultPercentage7" LIKE '0.00%' THEN '0'
WHEN "ResultPercentage7" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage7",1,2),'.','') END) INTO "OutSourceTargetValue7DifferencePercent";
SELECT (CASE WHEN "ResultPercentage8" LIKE '0.00%' THEN '0'
WHEN "ResultPercentage8" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage8",1,2),'.','') END) INTO "OutSourceTargetValue8DifferencePercent";
SELECT (CASE WHEN "ResultPercentage9" LIKE '0.00%' THEN '0'
WHEN "ResultPercentage9" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage9",1,2),'.','') END) INTO "OutSourceTargetValue9DifferencePercent";
SELECT (CASE WHEN "ResultPercentage10" LIKE '0.00%' THEN '0'
WHEN "ResultPercentage10" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage10",1,2),'.','') END) INTO "OutSourceTargetValue10DifferencePercent";
SELECT (CASE WHEN "ResultPercentage11" LIKE '0.00%' THEN '0'
WHEN "ResultPercentage11" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage11",1,2),'.','') END) INTO "OutSourceTargetValue11DifferencePercent";
SELECT (CASE WHEN "ResultPercentage12" LIKE '0.00%' THEN '0'
WHEN "ResultPercentage12" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage12",1,2),'.','') END) INTO "OutSourceTargetValue12DifferencePercent";
SELECT (CASE WHEN "ResultPercentage13" LIKE '0.00%' THEN '0'
WHEN "ResultPercentage13" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage13",1,2),'.','') END) INTO "OutSourceTargetValue13DifferencePercent";
SELECT (CASE WHEN "ResultPercentage14" LIKE '0.00%' THEN '0'
WHEN "ResultPercentage14" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage14",1,2),'.','') END) INTO "OutSourceTargetValue14DifferencePercent";
SELECT (CASE WHEN "ResultPercentage15" LIKE '0.00%' THEN '0'
WHEN "ResultPercentage15" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage15",1,2),'.','') END) INTO "OutSourceTargetValue15DifferencePercent";
SELECT (CASE WHEN "ResultPercentage16" LIKE '0.00%' THEN '0'
WHEN "ResultPercentage16" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage16",1,2),'.','') END) INTO "OutSourceTargetValue16DifferencePercent";
SELECT (CASE WHEN "ResultPercentage17" LIKE '0.00%' THEN '0'
WHEN "ResultPercentage17" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage17",1,2),'.','') END) INTO "OutSourceTargetValue17DifferencePercent";
SELECT (CASE WHEN "ResultPercentage18" LIKE '0.00%' THEN '0'
WHEN "ResultPercentage18" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage18",1,2),'.','') END) INTO "OutSourceTargetValue18DifferencePercent";
SELECT (CASE WHEN "ResultPercentage19" LIKE '0.00%' THEN '0'
WHEN "ResultPercentage19" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage19",1,2),'.','') END) INTO "OutSourceTargetValue19DifferencePercent";
SELECT (CASE WHEN "ResultPercentage20" LIKE '0.00%' THEN '0'
WHEN "ResultPercentage20" LIKE '100%' THEN '100'
ELSE REPLACE(SUBSTRING("ResultPercentage20",1,2),'.','') END) INTO "OutSourceTargetValue20DifferencePercent";
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Fetch Notes Added with 
SELECT "Notes",
	"AlertInd",
	"NewBaseLineInd",
	"ConfirmedByUser",
	CONCAT(to_char(cast("LastUpdatedDateTime" as timestamp),'HH24:MI:SS'),' GMT') AS "TIMEGMT",
	"AlertStatus",
	(CASE 
		WHEN  "SourceSegmentCount" is not null 
			OR  "TargetSegmentCount" is not null 
				THEN 
					(CASE 
						WHEN "SourceSegmentCount" = "TargetSegmentCount"
							THEN 'In total there are ' || "SourceSegmentCount" || ' segments in Source and ' || "TargetSegmentCount" || ' in target. Therefore, segment count reconciles perfectly fine.'
						ELSE 'In total there are ' || "SourceSegmentCount" || ' segments in Source and ' || "TargetSegmentCount" || ' in target. Therefore, segment count does not reconcile perfectly.'
					END)
		ELSE ''
	END) AS "SegmentCountStatus",
	(CASE 
	 	WHEN  "SourceSegmentCount" is not null 
			OR  "TargetSegmentCount" is not null 
	 			THEN 
	 				(CASE 
						WHEN "SourceSegmentCount" = "TargetSegmentCount" 
							THEN 'GREEN' 
						ELSE 'RED'
	 				END)
	 	ELSE ''
	END) AS"SegmentCountColorInd",
	(CASE 
		WHEN "SourceSegmentCount" >= 1000 
	 		OR "TargetSegmentCount" >= 1000 
			THEN 'However, in order to limit the number of segments, detailed reconciliation below is only for 1,000 segments.' 
		ELSE '' 
	END) AS"SegmentCountCriticalStatus"

INTO "OutNotes","OutAlertInd","OutNewBaseLineInd","OutConfirmedByUser","OutTIMEGMT","OutAlertStatus","OutSegmentCountStatus","OutSegmentCountColorInd","OutSegmentCountCriticalStatus"
FROM fda."FDAAlertOutput"
WHERE "FDAAlertOutputId" = "InFDAAlertOutputId";
-------------------------------------------------------------(SUMMARY STATUS)--------------------------------------------------------------------------------------------------------------------
SELECT (CASE WHEN "AlertTypeInd" = 'SourceTargetValue'
				THEN(CASE WHEN COALESCE("SourceSegmentCount",0) > 0 AND  COALESCE("TargetSegmentCount",0) > 0 AND "AlertSegmentInd" = 'WHITE' AND "AlertDetailsDataInd" = 'RED' 
								THEN 'In summary, this reconciliation failed because even though total segment count matched, the details data for each segment did not match.'
						  WHEN COALESCE("SourceSegmentCount",0) > 0 AND  COALESCE("TargetSegmentCount",0) > 0 AND "AlertSegmentInd" = 'RED' AND ("AlertDetailsDataInd" = 'WHITE' OR "AlertDetailsDataInd" = 'RED')
								THEN 'In summary, this reconciliation failed because even total segment count itself did not match.'
						  WHEN COALESCE("SourceSegmentCount",0) = 0 AND  COALESCE("TargetSegmentCount",0) = 0 AND "AlertDetailsDataInd" = 'WHITE'
						  THEN 'In summary, this reconciliation passed because for this the details data matched.'
						  WHEN COALESCE("SourceSegmentCount",0) = 0 AND COALESCE("TargetSegmentCount",0) = 0 AND "AlertDetailsDataInd" = 'RED'
						  THEN 'In summary, this reconciliation failed because for this the details data  did not matched.'	
						  ELSE 'In summary, this reconciliation passed because for this total segment matched and details data also matched.'
					END)
			ELSE(CASE WHEN "AlertDetailsDataInd" = 'RED' 
							THEN 'In summary, this reconciliation failed because the details data for each segment did not match.'
					  ELSE 'In summary, this reconciliation passed because the details data for each segment matched.'
				END)
		END) AS "SummaryStatus"
INTO "OutSummaryStatus"
FROM(SELECT	DISTINCT "AlertTypeInd","SourceSegmentCount","TargetSegmentCount",
			(CASE WHEN COALESCE("SourceSegmentCount",0) = COALESCE("TargetSegmentCount",0) THEN 'WHITE' ELSE 'RED' END) "AlertSegmentInd",		
			(CASE
				WHEN MIN(CASE 
							WHEN "ColorBasedoThreasold1" = '1' OR "ColorBasedoThreasold2" = '1' OR "ColorBasedoThreasold3" = '1' OR "ColorBasedoThreasold4" = '1'
								OR "ColorBasedoThreasold5" = '1' OR "ColorBasedoThreasold6" = '1' OR "ColorBasedoThreasold7" = '1' OR "ColorBasedoThreasold8" = '1'
									OR "ColorBasedoThreasold9" = '1' OR "ColorBasedoThreasold10" = '1' OR "ColorBasedoThreasold11" = '1' OR "ColorBasedoThreasold12" = '1'
										OR "ColorBasedoThreasold13" = '1' OR "ColorBasedoThreasold14" = '1' OR "ColorBasedoThreasold15" = '1' OR "ColorBasedoThreasold16" = '1'
											OR "ColorBasedoThreasold17" = '1' OR "ColorBasedoThreasold18" = '1' OR "ColorBasedoThreasold19" = '1' OR "ColorBasedoThreasold20" = '1'
								THEN '1'
							ELSE '9'
						END) OVER()  = '1' 
					THEN 'RED' 
				ELSE 'WHITE' 
			END) "AlertDetailsDataInd"			
	FROM fda."FDAAlertRules" a
	INNER JOIN fda."FDAAlertOutputByAdvancedSegment" b
		ON a."FDAAlertRulesId" = b."FDAAlertRulesId"
	INNER JOIN fda."FDAAlertOutput" c
		ON b."FDAAlertRulesId" = c."FDAAlertRulesId"
		AND b."FDAAlertOutputId" = c."FDAAlertOutputId"
	WHERE b."FDAAlertRulesId" = "InFDAAlertRulesId"
		AND b."FDAAlertOutputId" = "InFDAAlertOutputId"
	)x;

SELECT  "AlertName","AlertDescription"
INTO "OutAlertName","OutAlertDescription"	
FROM fda."FDAAlertRules"
WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";

OPEN $11 FOR
SELECT  "OutNotes",
		"OutAlertInd",
		"OutNewBaseLineInd",
		"OutConfirmedByUser",
		"OutAlertName",
		"OutAlertDescription",
		"OutTIMEGMT",
		"OutTotalRecordCount",
		"OutAlertStatus",
		"OutSegmentCountStatus",
		"OutSegmentCountColorInd",
		"OutSegmentCountCriticalStatus",
		"OutSummaryStatus",
		
		COALESCE(NULLIF("OutSegmentName1",''),'TOTAL') AS "OutSegmentName1", 
		"OutSegmentName2",
		"OutSegmentName3",
		"OutSegmentName4",
		"OutSegmentName5",
		
		"OutSourceColumnName1" ,
		"OutTargetColumnName1" ,
		"OutSourceColumnName2" ,
		"OutTargetColumnName2" ,
		"OutSourceColumnName3" ,
		"OutTargetColumnName3" ,
		"OutSourceColumnName4" ,
		"OutTargetColumnName4" ,
		"OutSourceColumnName5" ,
		"OutTargetColumnName5" ,
		"OutSourceColumnName6" ,
		"OutTargetColumnName6" ,
		"OutSourceColumnName7" ,
		"OutTargetColumnName7" ,
		"OutSourceColumnName8" ,
		"OutTargetColumnName8" ,
		"OutSourceColumnName9" ,
		"OutTargetColumnName9" ,
		"OutSourceColumnName10",
		"OutTargetColumnName10",
		"OutSourceColumnName11",
		"OutTargetColumnName11",
		"OutSourceColumnName12",
		"OutTargetColumnName12",
		"OutSourceColumnName13",
		"OutTargetColumnName13",
		"OutSourceColumnName14",
		"OutTargetColumnName14",
		"OutSourceColumnName15",
		"OutTargetColumnName15",
		"OutSourceColumnName16",
		"OutTargetColumnName16",
		"OutSourceColumnName17",
		"OutTargetColumnName17",
		"OutSourceColumnName18",
		"OutTargetColumnName18",
		"OutSourceColumnName19",
		"OutTargetColumnName19",
		"OutSourceColumnName20",
		"OutTargetColumnName20",
		
		"OutThreshold1" ,
		"OutThreshold2" ,
		"OutThreshold3" ,
		"OutThreshold4" ,
		"OutThreshold5" ,
		"OutThreshold6" ,
		"OutThreshold7" ,
		"OutThreshold8" ,
		"OutThreshold9" ,
		"OutThreshold10",
		"OutThreshold11",
		"OutThreshold12",
		"OutThreshold13",
		"OutThreshold14",
		"OutThreshold15",
		"OutThreshold16",
		"OutThreshold17",
		"OutThreshold18",
		"OutThreshold19",
		"OutThreshold20",
		
		"OutSourceTargetValue1DifferencePercent" ,
		"OutSourceTargetValue2DifferencePercent" ,
		"OutSourceTargetValue3DifferencePercent" ,
		"OutSourceTargetValue4DifferencePercent" ,
		"OutSourceTargetValue5DifferencePercent" ,
		"OutSourceTargetValue6DifferencePercent" ,
		"OutSourceTargetValue7DifferencePercent" ,
		"OutSourceTargetValue8DifferencePercent" ,
		"OutSourceTargetValue9DifferencePercent" ,
		"OutSourceTargetValue10DifferencePercent",
		"OutSourceTargetValue11DifferencePercent",
		"OutSourceTargetValue12DifferencePercent",
		"OutSourceTargetValue13DifferencePercent",
		"OutSourceTargetValue14DifferencePercent",
		"OutSourceTargetValue15DifferencePercent",
		"OutSourceTargetValue16DifferencePercent",
		"OutSourceTargetValue17DifferencePercent",
		"OutSourceTargetValue18DifferencePercent",
		"OutSourceTargetValue19DifferencePercent",
		"OutSourceTargetValue20DifferencePercent";

RETURN NEXT $11;
--PRINT Out Param
/*
SELECT fda."Proc_ListAlertOutputSourceAndTargetValueWithSeviorityAdvance_V2"(
	5,--"InFDAAlertOutputId" bigint,
	2,--"InFDAAlertRulesId" bigint,
	0,--"InOffSet" bigint,
	10000,--"InLimit" bigint,
	'',--"InOrderByColumnName" character varying,
	'',--"InOrderBy" character varying,
	'',--"InFromDate" character varying,
	'',--"InToDate" character varying,
	'',--"InTabInd" character varying,
	'refcursor1',
	'refcursor2');
FETCH ALL IN "refcursor1";
*/
END;
$BODY$;
-------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: fda.Proc_InsertAlertRulesRunHistory_V5(bigint, bigint, text, text, text, text, character varying)

-- DROP FUNCTION IF EXISTS fda."Proc_InsertAlertRulesRunHistory_V5"(bigint, bigint, text, text, text, text, character varying);

CREATE OR REPLACE FUNCTION fda."Proc_InsertAlertRulesRunHistory_V5"(
	"InFDAAlertRulesId" bigint,
	"InFDAAlertRulesRunId" bigint,
	"InSegmentValues" text,
	"InSourceValue" text,
	"InTargetValue" text,
	"InSegmentCount" text,
	"InuserName" character varying)
    RETURNS integer
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$

DECLARE "lvAlertTypeCategory" VARCHAR(15);
		"lvBaseLineInd" VARCHAR(15);
		"lvBaseLineValue" BIGINT;
		"AlertRunCount" BIGINT;
		"InLocalFDAAlertRulesId"  BIGINT;
		"InLocalFDAAlertRulesRunId"  BIGINT;
		"InLocalSourceValue" TEXT; -- 'TOTAL=120'  OR 'US=10|IN=120|UK=130'
		"InLocalTargetValue" TEXT; -- 'TOTAL=130'  OR 'US=10|IN=120|NL=130'
		"OutLocalAlertStatus" VARCHAR(100);
		"OutLocalSeverity" VARCHAR(1);
		"OutAlertStatus" VARCHAR(100);
		"OutSeverity" VARCHAR(1);
		"lvSeverity" BIGINT = 1;
		"lvAlertType" VARCHAR(50);
		"lvValueSource" NUMERIC(32,10);
		"lvValueTarget" NUMERIC(32,10);
		"InFDAAlertRulesRunIdCurrent" BIGINT;
		"InFDAAlertRulesRunIdPrevious" BIGINT;
		"lvThresholdType" VARCHAR(100);
		"lvAllowNewSegmentInd" VARCHAR(10);
		"lvPreviousAlertRulesRunId" BIGINT;
		"lvAlertInd" VARCHAR(1);
		"lvConfirmedByUser"  VARCHAR(1);
		"lvReconciliationDate" VARCHAR(300);
		"lvPreviousAlertRulesRunIdTarget" BIGINT;
		"lvPriorRunIdTarget" BIGINT;
		"lvColumnCount" BIGINT;
		
		"lvColumnInfo" CHARACTER VARYING;
		"lvSegmentInfo" CHARACTER VARYING;
		"lvTargetSystemType" TEXT;
		"lvThresholdRulesCount" BIGINT;
		"lvThresholdInfo" TEXT;
---------------------------------------------------------------------------FOR SECONDARY LEVEL RECONCILIATION-----------------------------------------------
BEGIN

	SELECT "AlertTypeInd"
	INTO "lvAlertType"
	FROM fda."FDAAlertRules" 
	WHERE "FDAAlertRulesId" =  "InFDAAlertRulesId";
	
	INSERT INTO fda."FDAAlertOutputSecondary"("FDAAlertOutputId","FDAAlertRulesId","SegmentValue","CurrentAlertStatus","LastUpdatedDateTime","LastUpdatedBy")
	VALUES("InFDAAlertRulesRunId","InFDAAlertRulesId","InSegmentValues",'PENDING',CURRENT_TIMESTAMP,CURRENT_USER);

	IF UPPER("lvAlertType") = UPPER('SourceTargetValue') 
	THEN 
		SELECT 
		STRING_AGG("Position"||'^'||"SourceColumnName" ||'^'||"TargetColumnName",'|') "ColumnInfo"
		INTO "lvColumnInfo"
		FROM 
		(SELECT 
			"FDAAlertRulesId",
			"Position",
			"Status",
			(CASE WHEN "SourceColumnName" = 'FDA_RECORD_COUNT' THEN "SourceColumnName" ELSE CONCAT("Function",' Of ',"SourceColumnName") END ) "SourceColumnName",
			(CASE WHEN "SourceColumnName" = 'FDA_RECORD_COUNT' THEN "TargetColumnName" ELSE CONCAT("Function",' Of ',"TargetColumnName") END ) "TargetColumnName"
		FROM fda."FDAAlertRulesColumnMapping" 
		WHERE "Status" = 'true'
			AND "FDAAlertRulesId" = "InFDAAlertRulesId") X;
	ELSE 
		SELECT STRING_AGG("Position"||'^'||(CASE WHEN "TargetColumnName" = 'FDA_RECORD_COUNT' THEN "TargetColumnName"
									ELSE "Function"||' Of '||"TargetColumnName" END),'|') "ColumnInfo"
		INTO "lvColumnInfo"
		FROM(SELECT  "Function","Position","TargetColumnName"
		FROM fda."FDAAlertRulesTargetColumn"
		WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
		AND "Status" = 'true'
		ORDER BY "Position")x;
	END IF;
		
---------------------------------------------------------------------------
	IF (SELECT COALESCE("TargetSegment1",'') FROM fda."FDAAlertOutputByAdvancedSegment" 
			WHERE "FDAAlertRulesId" = "InFDAAlertRulesId" AND "FDAAlertOutputId" = "InFDAAlertRulesRunId" LIMIT 1 ) <> 'TOTAL'
	THEN
		
		SELECT STRING_AGG("TargetSegmentByName",'^') "SegmentInfo"
		INTO "lvSegmentInfo"
		FROM
			(SELECT (RANK() OVER(ORDER BY "RANK","Position")||'~'||"GroupByTargetColumnName") "TargetSegmentByName"
			FROM
				(SELECT 1 "RANK","Position","GroupByTargetColumnName"  
				FROM fda."FDAAlertRulesTargetSegment" 
				WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
				UNION ALL
				SELECT  2 "RANK","Position","GroupByTargetColumnName"
				FROM fda."FDAAlertRulesTargetSegmentSecondary" 
				WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
				)X
			)Y;
	ELSE 
	
		SELECT STRING_AGG("TargetSegmentByName",'^') "SegmentInfo"
		INTO "lvSegmentInfo"
		FROM
			(SELECT  "Position"||'~'||"GroupByTargetColumnName"  "TargetSegmentByName"  
			FROM fda."FDAAlertRulesTargetSegmentSecondary" 
			WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
			ORDER BY "Position"
			)X;
			
		/*SELECT STRING_AGG("TargetSegmentByName",'^') "SegmentInfo"
		INTO "lvSegmentInfo"
		FROM
			(SELECT (RANK() OVER(ORDER BY "RANK","Position")||'~'||"GroupByTargetColumnName") "TargetSegmentByName"
			FROM
				(SELECT 1 "RANK","Position","GroupByTargetColumnName"  
				FROM fda."FDAAlertRulesTargetSegmentSecondary" 
				WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
				UNION ALL
				SELECT  2 "RANK","Position","GroupByTargetColumnName"
				FROM fda."FDAAlertRulesTargetSegment" 
				WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
				)X
			)Y;*/
			
	END IF;
-----------------------------------------------------------------------
	SELECT "ThresholdType"
	INTO  "lvThresholdType"
	FROM fda."FDAAlertRules"
	WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	IF LOWER("lvThresholdType") = 'default'
	THEN 
		SELECT 
			CONCAT((CASE 
						WHEN "LowerThresholdType" = 'Percentage' THEN CONCAT(CAST("LowerThresholdValue" AS NUMERIC(17,1)),'% LCL')
						WHEN "LowerThresholdType" = 'StandardDeviation' THEN CONCAT(CAST("LowerThresholdValue" AS NUMERIC(17,1)),'σ LCL')
						WHEN "LowerThresholdType" = 'Absolute' THEN  CONCAT("LowerThresholdValue",' LCL')
						ELSE 'No LCL'
					END),
					'-',
					(CASE 
						WHEN "UpperThresholdType" = 'Percentage' THEN CONCAT(CAST("UpperThresholdValue" AS NUMERIC(17,1)),'% UCL')
						WHEN "UpperThresholdType" = 'StandardDeviation' THEN CONCAT(CAST("UpperThresholdValue" AS NUMERIC(17,1)),'σ UCL')
						WHEN "UpperThresholdType" = 'Absolute' THEN  CONCAT("UpperThresholdValue",'UCL')
						ELSE 'No UCL'
					END))
		INTO "lvThresholdInfo"
		FROM fda."FDAAlertRules"
		WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
		
	ELSE IF LOWER("lvThresholdType") = 'customize'	
	THEN 
	
		SELECT STRING_AGG("ThresholdInfo",'(^)') 
		INTO "lvThresholdInfo"
		FROM(SELECT DISTINCT 
					(CASE 
						WHEN  SUM("Count") OVER (PARTITION BY "Position") > 1 THEN "Position"||'(~)'||'Customized Rule'
						WHEN SUM("Count") OVER (PARTITION BY "Position") = 1 THEN  
								COALESCE("Position",0)||'(~)'|| CONCAT((CASE 
																WHEN  "LowerThresholdType" = 'Percentage' THEN CONCAT("LowerThresholdValue",'% LCL')
																WHEN  "LowerThresholdType" = 'StandardDeviation' THEN CONCAT("LowerThresholdValue",'σ LCL')
																WHEN  "LowerThresholdType" = 'Absolute' THEN  CONCAT("LowerThresholdValue",' LCL')
																ELSE 'No LCL' 
															END),
																'-',
															(CASE 
																WHEN  "UpperThresholdType" = 'Percentage' THEN CONCAT("UpperThresholdValue",'% UCL')
																WHEN  "UpperThresholdType" = 'StandardDeviation' THEN CONCAT("UpperThresholdValue",'σ UCL')
																WHEN  "UpperThresholdType" = 'Absolute' THEN  CONCAT("UpperThresholdValue",' UCL')
																ELSE 'No UCL'
															END))
						ELSE 'No LCL - No UCL'
					END) "ThresholdInfo"
						
			FROM(SELECT COUNT(*) AS "Count",
						"FDAAlertRulesTargetColumnId",
						"Position",
						"LowerThresholdType",
						"LowerThresholdValue",
						"UpperThresholdType",
						"UpperThresholdValue"
				FROM fda."FDAAlertRulesCustomizedColumnThreshold"
				WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
				GROUP BY "FDAAlertRulesTargetColumnId","Position","LowerThresholdType","LowerThresholdValue","UpperThresholdType","UpperThresholdValue"
				ORDER BY "Position"
				)X
			)Y;
	
END IF;
END IF;	

RAISE NOTICE 'lvThresholdInfo %',"lvThresholdInfo";

	SELECT COUNT(*)
	INTO "lvColumnCount"
	FROM fda."FDAAlertRulesTargetColumn"
	WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
	AND "Status" = 'true';

	SELECT  COUNT(a."FDAAlertOutputId")
	INTO "AlertRunCount"
	FROM fda."FDAAlertOutputSecondary" a,
		fda."FDAAlertRules" b
	WHERE a."FDAAlertRulesId" =  b."FDAAlertRulesId"
		AND b."FDAAlertRulesId" = "InFDAAlertRulesId"
		AND a."SegmentValue" = "InSegmentValues"
		AND COALESCE(a."IgnoreAlertInd",'') = ''
		AND "CurrentAlertStatus" != 'PENDING'
		AND CAST(a."UpdatedDateTime" AS DATE) >= CAST(b."NewBaseLineDateTime" AS DATE)
		AND CAST(a."UpdatedDateTime" AS TIME) > CAST(b."NewBaseLineDateTime" AS TIME);
		
		
	SELECT "AlertTypeCategory",
			"BaseLineValueType",
		CAST(COALESCE("BaseLineValue",'1') AS BIGINT),
		"AllowNewSegmentInd",
		(SELECT "SystemType" FROM fda."FDASystems"
		WHERE "FDASystemsId" = "FDASystemTargeteId")
	INTO "lvAlertTypeCategory",
		"lvBaseLineInd",
		"lvBaseLineValue",
		"lvAllowNewSegmentInd",
		"lvTargetSystemType"
	FROM fda."FDAAlertRules"
	WHERE "FDAAlertRulesId" = "InFDAAlertRulesId";
	
	
	SELECT "FDAAlertOutputId"
	INTO "lvPreviousAlertRulesRunId"
	FROM(SELECT "FDAAlertOutputId",RANK() OVER (ORDER BY "FDAAlertOutputId" DESC) "RANK" 
	FROM (SELECT DISTINCT "FDAAlertOutputId"		        
		    FROM fda."FDAAlertOutputSecondary"
            WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
			AND "SegmentValue" = "InSegmentValues") x
			)y
    WHERE "RANK" = 2;
	
	SELECT "FDAAlertOutputId" 
	INTO "lvPreviousAlertRulesRunIdTarget"
    FROM (SELECT "FDAAlertOutputId",
			RANK() OVER (ORDER BY "FDAAlertOutputId" DESC) "RANK"
		FROM(SELECT DISTINCT "FDAAlertOutputId"
		    FROM fda."FDAAlertOutputSecondary"
            WHERE "FDAAlertRulesId" ="InFDAAlertRulesId"
			AND "SegmentValue" = "InSegmentValues"
		 	ORDER BY "FDAAlertOutputId" DESC) x
		  )y
		  WHERE "RANK" = 2;
	
	
	
	SELECT "AlertInd","ConfirmedByUser","ReconciliationDate" 
	INTO 
	"lvAlertInd",
	"lvConfirmedByUser",
	"lvReconciliationDate"
	FROM fda."FDAAlertOutputSecondary" 
	WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
	AND "FDAAlertOutputId" = "lvPreviousAlertRulesRunIdTarget"
	AND "SegmentValue" = "InSegmentValues";
	
	IF "lvAlertInd" = 'Y' AND COALESCE("lvConfirmedByUser",'') = '' AND "lvReconciliationDate" :: DATE > current_date - INTERVAL '3 day' 
	THEN 
		RAISE NOTICE 'Value: % ','RED BLOCK';
		SELECT MAX("FDAAlertOutputId")
		INTO "lvPreviousAlertRulesRunIdTarget"
		FROM fda."FDAAlertOutputSecondary"
		WHERE  "FDAAlertRulesId" = "InFDAAlertRulesId"
		AND "SegmentValue" = "InSegmentValues"
		AND "Severity" = 9;
	ELSE IF "lvAlertInd" = 'N' AND COALESCE("lvConfirmedByUser",'') = 'N' AND "lvReconciliationDate" :: DATE > current_date - INTERVAL '3 day' 
	THEN 
		RAISE NOTICE 'Value: % ','GREEN BLOCK';
		SELECT "FDAAlertOutputId"
		INTO "lvPreviousAlertRulesRunIdTarget"
		FROM(SELECT "FDAAlertOutputId",RANK() OVER (ORDER BY "FDAAlertOutputId" DESC) "RANK" 
			FROM (SELECT DISTINCT"FDAAlertOutputId"
					FROM fda."FDAAlertOutputSecondary"
				WHERE "FDAAlertRulesId" = "InFDAAlertRulesId") x
			)y
		WHERE "RANK" = 2;
		
	END IF;
	END IF;
RAISE NOTICE 'lvColumnCount: % ',"lvColumnCount";
RAISE NOTICE 'lvThresholdType: % ',"lvThresholdType";
RAISE NOTICE 'AlertRunCount: % ',"AlertRunCount";
RAISE NOTICE 'lvBaseLineInd: % ',"lvBaseLineInd";
RAISE NOTICE 'lvThresholdType: % ',"lvThresholdType";
RAISE NOTICE 'lvBaseLineValue: % ',"lvBaseLineValue";
RAISE NOTICE 'lvAlertInd: % ',"lvAlertInd";
RAISE NOTICE 'lvConfirmedByUser: % ',"lvConfirmedByUser";
RAISE NOTICE 'lvReconciliationDate: % ',"lvReconciliationDate";
RAISE NOTICE 'lvPreviousAlertRulesRunIdTarget: % ',"lvPreviousAlertRulesRunIdTarget";
	
IF "lvAlertTypeCategory" = 'ADVANCED'
THEN
RAISE NOTICE 'Value: % ','Beginning ADVANCED';

----------------------------------------------------------------- Beginning ADVANCED ------------------------------------------------------------------------

IF "InSourceValue" = '' AND "InTargetValue" = ''  --If There is no Source and Target Data
THEN
RAISE NOTICE 'Value: % ','NO DATA';

INSERT INTO fda."FDAAlertOutputByAdvancedSegmentLevel2"		
		 ( 
		   "FDAAlertOutputId",
           "FDAAlertRulesId",
		   "SegmentValues",
           "SourceSegment1",
           "SourceSegment2",
           "SourceSegment3",
           "SourceSegment4",
           "SourceSegment5",
           "TargetSegment1",
           "TargetSegment2",
           "TargetSegment3",
           "TargetSegment4",
           "TargetSegment5",
           "SourceValue1",
           "TargetValue1",
           "ColorBasedoThreasold1",
           "SourceValue2",
           "TargetValue2",
           "ColorBasedoThreasold2",
           "SourceValue3",
           "TargetValue3",
           "ColorBasedoThreasold3",
           "SourceValue4",
           "TargetValue4",
           "ColorBasedoThreasold4",
           "SourceValue5",
           "TargetValue5",
		   "ColorBasedoThreasold5",
		   "SourceValue6",
           "TargetValue6",
		   "ColorBasedoThreasold6",
		   "SourceValue7",
           "TargetValue7",
		   "ColorBasedoThreasold7",
		   "SourceValue8",
           "TargetValue8",
		   "ColorBasedoThreasold8",
		   "SourceValue9",
           "TargetValue9",
		   "ColorBasedoThreasold9",
		   "SourceValue10",
           "TargetValue10",
		   "ColorBasedoThreasold10",
		   "SourceValue11",
           "TargetValue11",
		   "ColorBasedoThreasold11",
		   "SourceValue12",
           "TargetValue12",
		   "ColorBasedoThreasold12",
		   "SourceValue13",
           "TargetValue13",
		   "ColorBasedoThreasold13",
		   "SourceValue14",
           "TargetValue14",
		   "ColorBasedoThreasold14",
		   "SourceValue15",
           "TargetValue15",
		   "ColorBasedoThreasold15",
		   "SourceValue16",
           "TargetValue16",
		   "ColorBasedoThreasold16",
		   "SourceValue17",
           "TargetValue17",
		   "ColorBasedoThreasold17",
		   "SourceValue18",
           "TargetValue18",
		   "ColorBasedoThreasold18",
		   "SourceValue19",
           "TargetValue19",
		   "ColorBasedoThreasold19",
		   "SourceValue20",
           "TargetValue20",		   
           "ColorBasedoThreasold20",
           "Threshold",
           "ReconciliationDate",
           "ReconciliationTime",
           "CreatedDateTime",
           "UpdatedDateTime",
           "UpdatedBy"
		 )
	SELECT  "InFDAAlertRulesRunId",--FDAAlertOutputId
		    a."FDAAlertRulesId",    --FDAAlertRulesId
			"InSegmentValues",
		    'TOTAL',   --SourceSegment1
			'TOTAL',   --SourceSegment2
			'TOTAL',   --SourceSegment3
			'TOTAL',   --SourceSegment4
			'TOTAL',   --SourceSegment5
			'TOTAL',   --TargetSegment1
			'TOTAL',   --TargetSegment2
			'TOTAL',   --TargetSegment3
			'TOTAL',   --TargetSegment4
			'TOTAL',   --TargetSegment5
		    0,    --SourceValue1
		    0,    --TargetValue1
		    1,    --ColorBasedoThreasold1
			0,    --SourceValue2
		    0,    --TargetValue2
		    1,    --ColorBasedoThreasold2
			0,    --SourceValue3
		    0,    --TargetValue3
		    1,    --ColorBasedoThreasold3
			0,    --SourceValue4
		    0,    --TargetValue4
		    1,    --ColorBasedoThreasold4
			0,    --SourceValue5
		    0,    --TargetValue5
		    1,    --ColorBasedoThreasold5
			0,	  ----SourceValue6
			0,    --TargetValue6
			1,    --ColorBasedoThreasold6
			0,    --SourceValue7
			0,    --TargetValue7
			1,    --ColorBasedoThreasold7
			0,    --SourceValue8
			0,    --TargetValue8
			1,    --ColorBasedoThreasold8
			0,    --SourceValue9
			0,    --TargetValue9
			1,    --ColorBasedoThreasold9
			0,    --SourceValue10
			0,    --TargetValue10
			1,    --ColorBasedoThreasold10
			0,    --SourceValue11
			0,    --TargetValue11
			1,    --ColorBasedoThreasold11
			0,    --SourceValue12
			0,    --TargetValue12
			1,    --ColorBasedoThreasold12
			0,    --SourceValue13
			0,    --TargetValue13
			1,    --ColorBasedoThreasold13
			0,    --SourceValue14
			0,    --TargetValue14
			1,    --ColorBasedoThreasold14
			0,    --SourceValue15
			0,    --TargetValue15
			1,    --ColorBasedoThreasold15
			0,    --SourceValue16
			0,    --TargetValue16
			1,    --ColorBasedoThreasold16
			0,    --SourceValue17
			0,    --TargetValue17
			1,    --ColorBasedoThreasold17
			0,    --SourceValue18
			0,    --TargetValue18
			1,    --ColorBasedoThreasold18
			0,    --SourceValue19
			0,    --TargetValue19
			1,    --ColorBasedoThreasold19
			0,    --SourceValue20
			0,    --TargetValue20		   
			1,	  --ColorBasedoThreasold20
		    CAST(a."LowerThresholdValue" AS NUMERIC(17,6))
			,CURRENT_DATE --ReconciliationDate
			,TO_CHAR(CURRENT_TIMESTAMP, 'hh12:mi') -- ReconciliationTime
			,CURRENT_TIMESTAMP -- CreatedDateTime
			,CURRENT_TIMESTAMP --UpdatedDateTime
			,a."UpdatedBy"
   FROM fda."FDAAlertRules" a
WHERE a."FDAAlertRulesId" = "InFDAAlertRulesId" ;

"lvSeverity" := (SELECT LEAST(MIN("ColorBasedoThreasold1"),
                               MIN("ColorBasedoThreasold2"),
			                   MIN("ColorBasedoThreasold3"),
							   MIN("ColorBasedoThreasold4"),
			                   MIN("ColorBasedoThreasold5"),
							   MIN("ColorBasedoThreasold6"),
							   MIN("ColorBasedoThreasold7"),
							   MIN("ColorBasedoThreasold8"),
							   MIN("ColorBasedoThreasold9"),
							   MIN("ColorBasedoThreasold10"),
							   MIN("ColorBasedoThreasold11"),
							   MIN("ColorBasedoThreasold12"),
							   MIN("ColorBasedoThreasold13"),
							   MIN("ColorBasedoThreasold14"),
							   MIN("ColorBasedoThreasold15"),
							   MIN("ColorBasedoThreasold16"),
							   MIN("ColorBasedoThreasold17"),
							   MIN("ColorBasedoThreasold18"),
							   MIN("ColorBasedoThreasold19"),
							   MIN("ColorBasedoThreasold20"))
	             FROM fda."FDAAlertOutputByAdvancedSegmentLevel2" 
                 WHERE "FDAAlertOutputId" = "InFDAAlertRulesRunId"
				   AND "SegmentValues" = "InSegmentValues"
				   AND "TargetSegment1" NOT IN (SELECT "TargetSegmentValue1" 
	                                            FROM fda."FDAAlertRulesTargetSegmentValue"
									            WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
									              AND "CheckedStatus" != 'true'));

-- Update the alert Severity with status to COMPLETE
RAISE NOTICE 'SegmentCount: % ',"InSegmentCount";
RAISE NOTICE 'SourceSegmentCount: % ',NULLIF(SPLIT_PART("InSegmentCount",'|',1),'')::bigint;
RAISE NOTICE 'TargetSegmentCount: % ',NULLIF(SPLIT_PART("InSegmentCount",'|',2),'')::bigint;
RAISE NOTICE 'UTTAM: % ',"lvThresholdInfo";

	UPDATE fda."FDAAlertOutputSecondary"	
	SET "CurrentAlertStatus" = 'COMPLETE',
	    "Severity" = COALESCE("lvSeverity",9),
		"AlertInd" = (CASE WHEN "lvSeverity" IN (1,2) THEN 'Y' ELSE 'N' END),
		"SourceSegmentCount" = NULLIF(SPLIT_PART("InSegmentCount",'|',1),'')::bigint,
		"TargetSegmentCount" = NULLIF(SPLIT_PART("InSegmentCount",'|',2),'')::bigint,
	    "UpdatedDateTime" = CURRENT_TIMESTAMP,
        "UpdatedBy" = CURRENT_USER,
		"ThresholdType" = "lvThresholdType",
		"ThresholdInfo" = "lvThresholdInfo"
		--"AlertStatus" = (CASE WHEN "lvSeverity" IN (1,2) THEN 'Open'
							--ELSE 'AllOk' END)
	WHERE "FDAAlertRulesId" =  "InFDAAlertRulesId"
	AND "FDAAlertOutputId" = "InFDAAlertRulesRunId"
	AND  "SegmentValue" = "InSegmentValues";
	
	
UPDATE fda."FDAAlertOutputByAdvancedSegmentLevel2"-------ALERT COLUMN AND SEGMENT DATA
SET "SegmentInfo" = "lvSegmentInfo",
	"ColumnInfo" = "lvColumnInfo"
WHERE "FDAAlertOutputId" = "InFDAAlertRulesRunId"
AND "FDAAlertRulesId" = "InFDAAlertRulesId"
AND "SegmentValues" = "InSegmentValues";

RAISE NOTICE 'Column Data: % ','ALERT COLUMN AND SEGMENT DATA INSERTED';

	IF "lvSeverity" = 1
	THEN
		  "OutAlertStatus" := 'CRITICAL';
		   "OutSeverity" := '1';
	
    ELSE IF "lvSeverity" = 2
	THEN
		 "OutAlertStatus" := 'MEDIUM CRITICAL';
		 "OutSeverity" := '2';
	
	ELSE IF ("lvSeverity" != 1 AND "lvSeverity" != 2 )
	THEN
		 "OutAlertStatus" := 'OK';
		 "OutSeverity" := '9';
	END IF;
   END IF;
  END IF;

ELSE

IF STRPOS("InSourceValue",'=') = 0 AND STRPOS("InTargetValue",'=') = 0
THEN
 "InSourceValue" := 'TOTAL=';
 "InTargetValue" := 'TOTAL=';
END IF;

IF "lvAlertType" = 'SourceTargetCount' OR "lvAlertType" = 'SourceTargetValue' AND "lvTargetSystemType" != 'SAPBW'-- Source Target Comparison
THEN

RAISE NOTICE 'Value: % ','Source And Target Comparison';
RAISE NOTICE 'Value: % ','TargetSystemType != "lvTargetSystemType"';

INSERT INTO fda."FDAAlertOutputByAdvancedSegmentLevel2"	
		 ( 
		   "FDAAlertOutputId",
           "FDAAlertRulesId",
		   "SegmentValues",
           "SourceSegment1",
           "SourceSegment2",
           "SourceSegment3",
           "SourceSegment4",
           "SourceSegment5",
           "TargetSegment1",
           "TargetSegment2",
           "TargetSegment3",
           "TargetSegment4",
           "TargetSegment5",
           "SourceValue1",
           "TargetValue1",
           "ColorBasedoThreasold1",
           "SourceValue2",
           "TargetValue2",
           "ColorBasedoThreasold2",
           "SourceValue3",
           "TargetValue3",
           "ColorBasedoThreasold3",
           "SourceValue4",
           "TargetValue4",
           "ColorBasedoThreasold4",
           "SourceValue5",
           "TargetValue5",
           "ColorBasedoThreasold5",
		   "SourceValue6",
           "TargetValue6",
		   "ColorBasedoThreasold6",
		   "SourceValue7",
           "TargetValue7",
		   "ColorBasedoThreasold7",
		   "SourceValue8",
           "TargetValue8",
		   "ColorBasedoThreasold8",
		   "SourceValue9",
           "TargetValue9",
		   "ColorBasedoThreasold9",
		   "SourceValue10",
           "TargetValue10",
		   "ColorBasedoThreasold10",
		   "SourceValue11",
           "TargetValue11",
		   "ColorBasedoThreasold11",
		   "SourceValue12",
           "TargetValue12",
		   "ColorBasedoThreasold12",
		   "SourceValue13",
           "TargetValue13",
		   "ColorBasedoThreasold13",
		   "SourceValue14",
           "TargetValue14",
		   "ColorBasedoThreasold14",
		   "SourceValue15",
           "TargetValue15",
		   "ColorBasedoThreasold15",
		   "SourceValue16",
           "TargetValue16",
		   "ColorBasedoThreasold16",
		   "SourceValue17",
           "TargetValue17",
		   "ColorBasedoThreasold17",
		   "SourceValue18",
           "TargetValue18",
		   "ColorBasedoThreasold18",
		   "SourceValue19",
           "TargetValue19",
		   "ColorBasedoThreasold19",
		   "SourceValue20",
           "TargetValue20",		   
           "ColorBasedoThreasold20",		   
           "Threshold",
		   "AlertLifeCycleStatus",
           "ReconciliationDate",
           "ReconciliationTime",
           "CreatedDateTime",
           "UpdatedDateTime",
           "UpdatedBy"
		 )
		 SELECT 
		 	 "InFDAAlertRulesRunId"
			,"InFDAAlertRulesId"
			,"InSegmentValues"
			,TOTAL."SourceSegment1"
			,TOTAL."SourceSegment2"
			,TOTAL."SourceSegment3"
			,TOTAL."SourceSegment4"
			,TOTAL."SourceSegment5"
			,TOTAL."TargetSegment1"
			,TOTAL."TargetSegment2"
			,TOTAL."TargetSegment3"
			,TOTAL."TargetSegment4"
			,TOTAL."TargetSegment5"
			,TOTAL."SourceValue1"
            ,TOTAL."TargetValue1"
            ,(CASE 
				WHEN 1 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue1" = TOTAL."TargetValue1" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue1",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue1",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						1                    	--ColumnOrder
					)
				END ) "ColorBasedoThreasold1"
            ,TOTAL."SourceValue2"
            ,TOTAL."TargetValue2"
            ,(CASE 
				WHEN 2 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue2" = TOTAL."TargetValue2" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue2",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue2",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						2                    	--ColumnOrder
					)
				END )"ColorBasedoThreasold2"
            ,TOTAL."SourceValue3"
            ,TOTAL."TargetValue3"
            ,(CASE 
				WHEN 3 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue3" = TOTAL."TargetValue3" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue3",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue3",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						3                   	--ColumnOrder
					)
				END) "ColorBasedoThreasold3"
            ,TOTAL."SourceValue4"
            ,TOTAL."TargetValue4"
            ,(CASE 
				WHEN 4 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue4" = TOTAL."TargetValue4" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue4",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue4",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						4                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold4"
            ,TOTAL."SourceValue5"
            ,TOTAL."TargetValue5"
            ,(CASE 
				WHEN 5 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue5" = TOTAL."TargetValue5" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue5",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue5",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						5                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold5"
			,TOTAL."SourceValue6"
			,TOTAL."TargetValue6"
			,(CASE 
				WHEN 6 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue6" = TOTAL."TargetValue6" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue6",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue6",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						6                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold6"
			,TOTAL."SourceValue7"
			,TOTAL."TargetValue7"
			,(CASE 
				WHEN 7 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue7" = TOTAL."TargetValue7" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue7",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue7",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						7                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold7"	
			,TOTAL."SourceValue8"
			,TOTAL."TargetValue8"
			,(CASE 
				WHEN 8 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue8" = TOTAL."TargetValue8" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue8",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue8",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						8                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold8"
			,TOTAL."SourceValue9"
			,TOTAL."TargetValue9"
			,(CASE 
				WHEN 9 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue9" = TOTAL."TargetValue9" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue9",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue9",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						9                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold9"
			,TOTAL."SourceValue10"
			,TOTAL."TargetValue10"
			,(CASE 
				WHEN 10 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue10" = TOTAL."TargetValue10" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue10",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue10",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						10                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold10"
			,TOTAL."SourceValue11"
			,TOTAL."TargetValue11"
			,(CASE 
				WHEN 11 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue11" = TOTAL."TargetValue11" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue11",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue11",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						11                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold11"
			,TOTAL."SourceValue12"
			,TOTAL."TargetValue12"
			,(CASE 
				WHEN 12 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue12" = TOTAL."TargetValue12" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue12",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue12",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						12                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold12"
			,TOTAL."SourceValue13"
			,TOTAL."TargetValue13"
			,(CASE 
				WHEN 13 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue13" = TOTAL."TargetValue13" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue13",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue13",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						13                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold13"
			,TOTAL."SourceValue14"
			,TOTAL."TargetValue14"
			,(CASE 
				WHEN 14 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue14" = TOTAL."TargetValue14" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue14",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue14",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						14                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold14"
			,TOTAL."SourceValue15"
			,TOTAL."TargetValue15"
			,(CASE 
				WHEN 15 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue15" = TOTAL."TargetValue15" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue15",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue15",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						15                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold15"
			,TOTAL."SourceValue16"
			,TOTAL."TargetValue16"
			,(CASE 
				WHEN 16 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue16" = TOTAL."TargetValue16" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue16",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue16",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						16                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold16"
			,TOTAL."SourceValue17"
			,TOTAL."TargetValue17"
			,(CASE 
				WHEN 17 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue17" = TOTAL."TargetValue17" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue17",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue17",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						17                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold17"
			,TOTAL."SourceValue18"
			,TOTAL."TargetValue18"
			,(CASE 
				WHEN 18 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue18" = TOTAL."TargetValue18" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue18",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue18",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						18                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold18"
			,TOTAL."SourceValue19"
			,TOTAL."TargetValue19"
			,(CASE 
				WHEN 19 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue19" = TOTAL."TargetValue19" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue19",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue19",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						19                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold19"
			,TOTAL."SourceValue20"
			,TOTAL."TargetValue20"
			,(CASE 
				WHEN 20 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue20" = TOTAL."TargetValue20" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue20",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue20",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						20                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold20"		
            ,ABS(TOTAL."Threshold")
			,'OPEN'
			,CURRENT_DATE
			,TO_CHAR(CURRENT_TIMESTAMP, 'hh12:mi AM') -- ReconciliationTime
			,CURRENT_TIMESTAMP --CreatedDateTime
			,CURRENT_TIMESTAMP --UpdatedDateTime
			,TOTAL."UpdatedBy"
		FROM 
		 (SELECT 
			 SPLIT_PART(SourceTargetComparison."SourceSegmentName",'^',1) "SourceSegment1",
		     SPLIT_PART(SourceTargetComparison."SourceSegmentName",'^',2) "SourceSegment2",
		     SPLIT_PART(SourceTargetComparison."SourceSegmentName",'^',3) "SourceSegment3",
		     SPLIT_PART(SourceTargetComparison."SourceSegmentName",'^',4) "SourceSegment4",
		     SPLIT_PART(SourceTargetComparison."SourceSegmentName",'^',5) "SourceSegment5",
		  
			 SPLIT_PART(SourceTargetComparison."TargetSegmentName",'^',1) "TargetSegment1"
		    ,SPLIT_PART(SourceTargetComparison."TargetSegmentName",'^',2) "TargetSegment2"
		    ,SPLIT_PART(SourceTargetComparison."TargetSegmentName",'^',3) "TargetSegment3"  
		    ,SPLIT_PART(SourceTargetComparison."TargetSegmentName",'^',4) "TargetSegment4"
		    ,SPLIT_PART(SourceTargetComparison."TargetSegmentName",'^',5) "TargetSegment5" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',1),''),'0') AS NUMERIC(36,11)) "SourceValue1" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',1),''),'0') AS NUMERIC(36,11)) "TargetValue1" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',2),''),'0') AS NUMERIC(36,11)) "SourceValue2" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',2),''),'0') AS NUMERIC(36,11)) "TargetValue2" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',3),''),'0') AS NUMERIC(36,11)) "SourceValue3" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',3),''),'0') AS NUMERIC(36,11)) "TargetValue3" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',4),''),'0') AS NUMERIC(36,11)) "SourceValue4"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',4),''),'0') AS NUMERIC(36,11)) "TargetValue4" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',5),''),'0') AS NUMERIC(36,11)) "SourceValue5" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',5),''),'0') AS NUMERIC(36,11)) "TargetValue5"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',6),''),'0') AS NUMERIC(36,11)) "SourceValue6" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',6),''),'0') AS NUMERIC(36,11)) "TargetValue6"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',7),''),'0') AS NUMERIC(36,11)) "SourceValue7" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',7),''),'0') AS NUMERIC(36,11)) "TargetValue7"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',8),''),'0') AS NUMERIC(36,11)) "SourceValue8" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',8),''),'0') AS NUMERIC(36,11)) "TargetValue8"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',9),''),'0') AS NUMERIC(36,11)) "SourceValue9" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',9),''),'0') AS NUMERIC(36,11)) "TargetValue9"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',10),''),'0') AS NUMERIC(36,11)) "SourceValue10" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',10),''),'0') AS NUMERIC(36,11)) "TargetValue10"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',11),''),'0') AS NUMERIC(36,11)) "SourceValue11" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',11),''),'0') AS NUMERIC(36,11)) "TargetValue11"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',12),''),'0') AS NUMERIC(36,11)) "SourceValue12" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',12),''),'0') AS NUMERIC(36,11)) "TargetValue12"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',13),''),'0') AS NUMERIC(36,11)) "SourceValue13" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',13),''),'0') AS NUMERIC(36,11)) "TargetValue13"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',14),''),'0') AS NUMERIC(36,11)) "SourceValue14" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',14),''),'0') AS NUMERIC(36,11)) "TargetValue14"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',15),''),'0') AS NUMERIC(36,11)) "SourceValue15" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',15),''),'0') AS NUMERIC(36,11)) "TargetValue15"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',16),''),'0') AS NUMERIC(36,11)) "SourceValue16" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',16),''),'0') AS NUMERIC(36,11)) "TargetValue16"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',17),''),'0') AS NUMERIC(36,11)) "SourceValue17" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',17),''),'0') AS NUMERIC(36,11)) "TargetValue17"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',18),''),'0') AS NUMERIC(36,11)) "SourceValue18" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',18),''),'0') AS NUMERIC(36,11)) "TargetValue18"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',19),''),'0') AS NUMERIC(36,11)) "SourceValue19" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',19),''),'0') AS NUMERIC(36,11)) "TargetValue19"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',20),''),'0') AS NUMERIC(36,11)) "SourceValue20" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',20),''),'0') AS NUMERIC(36,11)) "TargetValue20"
           ,CAST(a."LowerThresholdValue" AS NUMERIC(17,6)) "Threshold"
		   ,a."UpdatedBy"
		   ,a."BaseLineValueType",							-- "LastValue" or " Last 10 Run"
			a."UpperThresholdType",							-- Percentage or Absolute or Standard Deviation
			a."LowerThresholdType",							-- Percentage or Absolute or Standard Deviation
			a."UpperThresholdValue",						-- 1% or 1000 or 1 SD
			a."LowerThresholdValue"
		FROM fda."FDAAlertRules" a
		
		CROSS JOIN 
			(SELECT "SourceSegmentName",
				    "TargetSegmentName",
				    "SourceValue",
				    "TargetValue"
			FROM (SELECT "VALUE",
						 LEFT("VALUE",STRPOS("VALUE",'=')-1) "SourceSegmentName",
						 (CASE WHEN RIGHT("VALUE",LENGTH("VALUE") - STRPOS("VALUE",'=')) > '' 
							THEN RIGHT("VALUE",LENGTH("VALUE") - STRPOS("VALUE",'=')) 
						    ELSE '0' 
						  END) "SourceValue"
						FROM unnest(string_to_array("InSourceValue" ,'~')) "VALUE"
		         WHERE "VALUE" IS NOT NULL) SourceSegmentValue

		FULL JOIN 

				(SELECT "VALUE",
						 LEFT("VALUE",STRPOS("VALUE",'=')-1) "TargetSegmentName",
						 (CASE WHEN RIGHT("VALUE",LENGTH("VALUE")-STRPOS("VALUE",'=')) > '' 
							THEN RIGHT("VALUE",LENGTH("VALUE")-STRPOS("VALUE",'=')) 
						    ELSE '0'
						 END) "TargetValue"
						FROM UNNEST(STRING_TO_ARRAY("InTargetValue" ,'~')) "VALUE"
		         WHERE "VALUE" IS NOT NULL) TargetSegmentDetails

	 ON SourceSegmentValue."SourceSegmentName" = TargetSegmentDetails."TargetSegmentName"
		) SourceTargetComparison
	WHERE a."FDAAlertRulesId" = "InFDAAlertRulesId") TOTAL;
ELSE IF "lvAlertType" = 'SourceTargetCount' OR "lvAlertType" = 'SourceTargetValue' AND  "lvTargetSystemType" = 'SAPBW'-- Source Target Comparison
THEN

RAISE NOTICE 'Value: % ','Source And Target Comparison';
RAISE NOTICE 'Value: % ','TargetSystemType = "lvTargetSystemType"';

INSERT INTO fda."FDAAlertOutputByAdvancedSegmentLevel2"	
		 ( 
		   "FDAAlertOutputId",
           "FDAAlertRulesId",
		   "SegmentValues",
           "SourceSegment1",
           "SourceSegment2",
           "SourceSegment3",
           "SourceSegment4",
           "SourceSegment5",
           "TargetSegment1",
           "TargetSegment2",
           "TargetSegment3",
           "TargetSegment4",
           "TargetSegment5",
           "SourceValue1",
           "TargetValue1",
           "ColorBasedoThreasold1",
           "SourceValue2",
           "TargetValue2",
           "ColorBasedoThreasold2",
           "SourceValue3",
           "TargetValue3",
           "ColorBasedoThreasold3",
           "SourceValue4",
           "TargetValue4",
           "ColorBasedoThreasold4",
           "SourceValue5",
           "TargetValue5",
           "ColorBasedoThreasold5",
		   "SourceValue6",
           "TargetValue6",
		   "ColorBasedoThreasold6",
		   "SourceValue7",
           "TargetValue7",
		   "ColorBasedoThreasold7",
		   "SourceValue8",
           "TargetValue8",
		   "ColorBasedoThreasold8",
		   "SourceValue9",
           "TargetValue9",
		   "ColorBasedoThreasold9",
		   "SourceValue10",
           "TargetValue10",
		   "ColorBasedoThreasold10",
		   "SourceValue11",
           "TargetValue11",
		   "ColorBasedoThreasold11",
		   "SourceValue12",
           "TargetValue12",
		   "ColorBasedoThreasold12",
		   "SourceValue13",
           "TargetValue13",
		   "ColorBasedoThreasold13",
		   "SourceValue14",
           "TargetValue14",
		   "ColorBasedoThreasold14",
		   "SourceValue15",
           "TargetValue15",
		   "ColorBasedoThreasold15",
		   "SourceValue16",
           "TargetValue16",
		   "ColorBasedoThreasold16",
		   "SourceValue17",
           "TargetValue17",
		   "ColorBasedoThreasold17",
		   "SourceValue18",
           "TargetValue18",
		   "ColorBasedoThreasold18",
		   "SourceValue19",
           "TargetValue19",
		   "ColorBasedoThreasold19",
		   "SourceValue20",
           "TargetValue20",		   
           "ColorBasedoThreasold20",		   
           "Threshold",
		   "AlertLifeCycleStatus",
           "ReconciliationDate",
           "ReconciliationTime",
           "CreatedDateTime",
           "UpdatedDateTime",
           "UpdatedBy"
		 )
		 SELECT 
		 	 "InFDAAlertRulesRunId"
			,"InFDAAlertRulesId"
			,"InSegmentValues"
			,TOTAL."SourceSegment1"
			,TOTAL."SourceSegment2"
			,TOTAL."SourceSegment3"
			,TOTAL."SourceSegment4"
			,TOTAL."SourceSegment5"
			,TOTAL."TargetSegment1"
			,TOTAL."TargetSegment2"
			,TOTAL."TargetSegment3"
			,TOTAL."TargetSegment4"
			,TOTAL."TargetSegment5"
			,TOTAL."SourceValue1"
            ,TOTAL."TargetValue1"
            ,(CASE 
				WHEN 1 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue1" = TOTAL."TargetValue1" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue1",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue1",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						1                    	--ColumnOrder
					)
				END ) "ColorBasedoThreasold1"
            ,TOTAL."SourceValue2"
            ,TOTAL."TargetValue2"
            ,(CASE 
				WHEN 2 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue2" = TOTAL."TargetValue2" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue2",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue2",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						2                    	--ColumnOrder
					)
				END )"ColorBasedoThreasold2"
            ,TOTAL."SourceValue3"
            ,TOTAL."TargetValue3"
            ,(CASE 
				WHEN 3 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue3" = TOTAL."TargetValue3" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue3",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue3",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						3                   	--ColumnOrder
					)
				END) "ColorBasedoThreasold3"
            ,TOTAL."SourceValue4"
            ,TOTAL."TargetValue4"
            ,(CASE 
				WHEN 4 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue4" = TOTAL."TargetValue4" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue4",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue4",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						4                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold4"
            ,TOTAL."SourceValue5"
            ,TOTAL."TargetValue5"
            ,(CASE 
				WHEN 5 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue5" = TOTAL."TargetValue5" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue5",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue5",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						5                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold5"
			,TOTAL."SourceValue6"
			,TOTAL."TargetValue6"
			,(CASE 
				WHEN 6 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue6" = TOTAL."TargetValue6" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue6",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue6",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						6                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold6"
			,TOTAL."SourceValue7"
			,TOTAL."TargetValue7"
			,(CASE 
				WHEN 7 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue7" = TOTAL."TargetValue7" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue7",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue7",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						7                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold7"	
			,TOTAL."SourceValue8"
			,TOTAL."TargetValue8"
			,(CASE 
				WHEN 8 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue8" = TOTAL."TargetValue8" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue8",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue8",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						8                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold8"
			,TOTAL."SourceValue9"
			,TOTAL."TargetValue9"
			,(CASE 
				WHEN 9 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue9" = TOTAL."TargetValue9" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue9",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue9",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						9                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold9"
			,TOTAL."SourceValue10"
			,TOTAL."TargetValue10"
			,(CASE 
				WHEN 10 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue10" = TOTAL."TargetValue10" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue10",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue10",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						10                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold10"
			,TOTAL."SourceValue11"
			,TOTAL."TargetValue11"
			,(CASE 
				WHEN 11 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue11" = TOTAL."TargetValue11" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue11",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue11",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						11                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold11"
			,TOTAL."SourceValue12"
			,TOTAL."TargetValue12"
			,(CASE 
				WHEN 12 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue12" = TOTAL."TargetValue12" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue12",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue12",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						12                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold12"
			,TOTAL."SourceValue13"
			,TOTAL."TargetValue13"
			,(CASE 
				WHEN 13 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue13" = TOTAL."TargetValue13" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue13",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue13",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						13                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold13"
			,TOTAL."SourceValue14"
			,TOTAL."TargetValue14"
			,(CASE 
				WHEN 14 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue14" = TOTAL."TargetValue14" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue14",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue14",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						14                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold14"
			,TOTAL."SourceValue15"
			,TOTAL."TargetValue15"
			,(CASE 
				WHEN 15 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue15" = TOTAL."TargetValue15" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue15",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue15",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						15                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold15"
			,TOTAL."SourceValue16"
			,TOTAL."TargetValue16"
			,(CASE 
				WHEN 16 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue16" = TOTAL."TargetValue16" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue16",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue16",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						16                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold16"
			,TOTAL."SourceValue17"
			,TOTAL."TargetValue17"
			,(CASE 
				WHEN 17 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue17" = TOTAL."TargetValue17" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue17",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue17",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						17                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold17"
			,TOTAL."SourceValue18"
			,TOTAL."TargetValue18"
			,(CASE 
				WHEN 18 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue18" = TOTAL."TargetValue18" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue18",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue18",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						18                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold18"
			,TOTAL."SourceValue19"
			,TOTAL."TargetValue19"
			,(CASE 
				WHEN 19 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue19" = TOTAL."TargetValue19" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue19",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue19",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						19                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold19"
			,TOTAL."SourceValue20"
			,TOTAL."TargetValue20"
			,(CASE 
				WHEN 20 > "lvColumnCount" THEN 9
				WHEN TOTAL."SourceValue20" = TOTAL."TargetValue20" THEN 9
				ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						TOTAL."SourceValue20",	-- Source value from Last 10 run against which to be compared 
						TOTAL."TargetValue20",	-- Target value from from current run that is to be compared
						0,
						0,
						"lvThresholdType",
						'',	-- "LastValue" or " Last 10 Run"
						0,
						"InFDAAlertRulesId",  	--AlertId
						"lvAlertType",
						20                    	--ColumnOrder
					)
				END) "ColorBasedoThreasold20"		
            ,ABS(TOTAL."Threshold")
			,'OPEN'
			,CURRENT_DATE
			,TO_CHAR(CURRENT_TIMESTAMP, 'hh12:mi AM') -- ReconciliationTime
			,CURRENT_TIMESTAMP --CreatedDateTime
			,CURRENT_TIMESTAMP --UpdatedDateTime
			,TOTAL."UpdatedBy"
		FROM 
		 (SELECT 
			 SPLIT_PART(SourceTargetComparison."SourceSegmentName",'^',1) "SourceSegment1",
		     SPLIT_PART(SourceTargetComparison."SourceSegmentName",'^',2) "SourceSegment2",
		     SPLIT_PART(SourceTargetComparison."SourceSegmentName",'^',3) "SourceSegment3",
		     SPLIT_PART(SourceTargetComparison."SourceSegmentName",'^',4) "SourceSegment4",
		     SPLIT_PART(SourceTargetComparison."SourceSegmentName",'^',5) "SourceSegment5",
		  
			 SPLIT_PART(SourceTargetComparison."TargetSegmentName",'^',1) "TargetSegment1"
		    ,SPLIT_PART(SourceTargetComparison."TargetSegmentName",'^',2) "TargetSegment2"
		    ,SPLIT_PART(SourceTargetComparison."TargetSegmentName",'^',3) "TargetSegment3"  
		    ,SPLIT_PART(SourceTargetComparison."TargetSegmentName",'^',4) "TargetSegment4"
		    ,SPLIT_PART(SourceTargetComparison."TargetSegmentName",'^',5) "TargetSegment5" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',1),''),'0') AS NUMERIC(36,11)) "SourceValue1" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',1),''),'0') AS NUMERIC(36,11)) "TargetValue1" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',2),''),'0') AS NUMERIC(36,11)) "SourceValue2" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',2),''),'0') AS NUMERIC(36,11)) "TargetValue2" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',3),''),'0') AS NUMERIC(36,11)) "SourceValue3" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',3),''),'0') AS NUMERIC(36,11)) "TargetValue3" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',4),''),'0') AS NUMERIC(36,11)) "SourceValue4"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',4),''),'0') AS NUMERIC(36,11)) "TargetValue4" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',5),''),'0') AS NUMERIC(36,11)) "SourceValue5" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',5),''),'0') AS NUMERIC(36,11)) "TargetValue5"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',6),''),'0') AS NUMERIC(36,11)) "SourceValue6" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',6),''),'0') AS NUMERIC(36,11)) "TargetValue6"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',7),''),'0') AS NUMERIC(36,11)) "SourceValue7" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',7),''),'0') AS NUMERIC(36,11)) "TargetValue7"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',8),''),'0') AS NUMERIC(36,11)) "SourceValue8" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',8),''),'0') AS NUMERIC(36,11)) "TargetValue8"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',9),''),'0') AS NUMERIC(36,11)) "SourceValue9" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',9),''),'0') AS NUMERIC(36,11)) "TargetValue9"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',10),''),'0') AS NUMERIC(36,11)) "SourceValue10" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',10),''),'0') AS NUMERIC(36,11)) "TargetValue10"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',11),''),'0') AS NUMERIC(36,11)) "SourceValue11" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',11),''),'0') AS NUMERIC(36,11)) "TargetValue11"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',12),''),'0') AS NUMERIC(36,11)) "SourceValue12" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',12),''),'0') AS NUMERIC(36,11)) "TargetValue12"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',13),''),'0') AS NUMERIC(36,11)) "SourceValue13" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',13),''),'0') AS NUMERIC(36,11)) "TargetValue13"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',14),''),'0') AS NUMERIC(36,11)) "SourceValue14" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',14),''),'0') AS NUMERIC(36,11)) "TargetValue14"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',15),''),'0') AS NUMERIC(36,11)) "SourceValue15" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',15),''),'0') AS NUMERIC(36,11)) "TargetValue15"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',16),''),'0') AS NUMERIC(36,11)) "SourceValue16" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',16),''),'0') AS NUMERIC(36,11)) "TargetValue16"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',17),''),'0') AS NUMERIC(36,11)) "SourceValue17" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',17),''),'0') AS NUMERIC(36,11)) "TargetValue17"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',18),''),'0') AS NUMERIC(36,11)) "SourceValue18" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',18),''),'0') AS NUMERIC(36,11)) "TargetValue18"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',19),''),'0') AS NUMERIC(36,11)) "SourceValue19" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',19),''),'0') AS NUMERIC(36,11)) "TargetValue19"
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."SourceValue",'^',20),''),'0') AS NUMERIC(36,11)) "SourceValue20" 
		   ,CAST(COALESCE(NULLIF(SPLIT_PART(SourceTargetComparison."TargetValue",'^',20),''),'0') AS NUMERIC(36,11)) "TargetValue20"
           ,CAST(a."LowerThresholdValue" AS NUMERIC(17,6)) "Threshold"
		   ,a."UpdatedBy"
		   ,a."BaseLineValueType",							-- "LastValue" or " Last 10 Run"
			a."UpperThresholdType",							-- Percentage or Absolute or Standard Deviation
			a."LowerThresholdType",							-- Percentage or Absolute or Standard Deviation
			a."UpperThresholdValue",						-- 1% or 1000 or 1 SD
			a."LowerThresholdValue"
		FROM fda."FDAAlertRules" a		
		CROSS JOIN 
				(SELECT "SourceSegmentName",
						"TargetSegmentName",
						"SourceValue",
						"TargetValue"
				FROM (SELECT "VALUE",
							LEFT("VALUE",STRPOS("VALUE",'=')-1) "SourceSegmentName",
							(CASE WHEN RIGHT("VALUE",LENGTH("VALUE") - STRPOS("VALUE",'=')) > '' 
								THEN RIGHT("VALUE",LENGTH("VALUE") - STRPOS("VALUE",'=')) 
								ELSE '0' 
							END) "SourceValue"
							FROM unnest(string_to_array("InSourceValue" ,'~')) "VALUE"
					WHERE "VALUE" IS NOT NULL) SourceSegmentValue
	
		LEFT JOIN 
	
					(SELECT "VALUE",
							LEFT("VALUE",STRPOS("VALUE",'=')-1) "TargetSegmentName",
							(CASE WHEN RIGHT("VALUE",LENGTH("VALUE")-STRPOS("VALUE",'=')) > '' 
								THEN RIGHT("VALUE",LENGTH("VALUE")-STRPOS("VALUE",'=')) 
								ELSE '0'
							END) "TargetValue"
							FROM UNNEST(STRING_TO_ARRAY("InTargetValue" ,'~')) "VALUE"
					WHERE "VALUE" IS NOT NULL) TargetSegmentDetails
	
			ON SourceSegmentValue."SourceSegmentName" = TargetSegmentDetails."TargetSegmentName"
				) SourceTargetComparison
	WHERE a."FDAAlertRulesId" = "InFDAAlertRulesId") TOTAL;
	

ELSE IF "lvAlertType" = 'TargetCount'  OR "lvAlertType" = 'TargetValue' 
THEN

-- Compare Target against Present Value

RAISE NOTICE 'Value: % ','IN TARGET ONLY';
/*IF "lvAlertInd" = 'N' AND COALESCE("lvConfirmedByUser",'') = '' THEN 
--   Get Previous Last Run Id 
	RAISE NOTICE 'BLOCK NUM: % ','1ST';	
				SELECT "FDAAlertOutputId" 
				INTO "InFDAAlertRulesRunIdPrevious"
				FROM (  SELECT "FDAAlertOutputId",
							   ROW_NUMBER() OVER (ORDER BY "FDAAlertOutputId" DESC) "rownum"
						FROM fda."FDAAlertOutput"	
						WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
					  order by "FDAAlertOutputId" desc
					 ) b11
				WHERE b11."rownum" = 2;
ELSE IF "lvAlertInd" = 'Y' AND  COALESCE("lvConfirmedByUser",'')=  '' AND  "lvReconciliationDate" :: DATE <= current_date - INTERVAL '3 day'  THEN
	RAISE NOTICE 'Value: % ','2ND';	 
			SELECT "FDAAlertOutputId" 
				INTO "InFDAAlertRulesRunIdPrevious"
				FROM (SELECT "FDAAlertOutputId",
							   ROW_NUMBER() OVER (ORDER BY "FDAAlertOutputId" DESC) "rownum"
						FROM fda."FDAAlertOutput"	
						WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
					  order by "FDAAlertOutputId" desc
					 ) b11;
ELSE IF "lvAlertInd" = 'Y' AND  COALESCE("lvConfirmedByUser",'')=  '' AND  "lvReconciliationDate" :: DATE > current_date - INTERVAL '3 day'  THEN 
	RAISE NOTICE 'Value: % ','3RD';	
			SELECT "FDAAlertOutputId" 
				INTO "InFDAAlertRulesRunIdPrevious"
				FROM (SELECT "FDAAlertOutputId",
							   ROW_NUMBER() OVER (ORDER BY "FDAAlertOutputId" ASC) "rownum"
						FROM fda."FDAAlertOutput"	
						WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
					  AND "AlertInd" = 'Y'
					 ) b11
					 WHERE "rownum" = 1;

ELSE IF "lvAlertInd" = 'Y' AND  COALESCE("lvConfirmedByUser",'') = 'N' THEN 
		RAISE NOTICE 'Value: % ','4TH';			  
		SELECT "FDAAlertOutputId" 
				INTO "InFDAAlertRulesRunIdPrevious"
				FROM (  SELECT "FDAAlertOutputId",
							   ROW_NUMBER() OVER (ORDER BY "FDAAlertOutputId" DESC) "rownum"
						FROM fda."FDAAlertOutput"	
						WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
					  order by "FDAAlertOutputId" desc
					 ) b11
				WHERE b11."rownum" = 2; 

END IF;
END IF;
END IF;
END IF;*/

RAISE NOTICE 'Value: % ',"InFDAAlertRulesRunIdPrevious";
	
	-- Insert INTO Segment
--EXECUTE dbo.proc_FDAWebTracking  @ERROR_NUMBER , '@AlertRunCount',  @AlertRunCount;

RAISE NOTICE 'Value: % ','INSERT INTO fda.FDAAlertOutputByAdvancedSegmentLevel2	';

INSERT INTO fda."FDAAlertOutputByAdvancedSegmentLevel2"	
		 ( 
		   "FDAAlertOutputId",
           "FDAAlertRulesId",
		   "SegmentValues",
           "SourceSegment1",
           "SourceSegment2",
           "SourceSegment3",
           "SourceSegment4",
           "SourceSegment5",
           "TargetSegment1",
           "TargetSegment2",
           "TargetSegment3",
           "TargetSegment4",
           "TargetSegment5",
           "SourceValue1",
--		   "LastRunTargetValue1",
           "TargetValue1",
           "ColorBasedoThreasold1",
           "SourceValue2",
--		   "LastRunTargetValue2",
           "TargetValue2",
           "ColorBasedoThreasold2",
           "SourceValue3",
--		   "LastRunTargetValue3",
           "TargetValue3",
           "ColorBasedoThreasold3",
           "SourceValue4",
--		   "LastRunTargetValue4",
           "TargetValue4",
           "ColorBasedoThreasold4",
           "SourceValue5",
--		   "LastRunTargetValue5",
           "TargetValue5",
           "ColorBasedoThreasold5",
		   "SourceValue6",
           "TargetValue6",
		   "ColorBasedoThreasold6",
		   "SourceValue7",
           "TargetValue7",
		   "ColorBasedoThreasold7",
		   "SourceValue8",
           "TargetValue8",
		   "ColorBasedoThreasold8",
		   "SourceValue9",
           "TargetValue9",
		   "ColorBasedoThreasold9",
		   "SourceValue10",
           "TargetValue10",
		   "ColorBasedoThreasold10",
		   "SourceValue11",
           "TargetValue11",
		   "ColorBasedoThreasold11",
		   "SourceValue12",
           "TargetValue12",
		   "ColorBasedoThreasold12",
		   "SourceValue13",
           "TargetValue13",
		   "ColorBasedoThreasold13",
		   "SourceValue14",
           "TargetValue14",
		   "ColorBasedoThreasold14",
		   "SourceValue15",
           "TargetValue15",
		   "ColorBasedoThreasold15",
		   "SourceValue16",
           "TargetValue16",
		   "ColorBasedoThreasold16",
		   "SourceValue17",
           "TargetValue17",
		   "ColorBasedoThreasold17",
		   "SourceValue18",
           "TargetValue18",
		   "ColorBasedoThreasold18",
		   "SourceValue19",
           "TargetValue19",
		   "ColorBasedoThreasold19",
		   "SourceValue20",
           "TargetValue20",		   
           "ColorBasedoThreasold20",
           "Threshold",
           "ReconciliationDate",
		   "ReconciliationTime",
		   "AlertLifeCycleStatus",
		   "UpdatedDateTime",
		   "CreatedDateTime",
		   "UpdatedBy",
			"SourceTargetConcatenatedColumn"
		 )
		SELECT 
			 "InFDAAlertRulesRunId"
			,a."FDAAlertRulesId"	
			,"InSegmentValues"
			,COALESCE(SourceTargetComparison."TargetSegment1", SourceTargetComparison."SourceSegmentName1") "SourceSegment1"
			,COALESCE(SourceTargetComparison."TargetSegment2", SourceTargetComparison."SourceSegmentName2") "SourceSegment2"
			,COALESCE(SourceTargetComparison."TargetSegment3", SourceTargetComparison."SourceSegmentName3") "SourceSegment3"
			,COALESCE(SourceTargetComparison."TargetSegment4", SourceTargetComparison."SourceSegmentName4") "SourceSegment4"
			,COALESCE(SourceTargetComparison."TargetSegment5", SourceTargetComparison."SourceSegmentName5") "SourceSegment5"
			,SourceTargetComparison."TargetSegment1"
			,SourceTargetComparison."TargetSegment2"
			,SourceTargetComparison."TargetSegment3"
			,SourceTargetComparison."TargetSegment4"
			,SourceTargetComparison."TargetSegment5"
			,ROUND(SourceTargetComparison."SourceValue1",0)SourceValue1
--			,ROUND(SourceTargetComparison."SourceValue1",0) LastRunTargetValue1
            ,ROUND(SourceTargetComparison."TargetValue1",0)TargetValue1
            ,(CASE 
				WHEN 1 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE'  THEN 9    --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = '' 
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9  --new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue1" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue1" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit1" AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit1" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						1
					)
				END) ColorBasedoThreasold1
            ,ROUND(SourceTargetComparison."SourceValue2",0) SourceValue2
--			,ROUND(SourceTargetComparison."SourceValue2",0) LastRunTargetValue2
            ,ROUND(SourceTargetComparison."TargetValue2",0)TargetValue2
            ,(CASE 
				WHEN 2 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9   --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = ''
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9 --new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue2" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue2" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit2" AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit2" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						2
					)
				END) ColorBasedoThreasold2
            ,ROUND(SourceTargetComparison."SourceValue3",0)SourceValue3
--			,ROUND(SourceTargetComparison."SourceValue3",0) LastRunTargetValue3
            ,ROUND(SourceTargetComparison."TargetValue3",0)TargetValue3
            ,(CASE 
				WHEN 3 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9   --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = '' 
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9 --new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue3" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue3" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit3"AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit3" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						3
					)
				END) ColorBasedoThreasold3
            ,ROUND(SourceTargetComparison."SourceValue4",0) SourceValue4
--			,ROUND(SourceTargetComparison."SourceValue4",0) LastRunTargetValue4
            ,ROUND(SourceTargetComparison."TargetValue4",0) TargetValue4
            ,(CASE 
				WHEN 4 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9   --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = ''
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9	--new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue4" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue4" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit4" AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit4" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						4
					)
				END) ColorBasedoThreasold4
            ,ROUND(SourceTargetComparison."SourceValue5",0)SourceValue5
--			,ROUND(SourceTargetComparison."SourceValue5",0) LastRunTargetValue5
            ,ROUND(SourceTargetComparison."TargetValue5",0)TargetValue5
            ,(CASE 
				WHEN 5 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9   --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = '' 
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9  --new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue5" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue5" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit5" AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit5" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						5
					)
				END) ColorBasedoThreasold5
			,ROUND(SourceTargetComparison."SourceValue6",0)SourceValue6
            ,ROUND(SourceTargetComparison."TargetValue6",0)TargetValue6
            ,(CASE 
				WHEN 6 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9   --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = '' 
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9  --new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue6" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue6" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit6" AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit6" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						6
					)
				END) ColorBasedoThreasold6
			,ROUND(SourceTargetComparison."SourceValue7",0)SourceValue7
            ,ROUND(SourceTargetComparison."TargetValue7",0)TargetValue7
            ,(CASE 
				WHEN 7 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9   --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = '' 
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9  --new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue7" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue7" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit7" AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit7" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						7
					)
				END) ColorBasedoThreasold7
			,ROUND(SourceTargetComparison."SourceValue8",0)SourceValue8
            ,ROUND(SourceTargetComparison."TargetValue8",0)TargetValue8
            ,(CASE 
				WHEN 8 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9   --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = '' 
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9  --new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue8" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue8" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit8" AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit8" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						8
					)
				END) ColorBasedoThreasold8
			,ROUND(SourceTargetComparison."SourceValue9",0)SourceValue9
            ,ROUND(SourceTargetComparison."TargetValue9",0)TargetValue9
            ,(CASE 
				WHEN 9 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9   --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = '' 
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9  --new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue9" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue9" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit9" AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit9" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						9
					)
				END) ColorBasedoThreasold9
			,ROUND(SourceTargetComparison."SourceValue10",0)SourceValue10
            ,ROUND(SourceTargetComparison."TargetValue10",0)TargetValue10
            ,(CASE 
				WHEN 10 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9   --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = '' 
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9  --new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue10" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue10" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit10" AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit10" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						10
					)
				END) ColorBasedoThreasold10
			,ROUND(SourceTargetComparison."SourceValue11",0)SourceValue11
            ,ROUND(SourceTargetComparison."TargetValue11",0)TargetValue11
            ,(CASE 
				WHEN 11 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9   --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = '' 
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9  --new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue11" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue11" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit11" AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit11" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						11
					)
				END) ColorBasedoThreasold11	
			,ROUND(SourceTargetComparison."SourceValue12",0)SourceValue12
            ,ROUND(SourceTargetComparison."TargetValue12",0)TargetValue12
            ,(CASE 
				WHEN 12 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9   --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = '' 
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9  --new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue12" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue12" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit12" AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit12" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						12
					)
				END) ColorBasedoThreasold12
			,ROUND(SourceTargetComparison."SourceValue13",0)SourceValue13
            ,ROUND(SourceTargetComparison."TargetValue13",0)TargetValue13
            ,(CASE 
				WHEN 13 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9   --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = '' 
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9  --new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue13" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue13" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit13" AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit13" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						13
					)
				END) ColorBasedoThreasold13	
			,ROUND(SourceTargetComparison."SourceValue14",0)SourceValue14
            ,ROUND(SourceTargetComparison."TargetValue14",0)TargetValue14
            ,(CASE 
				WHEN 14 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9   --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = '' 
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9  --new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue14" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue14" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit14" AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit14" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						14
					)
				END) ColorBasedoThreasold14
			,ROUND(SourceTargetComparison."SourceValue15",0)SourceValue15
            ,ROUND(SourceTargetComparison."TargetValue15",0)TargetValue15
            ,(CASE 
				WHEN 15 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9   --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = '' 
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9  --new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue15" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue15" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit15" AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit15" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						15
					)
				END) ColorBasedoThreasold15
			,ROUND(SourceTargetComparison."SourceValue16",0)SourceValue16
            ,ROUND(SourceTargetComparison."TargetValue16",0)TargetValue16
            ,(CASE 
				WHEN 16 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9   --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = '' 
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9  --new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue16" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue16" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit16" AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit16" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						16
					)
				END) ColorBasedoThreasold16
			,ROUND(SourceTargetComparison."SourceValue17",0)SourceValue17
            ,ROUND(SourceTargetComparison."TargetValue17",0)TargetValue17
            ,(CASE 
				WHEN 17 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9   --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = '' 
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9  --new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue17" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue17" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit17" AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit17" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						17
					)
				END) ColorBasedoThreasold17	
			,ROUND(SourceTargetComparison."SourceValue18",0)SourceValue18
            ,ROUND(SourceTargetComparison."TargetValue18",0)TargetValue18
            ,(CASE 
				WHEN 18 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9   --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = '' 
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9  --new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue18" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue18" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit18" AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit18" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						18
					)
				END) ColorBasedoThreasold18	
			,ROUND(SourceTargetComparison."SourceValue19",0)SourceValue19
            ,ROUND(SourceTargetComparison."TargetValue19",0)TargetValue19
            ,(CASE 
				WHEN 19 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9   --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = '' 
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9  --new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue19" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue19" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit19" AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit19" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						19
					)
				END) ColorBasedoThreasold19
			,ROUND(SourceTargetComparison."SourceValue20",0)SourceValue20
            ,ROUND(SourceTargetComparison."TargetValue20",0)TargetValue20
            ,(CASE 
				WHEN 20 > "lvColumnCount" THEN 9
				WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9   --First Alert Run
				WHEN COALESCE(a."AllowNewSegmentInd",'') IN ('Y','') AND 
				CONCAT(COALESCE(SourceTargetComparison."SourceSegmentName1",''),
					COALESCE(SourceTargetComparison."SourceSegmentName2",''),
					COALESCE(SourceTargetComparison."SourceSegmentName3",''), 
					COALESCE(SourceTargetComparison."SourceSegmentName4",''),
					COALESCE(SourceTargetComparison."SourceSegmentName5",'')) = '' 
					AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9  --new segment
			    ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						CAST(SourceTargetComparison."SourceValue20" AS NUMERIC),			-- Source value from Last 10 run against which to be compared 
						CAST(SourceTargetComparison."TargetValue20" AS NUMERIC),			-- Target value from from current run that is to be compared 
						CAST(SourceTargetComparison."SourceTargetUpperDiffLimit20" AS NUMERIC),
						CAST(SourceTargetComparison."SourceTargetLowerDiffLimit20" AS NUMERIC),
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						CAST("lvBaseLineValue" AS NUMERIC),
						"InFDAAlertRulesId",
						"lvAlertType",
						20
					)
				END) ColorBasedoThreasold20	
            ,CAST(a."LowerThresholdValue" AS NUMERIC(17,6))   --Threshold
			,CURRENT_DATE     	--ReconciliationDate
			,TO_CHAR(CURRENT_TIMESTAMP, 'hh12:mi AM') -- ReconciliationTime
			,'OPEN'        		--AlertLifeCycleStatus
			,CURRENT_TIMESTAMP  --UpdatedDateTime
			,CURRENT_TIMESTAMP
			,a."UpdatedBy"   	--UpdatedBy
			,CONCAT(
				COALESCE(SourceTargetComparison."TargetSegment1", COALESCE(SourceTargetComparison."TargetSegment1", SourceTargetComparison."SourceSegmentName1")),
				COALESCE(SourceTargetComparison."TargetSegment2", COALESCE(SourceTargetComparison."TargetSegment2", SourceTargetComparison."SourceSegmentName2")),
				COALESCE(SourceTargetComparison."TargetSegment3", COALESCE(SourceTargetComparison."TargetSegment3", SourceTargetComparison."SourceSegmentName3")),
				COALESCE(SourceTargetComparison."TargetSegment4", COALESCE(SourceTargetComparison."TargetSegment4", SourceTargetComparison."SourceSegmentName4")),
				COALESCE(SourceTargetComparison."TargetSegment5", COALESCE(SourceTargetComparison."TargetSegment5", SourceTargetComparison."SourceSegmentName5"))
				) "SourceTargetConcatenatedColumn"
		FROM fda."FDAAlertRules" a
		CROSS JOIN 
			(SELECT LastXDaysAlertRuns."SourceSegmentName1",
			        LastXDaysAlertRuns."SourceSegmentName2",
			        LastXDaysAlertRuns."SourceSegmentName3",
			        LastXDaysAlertRuns."SourceSegmentName4",
			        LastXDaysAlertRuns."SourceSegmentName5",
					
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit1",0) AS "SourceTargetUpperDiffLimit1",
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit2",0) AS "SourceTargetUpperDiffLimit2",
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit3",0) AS "SourceTargetUpperDiffLimit3",
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit4",0) AS "SourceTargetUpperDiffLimit4",
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit5",0) AS "SourceTargetUpperDiffLimit5",
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit6",0) AS "SourceTargetUpperDiffLimit6",
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit7",0) AS "SourceTargetUpperDiffLimit7",
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit8",0) AS "SourceTargetUpperDiffLimit8",
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit9",0) AS "SourceTargetUpperDiffLimit9",
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit10",0) AS "SourceTargetUpperDiffLimit10",
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit11",0) AS "SourceTargetUpperDiffLimit11",
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit12",0) AS "SourceTargetUpperDiffLimit12",
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit13",0) AS "SourceTargetUpperDiffLimit13",
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit14",0) AS "SourceTargetUpperDiffLimit14",
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit15",0) AS "SourceTargetUpperDiffLimit15",
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit16",0) AS "SourceTargetUpperDiffLimit16",
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit17",0) AS "SourceTargetUpperDiffLimit17",
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit18",0) AS "SourceTargetUpperDiffLimit18",
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit19",0) AS "SourceTargetUpperDiffLimit19",
					COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit20",0) AS "SourceTargetUpperDiffLimit20",
						
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit1",0) AS "SourceTargetLowerDiffLimit1",
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit2",0) AS "SourceTargetLowerDiffLimit2",
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit3",0) AS "SourceTargetLowerDiffLimit3",
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit4",0) AS "SourceTargetLowerDiffLimit4",
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit5",0) AS "SourceTargetLowerDiffLimit5",
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit6",0) AS "SourceTargetLowerDiffLimit6",
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit7",0) AS "SourceTargetLowerDiffLimit7",
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit8",0) AS "SourceTargetLowerDiffLimit8",
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit9",0) AS "SourceTargetLowerDiffLimit9",
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit10",0) AS "SourceTargetLowerDiffLimit10",
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit11",0) AS "SourceTargetLowerDiffLimit11",
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit12",0) AS "SourceTargetLowerDiffLimit12",
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit13",0) AS "SourceTargetLowerDiffLimit13",
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit14",0) AS "SourceTargetLowerDiffLimit14",
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit15",0) AS "SourceTargetLowerDiffLimit15",
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit16",0) AS "SourceTargetLowerDiffLimit16",
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit17",0) AS "SourceTargetLowerDiffLimit17",
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit18",0) AS "SourceTargetLowerDiffLimit18",
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit19",0) AS "SourceTargetLowerDiffLimit19",
					COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit20",0) AS "SourceTargetLowerDiffLimit20",
						   
			        TargetSegmentDetails."TargetSegmentName1" AS "TargetSegment1",
			        TargetSegmentDetails."TargetSegmentName2" AS "TargetSegment2",
					TargetSegmentDetails."TargetSegmentName3" AS "TargetSegment3",
					TargetSegmentDetails."TargetSegmentName4" AS "TargetSegment4",
					TargetSegmentDetails."TargetSegmentName5" AS "TargetSegment5",
					
			        LastXDaysAlertRuns."SourceValue1",
					LastXDaysAlertRuns."SourceValue2",
					LastXDaysAlertRuns."SourceValue3",
					LastXDaysAlertRuns."SourceValue4",
					LastXDaysAlertRuns."SourceValue5",
					LastXDaysAlertRuns."SourceValue6",
					LastXDaysAlertRuns."SourceValue7",
					LastXDaysAlertRuns."SourceValue8",
					LastXDaysAlertRuns."SourceValue9",
					LastXDaysAlertRuns."SourceValue10",
					LastXDaysAlertRuns."SourceValue11",
					LastXDaysAlertRuns."SourceValue12",
					LastXDaysAlertRuns."SourceValue13",
					LastXDaysAlertRuns."SourceValue14",
					LastXDaysAlertRuns."SourceValue15",
					LastXDaysAlertRuns."SourceValue16",
					LastXDaysAlertRuns."SourceValue17",
					LastXDaysAlertRuns."SourceValue18",
					LastXDaysAlertRuns."SourceValue19",
					LastXDaysAlertRuns."SourceValue20",
					
			        CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',1),''),'0') AS NUMERIC(36,11)) AS "TargetValue1",
			        CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',2),''),'0') AS NUMERIC(36,11)) AS "TargetValue2",
			        CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',3),''),'0') AS NUMERIC(36,11)) AS "TargetValue3",
			        CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',4),''),'0') AS NUMERIC(36,11)) AS "TargetValue4",
					CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',5),''),'0') AS NUMERIC(36,11)) AS "TargetValue5",
			        CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',6),''),'0') AS NUMERIC(36,11)) AS "TargetValue6",
					CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',7),''),'0') AS NUMERIC(36,11)) AS "TargetValue7",
					CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',8),''),'0') AS NUMERIC(36,11)) AS "TargetValue8",
					CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',9),''),'0') AS NUMERIC(36,11)) AS "TargetValue9",
					CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',10),''),'0') AS NUMERIC(36,11)) AS "TargetValue10",
					CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',11),''),'0') AS NUMERIC(36,11)) AS "TargetValue11",
					CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',12),''),'0') AS NUMERIC(36,11)) AS "TargetValue12",
					CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',13),''),'0') AS NUMERIC(36,11)) AS "TargetValue13",
					CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',14),''),'0') AS NUMERIC(36,11)) AS "TargetValue14",
					CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',15),''),'0') AS NUMERIC(36,11)) AS "TargetValue15",
					CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',16),''),'0') AS NUMERIC(36,11)) AS "TargetValue16",
					CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',17),''),'0') AS NUMERIC(36,11)) AS "TargetValue17",
					CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',18),''),'0') AS NUMERIC(36,11)) AS "TargetValue18",
					CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',19),''),'0') AS NUMERIC(36,11)) AS "TargetValue19",
					CAST(COALESCE(NULLIF(SPLIT_PART(TargetSegmentDetails."TargetValue",'^',20),''),'0') AS NUMERIC(36,11)) AS "TargetValue20"
			FROM		
			(
				SELECT 
					LastXDaysAlertRuns."FDAAlertRulesId",
					LastXDaysAlertRuns."TargetSegment1" AS "SourceSegmentName1",
					LastXDaysAlertRuns."TargetSegment2" AS "SourceSegmentName2",
					LastXDaysAlertRuns."TargetSegment3" AS "SourceSegmentName3",
					LastXDaysAlertRuns."TargetSegment4" AS "SourceSegmentName4",
					LastXDaysAlertRuns."TargetSegment5" AS "SourceSegmentName5",
					
					LastXDaysAlertRuns."TargetValue1" AS "SourceValue1",
					LastXDaysAlertRuns."TargetValue2" AS "SourceValue2",
					LastXDaysAlertRuns."TargetValue3" AS "SourceValue3",
					LastXDaysAlertRuns."TargetValue4" AS "SourceValue4",
					LastXDaysAlertRuns."TargetValue5" AS "SourceValue5",
					LastXDaysAlertRuns."TargetValue6" AS "SourceValue6",
					LastXDaysAlertRuns."TargetValue7" AS "SourceValue7",
					LastXDaysAlertRuns."TargetValue8" AS "SourceValue8",
					LastXDaysAlertRuns."TargetValue9" AS "SourceValue9",
					LastXDaysAlertRuns."TargetValue10" AS "SourceValue10",
					LastXDaysAlertRuns."TargetValue11" AS "SourceValue11",
					LastXDaysAlertRuns."TargetValue12" AS "SourceValue12",
					LastXDaysAlertRuns."TargetValue13" AS "SourceValue13",
					LastXDaysAlertRuns."TargetValue14" AS "SourceValue14",
					LastXDaysAlertRuns."TargetValue15" AS "SourceValue15",
					LastXDaysAlertRuns."TargetValue16" AS "SourceValue16",
					LastXDaysAlertRuns."TargetValue17" AS "SourceValue17",
					LastXDaysAlertRuns."TargetValue18" AS "SourceValue18",
					LastXDaysAlertRuns."TargetValue19" AS "SourceValue19",
					LastXDaysAlertRuns."TargetValue20" AS "SourceValue20",
					
					UserIgnoreAlerts."SourceTargetUpperDiffLimit1",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit2",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit3",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit4",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit5",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit6",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit7",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit8",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit9",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit10",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit11",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit12",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit13",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit14",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit15",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit16",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit17",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit18",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit19",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit20",
					
					UserIgnoreAlerts."SourceTargetLowerDiffLimit1",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit2",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit3",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit4",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit5",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit6",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit7",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit8",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit9",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit10",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit11",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit12",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit13",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit14",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit15",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit16",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit17",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit18",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit19",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit20"
				FROM 
					(
						SELECT 
								a1."FDAAlertRulesId", -- You would ignore the most recent for which you are comoaring
								COALESCE(a1."TargetSegment1", a1."SourceSegment1") "TargetSegment1",
								COALESCE(a1."TargetSegment2", a1."SourceSegment2") "TargetSegment2",
								COALESCE(a1."TargetSegment3", a1."SourceSegment3") "TargetSegment3",
								COALESCE(a1."TargetSegment4", a1."SourceSegment4") "TargetSegment4",
								COALESCE(a1."TargetSegment5", a1."SourceSegment5") "TargetSegment5",
								a1."TargetValue1",
								a1."TargetValue2",
								a1."TargetValue3",
								a1."TargetValue4",
								a1."TargetValue5",
								a1."TargetValue6",
								a1."TargetValue7",
								a1."TargetValue8",
								a1."TargetValue9",
								a1."TargetValue10",
								a1."TargetValue11",
								a1."TargetValue12",
								a1."TargetValue13",
								a1."TargetValue14",
								a1."TargetValue15",
								a1."TargetValue16",
								a1."TargetValue17",
								a1."TargetValue18",
								a1."TargetValue19",
								a1."TargetValue20"			
						FROM fda."FDAAlertOutputByAdvancedSegmentLevel2" a1
							INNER JOIN fda."FDAAlertRules" a
						ON a1."FDAAlertRulesId" =  a."FDAAlertRulesId"
						WHERE a1."FDAAlertRulesId" = "InFDAAlertRulesId"
						AND a1."FDAAlertOutputId" = "lvPreviousAlertRulesRunIdTarget"
						AND "SegmentValues" = "InSegmentValues"
						AND a1."UpdatedDateTime" >=  a."NewBaseLineDateTime"
						--and (a1."UpdatedDateTime" :: TIME) >  a."NewBaseLineDateTime" :: TIME
						/*GROUP BY a1."FDAAlertRulesId",
						        a."BaseLineValueType",
								COALESCE(a1."TargetSegment1", a1."SourceSegment1"),
								COALESCE(a1."TargetSegment2", a1."SourceSegment2"),
								COALESCE(a1."TargetSegment3", a1."SourceSegment3"),
								COALESCE(a1."TargetSegment4", a1."SourceSegment4"),
								COALESCE(a1."TargetSegment5", a1."SourceSegment5") */
								
					) LastXDaysAlertRuns  -- Last X days run depending upon user condition(LastRun/AvgOfLast) 
						
				LEFT OUTER JOIN 
					(
						SELECT a0."FDAAlertRulesId",
								COALESCE(a1."TargetSegment1", a1."SourceSegment1") "TargetSegment1",
								COALESCE(a1."TargetSegment2", a1."SourceSegment2") "TargetSegment2",
								COALESCE(a1."TargetSegment3", a1."SourceSegment3") "TargetSegment3",
								COALESCE(a1."TargetSegment4", a1."SourceSegment4") "TargetSegment4",
								COALESCE(a1."TargetSegment5", a1."SourceSegment5") "TargetSegment5",
								MAX(a1."TargetValue1" - a1."SourceValue1") "SourceTargetUpperDiffLimit1",
								MAX(a1."TargetValue2" - a1."SourceValue2") "SourceTargetUpperDiffLimit2",
								MAX(a1."TargetValue3" - a1."SourceValue3") "SourceTargetUpperDiffLimit3",
								MAX(a1."TargetValue4" - a1."SourceValue4") "SourceTargetUpperDiffLimit4",
								MAX(a1."TargetValue5" - a1."SourceValue5") "SourceTargetUpperDiffLimit5",
								MAX(a1."TargetValue6" - a1."SourceValue6") "SourceTargetUpperDiffLimit6",
								MAX(a1."TargetValue7" - a1."SourceValue7") "SourceTargetUpperDiffLimit7",
								MAX(a1."TargetValue8" - a1."SourceValue8") "SourceTargetUpperDiffLimit8",
								MAX(a1."TargetValue9" - a1."SourceValue9") "SourceTargetUpperDiffLimit9",
								MAX(a1."TargetValue10" - a1."SourceValue10") "SourceTargetUpperDiffLimit10",
								MAX(a1."TargetValue11" - a1."SourceValue11") "SourceTargetUpperDiffLimit11",
								MAX(a1."TargetValue12" - a1."SourceValue12") "SourceTargetUpperDiffLimit12",
								MAX(a1."TargetValue13" - a1."SourceValue13") "SourceTargetUpperDiffLimit13",
								MAX(a1."TargetValue14" - a1."SourceValue14") "SourceTargetUpperDiffLimit14",
								MAX(a1."TargetValue15" - a1."SourceValue15") "SourceTargetUpperDiffLimit15",
								MAX(a1."TargetValue16" - a1."SourceValue16") "SourceTargetUpperDiffLimit16",
								MAX(a1."TargetValue17" - a1."SourceValue17") "SourceTargetUpperDiffLimit17",
								MAX(a1."TargetValue18" - a1."SourceValue18") "SourceTargetUpperDiffLimit18",
								MAX(a1."TargetValue19" - a1."SourceValue19") "SourceTargetUpperDiffLimit19",
								MAX(a1."TargetValue20" - a1."SourceValue20") "SourceTargetUpperDiffLimit20",
								
								MIN(a1."TargetValue1" - a1."SourceValue1") "SourceTargetLowerDiffLimit1",
								MIN(a1."TargetValue2" - a1."SourceValue2") "SourceTargetLowerDiffLimit2",
								MIN(a1."TargetValue3" - a1."SourceValue3") "SourceTargetLowerDiffLimit3",
								MIN(a1."TargetValue4" - a1."SourceValue4") "SourceTargetLowerDiffLimit4",
								MIN(a1."TargetValue5" - a1."SourceValue5") "SourceTargetLowerDiffLimit5",
								MIN(a1."TargetValue6" - a1."SourceValue6") "SourceTargetLowerDiffLimit6",
								MIN(a1."TargetValue7" - a1."SourceValue7") "SourceTargetLowerDiffLimit7",
								MIN(a1."TargetValue8" - a1."SourceValue8") "SourceTargetLowerDiffLimit8",
								MIN(a1."TargetValue9" - a1."SourceValue9") "SourceTargetLowerDiffLimit9",
								MIN(a1."TargetValue10" - a1."SourceValue10") "SourceTargetLowerDiffLimit10",
								MIN(a1."TargetValue11" - a1."SourceValue11") "SourceTargetLowerDiffLimit11",
								MIN(a1."TargetValue12" - a1."SourceValue12") "SourceTargetLowerDiffLimit12",
								MIN(a1."TargetValue13" - a1."SourceValue13") "SourceTargetLowerDiffLimit13",
								MIN(a1."TargetValue14" - a1."SourceValue14") "SourceTargetLowerDiffLimit14",
								MIN(a1."TargetValue15" - a1."SourceValue15") "SourceTargetLowerDiffLimit15",
								MIN(a1."TargetValue16" - a1."SourceValue16") "SourceTargetLowerDiffLimit16",
								MIN(a1."TargetValue17" - a1."SourceValue17") "SourceTargetLowerDiffLimit17",
								MIN(a1."TargetValue18" - a1."SourceValue18") "SourceTargetLowerDiffLimit18",
								MIN(a1."TargetValue19" - a1."SourceValue19") "SourceTargetLowerDiffLimit19",
								MIN(a1."TargetValue20" - a1."SourceValue20") "SourceTargetLowerDiffLimit20"
						FROM fda."FDAAlertOutputSecondary" a0,
							  fda."FDAAlertOutputByAdvancedSegmentLevel2" a1,
							  ( SELECT "FDAAlertOutputId","SegmentValue","Severity",
											ROW_NUMBER() OVER (ORDER BY "FDAAlertOutputId" DESC) "RowNum"								          
									 FROM fda."FDAAlertOutputSecondary"	
									 WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
									 AND "SegmentValue" = "InSegmentValues"
										AND "Severity" NOT IN (1)
							   ) RowLimit
						WHERE a0."FDAAlertOutputId" =  a1."FDAAlertOutputId"
						AND a0."FDAAlertRulesId" =  a1."FDAAlertRulesId"
						AND RowLimit."SegmentValue" = "InSegmentValues"
						AND a0."FDAAlertOutputId" = RowLimit."FDAAlertOutputId"
						AND RowLimit."RowNum" <= 5
						AND a0."FDAAlertRulesId" = "InFDAAlertRulesId" 
						AND a0."Severity" NOT IN (1)
						GROUP BY a0."FDAAlertRulesId",
								COALESCE(a1."TargetSegment1", a1."SourceSegment1"),
								COALESCE(a1."TargetSegment2", a1."SourceSegment2"),
								COALESCE(a1."TargetSegment3", a1."SourceSegment3"),
								COALESCE(a1."TargetSegment4", a1."SourceSegment4"),
								COALESCE(a1."TargetSegment5", a1."SourceSegment5")
					) UserIgnoreAlerts	
				ON 	LastXDaysAlertRuns."FDAAlertRulesId" = UserIgnoreAlerts."FDAAlertRulesId"
				AND LastXDaysAlertRuns."TargetSegment1" = UserIgnoreAlerts."TargetSegment1"
				AND LastXDaysAlertRuns."TargetSegment2" = UserIgnoreAlerts."TargetSegment2"
				AND LastXDaysAlertRuns."TargetSegment3" = UserIgnoreAlerts."TargetSegment3"
				AND LastXDaysAlertRuns."TargetSegment4" = UserIgnoreAlerts."TargetSegment4"
				AND LastXDaysAlertRuns."TargetSegment5" = UserIgnoreAlerts."TargetSegment5"
					--WHERE a1."FDAAlertRulesId" = "InFDAAlertRulesId"
			) LastXDaysAlertRuns			
			FULL JOIN 
					(
						SELECT "VALUE",
							    SPLIT_PART(LEFT("VALUE",STRPOS("VALUE",'=')-1),'^',1) "TargetSegmentName1",
								SPLIT_PART(LEFT("VALUE",STRPOS("VALUE",'=')-1),'^',2) "TargetSegmentName2",
								SPLIT_PART(LEFT("VALUE",STRPOS("VALUE",'=')-1),'^',3) "TargetSegmentName3",
								SPLIT_PART(LEFT("VALUE",STRPOS("VALUE",'=')-1),'^',4) "TargetSegmentName4",
								SPLIT_PART(LEFT("VALUE",STRPOS("VALUE",'=')-1),'^',5) "TargetSegmentName5",
							    RIGHT("VALUE",LENGTH("VALUE")- STRPOS("VALUE",'=')) "TargetValue"
						 FROM UNNEST(STRING_TO_ARRAY("InTargetValue", '~')) "VALUE" 
						 WHERE "VALUE" IS NOT NULL  
					) TargetSegmentDetails   --Fetching Data from Target String
					
			    ON  COALESCE(LastXDaysAlertRuns."SourceSegmentName1",'') = COALESCE(TargetSegmentDetails."TargetSegmentName1",'')
				AND COALESCE(LastXDaysAlertRuns."SourceSegmentName2",'') = COALESCE(TargetSegmentDetails."TargetSegmentName2",'')
				AND COALESCE(LastXDaysAlertRuns."SourceSegmentName3",'') = COALESCE(TargetSegmentDetails."TargetSegmentName3",'')
				AND COALESCE(LastXDaysAlertRuns."SourceSegmentName4",'') = COALESCE(TargetSegmentDetails."TargetSegmentName4",'')
				AND COALESCE(LastXDaysAlertRuns."SourceSegmentName5",'') = COALESCE(TargetSegmentDetails."TargetSegmentName5",'')
				
				WHERE (COALESCE(LastXDaysAlertRuns."SourceSegmentName1",'') > '' OR 
                       COALESCE(LastXDaysAlertRuns."SourceSegmentName2",'') > '' OR 
                       COALESCE(LastXDaysAlertRuns."SourceSegmentName3",'') > '' OR 
                       COALESCE(LastXDaysAlertRuns."SourceSegmentName4",'') > '' OR 
                       COALESCE(LastXDaysAlertRuns."SourceSegmentName5",'') > '' OR 
					    
                       COALESCE(TargetSegmentDetails."TargetSegmentName1",'') > '' OR 
                       COALESCE(TargetSegmentDetails."TargetSegmentName2",'') > '' OR 
                       COALESCE(TargetSegmentDetails."TargetSegmentName3",'') > '' OR 
                       COALESCE(TargetSegmentDetails."TargetSegmentName4",'') > '' OR 
                       COALESCE(TargetSegmentDetails."TargetSegmentName5",'') > '' )
			) SourceTargetComparison

	    WHERE a."FDAAlertRulesId" = "InFDAAlertRulesId" ;

-------------------------------****Data insert for last target values****-----------------
/*MERGE INTO fda."FDALastTargetValue" a
	USING (SELECT 
           "FDAAlertRulesId",
          CONCAT("TargetSegment1",'~',
           "TargetSegment2",'~',
           "TargetSegment3",'~',
           "TargetSegment4",'~',
           "TargetSegment5") "ConcatSegment",
		   'TGTVAL1' "TargetValuePosition",
           (CASE WHEN "ColorBasedoThreasold1" IN(1 :: VARCHAR,2 :: VARCHAR) THEN "TargetValue1" 
		   ELSE NULL
		   END) "TargetValueRed",
           (CASE WHEN "ColorBasedoThreasold1" = 9 :: VARCHAR THEN "TargetValue1" 
		   ELSE NULL
		   END) "TargetValueGreen" ,
           "ReconciliationDate",
		   "ReconciliationTime"
	FROM fda."FDAAlertOutputByAdvancedSegmentLevel2"
	WHERE   "FDAAlertRulesId" = "InFDAAlertRulesId"
	AND "FDAAlertOutputId" = "InFDAAlertRulesRunId") b
	ON b."ConcatSegment"= a."TargetSegmentValue"

	WHEN MATCHED AND b."TargetValuePosition" =  'TGTVAL1' THEN 
	UPDATE SET
		"TargetValueGreen" = b."TargetValueGreen",
		"TargetValueRed" = b."TargetValueRed",
		"LastUpdatedDate" = b."ReconciliationDate"
	WHEN NOT MATCHED THEN 
		INSERT  ("FDAAlertRulesId","TargetSegmentValue","TargetValuePosition","TargetValueGreen",
									"TargetValueRed","LastUpdatedDate")
									VALUES(
									b."FDAAlertRulesId",
									b."ConcatSegment",
									b."TargetValuePosition",
									b."TargetValueGreen",
									b."TargetValueRed" ,
           							b."ReconciliationDate"
									); */

   END IF;	
  END IF;	
  
  
  	IF "lvAllowNewSegmentInd" = 'N' AND ("lvAlertType" = 'SourceTargetCount' OR "lvAlertType" = 'SourceTargetValue') THEN 
	
	RAISE NOTICE 'Value: % ','Allow New Segment';
	
    DELETE 
    FROM fda."FDAAlertOutputByAdvancedSegmentLevel2" 
    WHERE "SourceSegment1"||'~'||"SourceSegment2"||'~'||"SourceSegment3"||'~'||"SourceSegment4"||'~'||"SourceSegment5" NOT IN 
                       (SELECT "PriorSourceSegment"
                        FROM (SELECT "SourceSegment1"||'~'||"SourceSegment2"||'~'||"SourceSegment3"||'~'||"SourceSegment4"||'~'||"SourceSegment5" AS "SourceSegment"
                              FROM fda."FDAAlertOutputByAdvancedSegmentLevel2"
                              WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
								AND "FDAAlertOutputId" = "InFDAAlertRulesRunId") a
                        RIGHT JOIN (SELECT "SourceSegment1"||'~'||"SourceSegment2"||'~'||"SourceSegment3"||'~'||"SourceSegment4"||'~'||"SourceSegment5" AS "PriorSourceSegment"
                                    FROM fda."FDAAlertOutputByAdvancedSegmentLevel2"
                                    WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
                                        AND "FDAAlertOutputId" = "lvPreviousAlertRulesRunId") b
                          ON a."SourceSegment"= b."PriorSourceSegment" )
    AND "FDAAlertRulesId" = "InFDAAlertRulesId"
    AND "FDAAlertOutputId" = "InFDAAlertRulesRunId";
	
	/*DELETE 
    FROM fda."FDAAlertOutputByAdvancedSegmentLevel2" 
    WHERE "TargetSegment1"||'~'||"TargetSegment2"||'~'||"TargetSegment3"||'~'||"TargetSegment4"||'~'||"TargetSegment5" NOT IN 
                       (SELECT "PriorSourceSegment"
                          FROM (SELECT "TargetSegment1"||'~'||"TargetSegment2"||'~'||"TargetSegment3"||'~'||"TargetSegment4"||'~'||"TargetSegment5" AS "SourceSegment"
                                  FROM fda."FDAAlertOutputByAdvancedSegmentLevel2"
                                  WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
                                    AND "FDAAlertOutputId" = "InFDAAlertRulesRunId") a
                        RIGHT JOIN (SELECT "TargetSegment1"||'~'||"TargetSegment2"||'~'||"TargetSegment3"||'~'||"TargetSegment4"||'~'||"TargetSegment5" AS "PriorSourceSegment"
                                      FROM fda."FDAAlertOutputByAdvancedSegmentLevel2"
                                      WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
                                        AND "FDAAlertOutputId" = "lvPreviousAlertRulesRunId") b
                          ON a."SourceSegment"= b."PriorSourceSegment" )
    AND "FDAAlertRulesId" = "InFDAAlertRulesId"
    AND "FDAAlertOutputId" = "InFDAAlertRulesRunId";*/
	
	ELSE IF "lvAllowNewSegmentInd" = 'N' AND ("lvAlertType" = 'TargetCount'  OR "lvAlertType" = 'TargetValue') THEN 
	
	DELETE 
    FROM fda."FDAAlertOutputByAdvancedSegmentLevel2" 
    WHERE "TargetSegment1"||'~'||"TargetSegment2"||'~'||"TargetSegment3"||'~'||"TargetSegment4"||'~'||"TargetSegment5" NOT IN 
                       (SELECT "PriorSourceSegment"
                          FROM (SELECT "TargetSegment1"||'~'||"TargetSegment2"||'~'||"TargetSegment3"||'~'||"TargetSegment4"||'~'||"TargetSegment5" AS "SourceSegment"
                                  FROM fda."FDAAlertOutputByAdvancedSegmentLevel2"
                                  WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
                                    AND "FDAAlertOutputId" = "InFDAAlertRulesRunId"
									AND "SegmentValues" = "InSegmentValues") a
                        RIGHT JOIN (SELECT "TargetSegment1"||'~'||"TargetSegment2"||'~'||"TargetSegment3"||'~'||"TargetSegment4"||'~'||"TargetSegment5" AS "PriorSourceSegment"
                                      FROM fda."FDAAlertOutputByAdvancedSegmentLevel2"
                                      WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
                                        AND "FDAAlertOutputId" = "lvPreviousAlertRulesRunId"
										AND "SegmentValues" = "InSegmentValues") b
                          ON a."SourceSegment"= b."PriorSourceSegment" )
    AND "FDAAlertRulesId" = "InFDAAlertRulesId"
    AND "FDAAlertOutputId" = "InFDAAlertRulesRunId"
	AND "SegmentValues" = "InSegmentValues";
	
	END IF;
	END IF;
  
 END IF;	
RAISE NOTICE 'Value: % ','111';
--PRINT('11111')
/*
(SELECT "VALUE",
							    REVERSE(SPLIT_PART(REPLACE(REVERSE(LEFT("VALUE",STRPOS("VALUE",'=')-1)), '^', '.'),'.', 1)) "TargetSegmentName1",
								REVERSE(SPLIT_PART(REPLACE(REVERSE(LEFT("VALUE",STRPOS("VALUE",'=')-1)), '^', '.'),'.', 2)) "TargetSegmentName2",
								REVERSE(SPLIT_PART(REPLACE(REVERSE(LEFT("VALUE",STRPOS("VALUE",'=')-1)), '^', '.'),'.', 3)) "TargetSegmentName3",
								REVERSE(SPLIT_PART(REPLACE(REVERSE(LEFT("VALUE",STRPOS("VALUE",'=')-1)), '^', '.'),'.', 4)) "TargetSegmentName4",
								REVERSE(SPLIT_PART(REPLACE(REVERSE(LEFT("VALUE",STRPOS("VALUE",'=')-1)), '^', '.'),'.', 5)) "TargetSegmentName5",
							    RIGHT("VALUE",LENGTH("VALUE")- STRPOS("VALUE",'=')) "TargetValue"
						 FROM UNNEST(STRING_TO_ARRAY("InTargetValue", '~')) "VALUE" 
						 WHERE "VALUE" IS NOT NULL  
						 ) TargetSegmentDetails   --Fetching Data from Target String
-- SELECT RunId for the alert that is in PENDING status
	SELECT @InFDAAlertRulesRunId = FDAAlertOutputId
	FROM fda.FDAAlertOutput a
	WHERE a.CurrentAlertStatus = 'PENDING'
	AND a.FDAAlertRulesId = @InFDAAlertRulesId;
*/

-- Alert Output Status
 "lvSeverity" := (SELECT LEAST(MIN("ColorBasedoThreasold1"),
                               MIN("ColorBasedoThreasold2"),
			                   MIN("ColorBasedoThreasold3"),
							   MIN("ColorBasedoThreasold4"),
			                   MIN("ColorBasedoThreasold5"),
							   MIN("ColorBasedoThreasold6"),
							   MIN("ColorBasedoThreasold7"),
							   MIN("ColorBasedoThreasold8"),
							   MIN("ColorBasedoThreasold9"),
							   MIN("ColorBasedoThreasold10"),
							   MIN("ColorBasedoThreasold11"),
							   MIN("ColorBasedoThreasold12"),
							   MIN("ColorBasedoThreasold13"),
							   MIN("ColorBasedoThreasold14"),
							   MIN("ColorBasedoThreasold15"),
							   MIN("ColorBasedoThreasold16"),
							   MIN("ColorBasedoThreasold17"),
							   MIN("ColorBasedoThreasold18"),
							   MIN("ColorBasedoThreasold19"),
							   MIN("ColorBasedoThreasold20"))
	             FROM fda."FDAAlertOutputByAdvancedSegmentLevel2" 
                 WHERE "FDAAlertOutputId" = "InFDAAlertRulesRunId"
				 AND "SegmentValues" = "InSegmentValues"
				   AND "TargetSegment1" NOT IN (SELECT "TargetSegmentValue1" 
	                                            FROM fda."FDAAlertRulesTargetSegmentValue"
									            WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
									              AND "CheckedStatus" != 'true'));

-- Update the alert Severity with status to COMPLETE
RAISE NOTICE 'SegmentCount: % ',"InSegmentCount";
RAISE NOTICE 'SourceSegmentCount: % ',NULLIF(SPLIT_PART("InSegmentCount",'|',1),'')::bigint;
RAISE NOTICE 'TargetSegmentCount: % ',NULLIF(SPLIT_PART("InSegmentCount",'|',2),'')::bigint;
RAISE NOTICE 'UTTAM: % ',"lvThresholdInfo";

	UPDATE fda."FDAAlertOutputSecondary"	
	SET "CurrentAlertStatus" = 'COMPLETE',
	    "Severity" = COALESCE("lvSeverity",9),
		"AlertInd" = (CASE WHEN "lvSeverity" IN (1,2) THEN 'Y' ELSE 'N' END),
		"SourceSegmentCount" = NULLIF(SPLIT_PART("InSegmentCount",'|',1),'')::bigint,
		"TargetSegmentCount" = NULLIF(SPLIT_PART("InSegmentCount",'|',2),'')::bigint,
	    "UpdatedDateTime" = CURRENT_TIMESTAMP,
        "UpdatedBy" = CURRENT_USER,
		"ThresholdType" = "lvThresholdType",
		"ThresholdInfo" = "lvThresholdInfo"
		--"AlertStatus" = (CASE WHEN "lvSeverity" IN (1,2) THEN 'Open'
							--ELSE 'AllOk' END)
	WHERE "FDAAlertRulesId" =  "InFDAAlertRulesId"
	AND "FDAAlertOutputId" = "InFDAAlertRulesRunId"
	AND  "SegmentValue" = "InSegmentValues";
	
	
UPDATE fda."FDAAlertOutputByAdvancedSegmentLevel2"-------ALERT COLUMN AND SEGMENT DATA
SET "SegmentInfo" = "lvSegmentInfo",
	"ColumnInfo" = "lvColumnInfo"
WHERE "FDAAlertOutputId" = "InFDAAlertRulesRunId"
AND "FDAAlertRulesId" = "InFDAAlertRulesId"
AND "SegmentValues" = "InSegmentValues";

RAISE NOTICE 'Column Data: % ','ALERT COLUMN AND SEGMENT DATA INSERTED';

	IF "lvSeverity" = 1
	THEN
		  "OutAlertStatus" := 'CRITICAL';
		   "OutSeverity" := '1';
	
    ELSE IF "lvSeverity" = 2
	THEN
		 "OutAlertStatus" := 'MEDIUM CRITICAL';
		 "OutSeverity" := '2';
	
	ELSE IF ("lvSeverity" != 1 AND "lvSeverity" != 2 )
	THEN
		 "OutAlertStatus" := 'OK';
		 "OutSeverity" := '9';
	END IF;
   END IF;
  END IF;
  END IF;

	RETURN "lvSeverity";

------------------------------------------------------------------------- END OF ADVANCED -----------------------------------------------------------------------
RAISE NOTICE 'Value: % ',"OutLocalAlertStatus";
RAISE NOTICE 'Value: % ',"OutLocalSeverity";
RAISE NOTICE 'Value: % ','End Of ADVANCED';

ELSE

RAISE NOTICE 'Value: % ','BEGINNING OF SIMPLE';
--------------------------------------------------------------------- BEGINNING OF SIMPLE --------------------------------------------------------------

SELECT  a."AlertTypeInd"
INTO "lvAlertType" 
FROM fda."FDAAlertRules" a
WHERE "FDAAlertRulesId" =  "InFDAAlertRulesId";

IF ("InSourceValue" = '' AND "InTargetValue" = '')  --if there is no Source and Target Value
THEN
RAISE NOTICE 'Value: % ','NO DATA';

				INSERT INTO fda."FDAAlertOutputByAdvancedSegmentLevel2"	
				( 
					"FDAAlertOutputId",
					"FDAAlertRulesId",
					"SegmentValues",
					"SourceSegment1",
					"SourceValue1",
					"TargetSegment1",
					"TargetValue1",
					"Threshold",
					"ReconciliationDate",
					"ReconciliationTime",
					"ColorBasedoThreasold1",
					"AlertLifeCycleStatus",
					"CreatedDateTime",
					"UpdatedDateTime",
					"UpdatedBy"         
				)
            	SELECT  "InFDAAlertRulesRunId",--FDAAlertOutputId
            		    a."FDAAlertRulesId",   --FDAAlertRulesId
						"InSegmentValues",
            		    'TOTAL',              --SegmentSourceName
            		    0,                    --SourceValue
            		    'TOTAL',              --SegmentTargetName
            		    0,                    --TargetValue
            		    CAST(a."LowerThresholdValue" AS NUMERIC(17,6)),  --Threshold
            		    CURRENT_DATE,            --ReconciliationDate
            		    TO_CHAR(CURRENT_TIMESTAMP, 'hh12:mi AM'), --ReconciliationTime
            		    1,                    --Severity
            		    'OPEN',               --AlertLifeCycleStatus
						CURRENT_TIMESTAMP,	--"CreatedDateTime"
            		    CURRENT_TIMESTAMP,         --UpdatedDateTime
            		    a."UpdatedBy"         --UpdatedBy
               FROM fda."FDAAlertRules" a
            WHERE a."FDAAlertRulesId" = "InFDAAlertRulesId" ;
	

ELSE

-- If there is no segment then segment is "TOTAL"
IF STRPOS("InSourceValue",'=') = 0 AND STRPOS("InTargetValue",'=') = 0
THEN
	"InSourceValue" := 'TOTAL=';
	"InTargetValue" := 'TOTAL=';
END IF;
/*IF STRPOS("InTargetValue",'=') = 0 
THEN
	"InTargetValue" := 'TOTAL=';
END IF;*/

IF "lvAlertType" = 'SourceTargetCount' OR "lvAlertType" = 'SourceTargetValue' AND "lvTargetSystemType" != 'SAPBW'-- Source Target Comparison
THEN
 
  RAISE NOTICE 'lvTargetSystemType != % ',"lvTargetSystemType";
	-- Insert INTO Segment
			INSERT INTO fda."FDAAlertOutputByAdvancedSegmentLevel2"	
			( 
				"FDAAlertOutputId",
				"FDAAlertRulesId",
				"SegmentValues",
				"SourceSegment1",
				"SourceValue1",
				"TargetSegment1",
				"TargetValue1",
				"Threshold",
				"ReconciliationDate",
				"ReconciliationTime",
				"ColorBasedoThreasold1",
				"AlertLifeCycleStatus",
				"CreatedDateTime",
				"UpdatedDateTime",
				"UpdatedBy"         
			)
			SELECT 
				"InFDAAlertRulesRunId"
				,a."FDAAlertRulesId"
				,"InSegmentValues"
				,COALESCE(SourceTargetComparison."SourceSegmentName",SourceTargetComparison."TargetSegmentName")
				,COALESCE(CAST(SourceTargetComparison."SourceValue" AS NUMERIC(36,11)),0) "SourceValue"
				,SourceTargetComparison."TargetSegmentName"
				,COALESCE(CAST(SourceTargetComparison."TargetValue" AS NUMERIC(36,11)),0) "TargetValue"
				,CAST(a."LowerThresholdValue" AS NUMERIC(17,6))
				,CURRENT_DATE
				,TO_CHAR(CURRENT_TIMESTAMP, 'hh12:mi AM') -- ReconciliationTime
				,fda."fn_GetAlertSeviorityBasedonThreashold"
				(
					COALESCE(CAST(SourceTargetComparison."SourceValue" AS NUMERIC),0),			-- Source value from Last 10 run against which to be compared 
					COALESCE(CAST(SourceTargetComparison."TargetValue"AS NUMERIC),0),			-- Target value from from current run that is to be compared  
					0,
					0,
					"lvThresholdType",
					'',						
					0,          	-- "Last Value" or " Last 10 Run"
					"InFDAAlertRulesId",
					a."AlertTypeInd",
					1
				) SeveritySeverity
				,'OPEN'
				,CURRENT_TIMESTAMP
				,CURRENT_TIMESTAMP
				,a."UpdatedBy"
			FROM fda."FDAAlertRules" a
			/*
			INNER JOIN fda.FDASystems d
				ON a.FDASystemSourceId = d.FDASystemsId
			INNER JOIN fda.FDASystems e
				ON a.FDASystemTargeteId = e.FDASystemsId
			INNER JOIN fda.FDASystemObjects h
				ON a.FDASourceTableId = h.FDASystemObjectsId
			INNER JOIN fda.FDAApplications i
				ON a.ApplicationId = i.FDAApplicationsId */
			CROSS JOIN 
				(SELECT "SourceSegmentName",
						"TargetSegmentName",
						"SourceValue",
						"TargetValue"
				FROM (SELECT "VALUE",
							LEFT("VALUE",STRPOS("VALUE",'=')-1) "SourceSegmentName",
							(CASE WHEN RIGHT("VALUE",LENGTH("VALUE") - STRPOS("VALUE",'=')) <= '' THEN '0'
								-- ELSE CONVERT(NUMERIC(32,19),RIGHT("VALUE",LENGTH("VALUE") - STRPOS("VALUE",'=',))) 
							ELSE RIGHT("VALUE",LENGTH("VALUE") - STRPOS("VALUE",'=')) 
							END) "SourceValue"
					FROM UNNEST(STRING_TO_ARRAY("InSourceValue", '~')) "VALUE"
					WHERE "VALUE" IS NOT NULL ) SourceSegmentValue
	
						FULL JOIN 
							(SELECT "VALUE",
								LEFT("VALUE",STRPOS("VALUE",'=')-1) "TargetSegmentName",
								(CASE WHEN RIGHT("VALUE",LENGTH("VALUE") - STRPOS("VALUE",'=')) <= '' THEN '0' 
									--ELSE CONVERT(NUMERIC(32,19),RIGHT("VALUE",LENGTH("VALUE")- STRPOS("VALUE",'='))) 
								ELSE RIGHT("VALUE",LENGTH("VALUE") - STRPOS("VALUE",'=')) 
								END) "TargetValue"
							FROM UNNEST(STRING_TO_ARRAY("InTargetValue", '~')) "VALUE"
							WHERE "VALUE" IS NOT NULL ) TargetSegmentDetails
	
				ON SourceSegmentValue."SourceSegmentName" = TargetSegmentDetails."TargetSegmentName"
			) SourceTargetComparison
		WHERE a."FDAAlertRulesId" = "InFDAAlertRulesId"  ;
		
		
ELSE IF "lvAlertType" = 'SourceTargetCount' OR "lvAlertType" = 'SourceTargetValue' AND "lvTargetSystemType" = 'SAPBW'-- Source Target Comparison
THEN
 
 RAISE NOTICE 'lvTargetSystemType= % ',"lvTargetSystemType";
	-- Insert INTO Segment
			INSERT INTO fda."FDAAlertOutputByAdvancedSegmentLevel2"	
			( 
				"FDAAlertOutputId",
				"FDAAlertRulesId",
				"SegmentValues",
				"SourceSegment1",
				"SourceValue1",
				"TargetSegment1",
				"TargetValue1",
				"Threshold",
				"ReconciliationDate",
				"ReconciliationTime",
				"ColorBasedoThreasold1",
				"AlertLifeCycleStatus",
				"CreatedDateTime",
				"UpdatedDateTime",
				"UpdatedBy"         
			)
			SELECT 
				"InFDAAlertRulesRunId"
				,a."FDAAlertRulesId"
				,"InSegmentValues"
				,COALESCE(SourceTargetComparison."SourceSegmentName",SourceTargetComparison."TargetSegmentName")
				,COALESCE(CAST(SourceTargetComparison."SourceValue" AS NUMERIC(36,11)),0) "SourceValue"
				,SourceTargetComparison."TargetSegmentName"
				,COALESCE(CAST(SourceTargetComparison."TargetValue" AS NUMERIC(36,11)),0) "TargetValue"
				,CAST(a."LowerThresholdValue" AS NUMERIC(17,6))
				,CURRENT_DATE
				,TO_CHAR(CURRENT_TIMESTAMP, 'hh12:mi AM') -- ReconciliationTime
				,fda."fn_GetAlertSeviorityBasedonThreashold"
				(
					COALESCE(CAST(SourceTargetComparison."SourceValue" AS NUMERIC),0),			-- Source value from Last 10 run against which to be compared 
					COALESCE(CAST(SourceTargetComparison."TargetValue"AS NUMERIC),0),			-- Target value from from current run that is to be compared  
					0,
					0,
					"lvThresholdType",
					'',						
					0,          	-- "Last Value" or " Last 10 Run"
					"InFDAAlertRulesId",
					a."AlertTypeInd",
					1
				) SeveritySeverity
				,'OPEN'
				,CURRENT_TIMESTAMP
				,CURRENT_TIMESTAMP
				,a."UpdatedBy"
			FROM fda."FDAAlertRules" a
			/*
			INNER JOIN fda.FDASystems d
				ON a.FDASystemSourceId = d.FDASystemsId
			INNER JOIN fda.FDASystems e
				ON a.FDASystemTargeteId = e.FDASystemsId
			INNER JOIN fda.FDASystemObjects h
				ON a.FDASourceTableId = h.FDASystemObjectsId
			INNER JOIN fda.FDAApplications i
				ON a.ApplicationId = i.FDAApplicationsId */
			CROSS JOIN 
				(SELECT "SourceSegmentName",
						"TargetSegmentName",
						"SourceValue",
						"TargetValue"
				FROM (SELECT "VALUE",
							LEFT("VALUE",STRPOS("VALUE",'=')-1) "SourceSegmentName",
							(CASE WHEN RIGHT("VALUE",LENGTH("VALUE") - STRPOS("VALUE",'=')) <= '' THEN '0'
								-- ELSE CONVERT(NUMERIC(32,19),RIGHT("VALUE",LENGTH("VALUE") - STRPOS("VALUE",'=',))) 
							ELSE RIGHT("VALUE",LENGTH("VALUE") - STRPOS("VALUE",'=')) 
							END) "SourceValue"
					FROM UNNEST(STRING_TO_ARRAY("InSourceValue", '~')) "VALUE"
					WHERE "VALUE" IS NOT NULL ) SourceSegmentValue
	
						LEFT JOIN 
							(SELECT "VALUE",
								LEFT("VALUE",STRPOS("VALUE",'=')-1) "TargetSegmentName",
								(CASE WHEN RIGHT("VALUE",LENGTH("VALUE") - STRPOS("VALUE",'=')) <= '' THEN '0' 
									--ELSE CONVERT(NUMERIC(32,19),RIGHT("VALUE",LENGTH("VALUE")- STRPOS("VALUE",'='))) 
								ELSE RIGHT("VALUE",LENGTH("VALUE") - STRPOS("VALUE",'=')) 
								END) "TargetValue"
							FROM UNNEST(STRING_TO_ARRAY("InTargetValue", '~')) "VALUE"
							WHERE "VALUE" IS NOT NULL ) TargetSegmentDetails
	
				ON SourceSegmentValue."SourceSegmentName" = TargetSegmentDetails."TargetSegmentName"
			) SourceTargetComparison
		WHERE a."FDAAlertRulesId" = "InFDAAlertRulesId"  ;		
		

ELSE IF "lvAlertType" = 'TargetCount'  OR "lvAlertType" = 'TargetValue' 
THEN

	-- Compare Target against Prset Value

	RAISE NOTICE 'Value: % ','IN TARGET ONLY';
				SELECT "FDAAlertOutputId" 
				INTO "InFDAAlertRulesRunIdPrevious"
				FROM (  
				        SELECT "FDAAlertOutputId",
							   ROW_NUMBER() OVER (ORDER BY "FDAAlertOutputId" DESC) "rownum"
						FROM fda."FDAAlertOutput"	
						WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
					 ) b11
				WHERE b11."rownum" = 2;

		-- Insert INTO Segment
		RAISE NOTICE 'Value: % ',"InFDAAlertRulesRunIdPrevious";
		RAISE NOTICE 'Value: % ','123';
		
		
		INSERT INTO fda."FDAAlertOutputByAdvancedSegmentLevel2"	
		 ( 
		   "FDAAlertOutputId",
           "FDAAlertRulesId",
		   "SegmentValues",
           "SourceSegment1",
		   "SourceValue1",
		   "PriorTargetValue",
		   "TargetSegment1",
		   "TargetValue1",
		   "Threshold",
		   "ReconciliationDate",
           "ReconciliationTime",
		   "ColorBasedoThreasold1",
		   "AlertLifeCycleStatus",
		   "CreatedDateTime",
           "UpdatedDateTime",
           "UpdatedBy"         
		 )
		SELECT 
			"InFDAAlertRulesRunId"
			,a."FDAAlertRulesId"
			,"InSegmentValues"
			,COALESCE(SourceTargetComparison."TargetSegmentName",SourceTargetComparison."SourceSegmentName") "Segment"
			,ROUND(SourceTargetComparison."SourceValue"::NUMERIC,0) "SourceValue"
			,ROUND(SourceTargetComparison."SourceValue"::NUMERIC,0) PriorTargetValue
--			,NULL "PriorPriorTargetValue"
			,SourceTargetComparison."TargetSegmentName"
			,ROUND(SourceTargetComparison."TargetValue"::NUMERIC,0)
			,a."LowerThresholdValue"::DECIMAL(17,6)
			,CURRENT_DATE
			,TO_CHAR(CURRENT_TIMESTAMP, 'hh12:mi AM') 	  -- ReconciliationTime
			,(CASE WHEN COALESCE("AlertRunCount",0) = 0 AND UPPER("lvBaseLineInd") <> 'FIXEDVALUE' THEN 9  -- Because it is first Run
				   ELSE fda."fn_GetAlertSeviorityBasedonThreashold"
					(
						SourceTargetComparison."SourceValue",			-- Source value from Last 10 run against which to be compared 
						SourceTargetComparison."TargetValue",			-- Target value from from current run that is to be compared 
						SourceTargetComparison."SourceTargetUpperDiffLimit",
						SourceTargetComparison."SourceTargetLowerDiffLimit",
						"lvThresholdType",
						a."BaseLineValueType",							-- "Last Value" or " Last 10 Run"
						a."BaseLineValue"::NUMERIC,
						"InFDAAlertRulesId",
						a."AlertTypeInd",
						1
					)
				  END) SeveritySeverity
			,'OPEN'
			,CURRENT_TIMESTAMP
			,CURRENT_TIMESTAMP
			,a."UpdatedBy"
		FROM fda."FDAAlertRules" a

		CROSS JOIN 
		(SELECT 
			LastXDaysAlertRuns."SourceSegmentName",
			
			TargetSegmentDetails."TargetSegmentName" AS "TargetSegmentName",
			
			COALESCE(LastXDaysAlertRuns."SourceTargetUpperDiffLimit",0) AS "SourceTargetUpperDiffLimit",
			
			COALESCE(LastXDaysAlertRuns."SourceTargetLowerDiffLimit",0) AS "SourceTargetLowerDiffLimit",
			
			LastXDaysAlertRuns."SourceValue",
			
			TargetSegmentDetails."TargetValue"
		FROM
			(
				SELECT 
					LastXDaysAlertRuns."FDAAlertRulesId",
					LastXDaysAlertRuns."TargetSegmentName" AS "SourceSegmentName",
					LastXDaysAlertRuns."TargetValue" AS "SourceValue",
					UserIgnoreAlerts."SourceTargetUpperDiffLimit",
					UserIgnoreAlerts."SourceTargetLowerDiffLimit"
				FROM 
					(
						SELECT 
								a1."FDAAlertRulesId", -- You would ignore the most recent for which you are comoaring
								COALESCE(a1."TargetSegment1", a1."SourceSegment1") "TargetSegmentName",
								a1."TargetValue1" "TargetValue"
					
								--------(CASE WHEN a."BaseLineValueType" = 'AvgOfLast' THEN AVG(a1."TargetValue") ELSE MAX(CASE WHEN RowLimit."RowNum" = 1 THEN a1."TargetValue" ELSE NULL END) END)  "TargetValue"
						FROM fda."FDAAlertOutputByAdvancedSegmentLevel2" a1
						INNER JOIN fda."FDAAlertRules" a
							ON a1."FDAAlertRulesId" =  a."FDAAlertRulesId"
						WHERE a1."FDAAlertRulesId" = "InFDAAlertRulesId"
						AND "SegmentValues" = "InSegmentValues"
						AND a1."FDAAlertOutputId" = "lvPreviousAlertRulesRunIdTarget"
						/*SELECT 
							a1."FDAAlertRulesId", -- You would ignore the most recent for which you are comoaring
							COALESCE(a1."SegmentTargetName", a1."SegmentSourceName") "TargetSegmentName",
							(fda."fn_FetchFDAAlertAvgOfLastXAndLastValue"(
											a1."FDAAlertRulesId",			 --"InFDAAlertRulesId" integer,
											CONCAT(COALESCE(a1."SegmentTargetName", a1."SegmentSourceName")), -- "InTargetSegmentConcatenated" text,
											1,	   -- "InThreholdPosition" integer,
											(CASE WHEN a."BaseLineValueType" = 'AvgOfLast' THEN "lvBaseLineValue" ELSE 1 END))) "TargetValue"
											
							--------(CASE WHEN a."BaseLineValueType" = 'AvgOfLast' THEN AVG(a1."TargetValue") ELSE MAX(CASE WHEN RowLimit."RowNum" = 1 THEN a1."TargetValue" ELSE NULL END) END)  "TargetValue"
						FROM fda."FDAAlertOutputBySegment" a1
						INNER JOIN fda."FDAAlertRules" a
						ON a1."FDAAlertRulesId" =  a."FDAAlertRulesId"
						WHERE a1."FDAAlertRulesId" = "InFDAAlertRulesId"
						GROUP BY a1."FDAAlertRulesId",
						        a."BaseLineValueType",
								COALESCE(a1."SegmentTargetName", a1."SegmentSourceName")
						--GROUP BY a1."FDAAlertRulesId",
							( SELECT "FDAAlertRulesId","FDAAlertOutputId","Severity",
									ROW_NUMBER() OVER (ORDER BY "FDAAlertOutputId" DESC) "RowNum"								          
							FROM fda."FDAAlertOutput" 
							WHERE "FDAAlertRulesId" = "InFDAAlertRulesId" 
								AND "Severity" NOT IN (1)
								AND COALESCE("AlertInd",'') IN ('N','')
							) RowLimit,
							fda."FDAAlertRules" a
						WHERE a1."FDAAlertOutputId" = RowLimit."FDAAlertOutputId"
							AND a1."FDAAlertRulesId" =  a."FDAAlertRulesId"
							AND a1."FDAAlertRulesId" = "InFDAAlertRulesId"
							AND RowLimit."RowNum" <= (CASE WHEN UPPER("lvBaseLineInd") = 'LASTVALUE' THEN 1 ELSE "lvBaseLineValue" END)
						GROUP BY RowLimit."FDAAlertRulesId",a."BaseLineValueType",a1."FDAAlertRulesId"
								COALESCE(a1."SegmentTargetName", a1."SegmentSourceName")*/
					
					) LastXDaysAlertRuns
				LEFT OUTER JOIN
					(
						SELECT 
							a0."FDAAlertRulesId",
							COALESCE(a1."TargetSegment1", a1."SourceSegment1") "TargetSegmentName",
							MAX(CASE WHEN UPPER("lvBaseLineInd") = 'LASTVALUE' THEN (a1."TargetValue1" - a1."PriorTargetValue") ELSE (a1."TargetValue1" - a1."SourceValue1") END) "SourceTargetUpperDiffLimit",
							
							MIN(CASE WHEN UPPER("lvBaseLineInd") = 'LASTVALUE' THEN (a1."TargetValue1" - a1."PriorTargetValue") ELSE (a1."TargetValue1" - a1."SourceValue1") END) "SourceTargetLowerDiffLimit"
							
						FROM fda."FDAAlertOutput" a0,
							fda."FDAAlertOutputByAdvancedSegmentLevel2" a1,
							( SELECT "FDAAlertOutputId","Severity",
											ROW_NUMBER() OVER (ORDER BY "FDAAlertOutputId" DESC) "RowNum"								          
									FROM fda."FDAAlertOutput"	
									WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
										AND "Severity" NOT IN (1)
							) RowLimit
						WHERE a0."FDAAlertOutputId" =  a1."FDAAlertOutputId"
						AND a0."FDAAlertRulesId" =  a1."FDAAlertRulesId"
						AND a0."FDAAlertOutputId" = RowLimit."FDAAlertOutputId"
						AND "SegmentValues" = "InSegmentValues"
						AND RowLimit."RowNum" <= 5
						AND a0."FDAAlertRulesId" = "InFDAAlertRulesId" 
						AND a0."Severity" NOT IN (1)
						GROUP BY a0."FDAAlertRulesId",
								COALESCE(a1."TargetSegment1", a1."SourceSegment1")
					) UserIgnoreAlerts
				ON 	LastXDaysAlertRuns."FDAAlertRulesId" = UserIgnoreAlerts."FDAAlertRulesId"
				AND LastXDaysAlertRuns."TargetSegmentName" = UserIgnoreAlerts."TargetSegmentName"
			
			) LastXDaysAlertRuns
			
			FULL JOIN 
				(SELECT "VALUE",
					LEFT("VALUE",STRPOS("VALUE",'=')-1) "TargetSegmentName",
					--CONVERT(DECIMAL(32,10),RIGHT(VALUE,LENGTH(VALUE)- STRPOS("VALUE",'=')))
					(CAST (RIGHT("VALUE",LENGTH("VALUE") - STRPOS("VALUE",'=')) AS NUMERIC(32,19))) "TargetValue"
				FROM UNNEST(STRING_TO_ARRAY("InTargetValue" ,'~')) "VALUE"
				WHERE "VALUE" IS NOT NULL
				) TargetSegmentDetails
			ON LastXDaysAlertRuns."SourceSegmentName" = TargetSegmentDetails."TargetSegmentName"
	) SourceTargetComparison
	WHERE a."FDAAlertRulesId" = "InFDAAlertRulesId" ;

	
  END IF;
  END IF;

 END IF;
END IF;

RAISE NOTICE 'Value: % ','11111';
/*
	SELECT RunId for the alert that is in PENDING status
	SELECT @InFDAAlertRulesRunId = FDAAlertOutputId
	FROM fda.FDAAlertOutput a
	WHERE a.CurrentAlertStatus = 'PENDING'
	AND a.FDAAlertRulesId = @InFDAAlertRulesId;
*/
	-- Calculate Alert Output Status
	SELECT MIN("ColorBasedoThreasold1")
	INTO "lvSeverity"
	FROM fda."FDAAlertOutputByAdvancedSegmentLevel2" 
	WHERE "FDAAlertOutputId" = "InFDAAlertRulesRunId"
	AND "SegmentValues" = "InSegmentValues"
	AND "TargetSegment1"  NOT IN (SELECT "TargetSegmentValue1" 
	                                   FROM fda."FDAAlertRulesTargetSegmentValue"
									   WHERE "FDAAlertRulesId" = "InFDAAlertRulesId"
									     AND "CheckedStatus" != 'true');

-- Update the alert RUn status to COMPLETE

RAISE NOTICE 'SegmentCount: % ',"InSegmentCount";
RAISE NOTICE 'SourceSegmentCount: % ',NULLIF(SPLIT_PART("InSegmentCount",'|',1),'')::bigint;
RAISE NOTICE 'TargetSegmentCount: % ',NULLIF(SPLIT_PART("InSegmentCount",'|',2),'')::bigint;
RAISE NOTICE 'UTTAM: % ',"lvThresholdInfo";

	UPDATE fda."FDAAlertOutputSecondary"	
	SET "CurrentAlertStatus" = 'COMPLETE',
	    "Severity" = COALESCE("lvSeverity",9),
		"AlertInd" = (CASE WHEN "lvSeverity" IN (1,2) THEN 'Y' ELSE 'N' END),
		"SourceSegmentCount" = NULLIF(SPLIT_PART("InSegmentCount",'|',1),'')::bigint,
		"TargetSegmentCount" = NULLIF(SPLIT_PART("InSegmentCount",'|',2),'')::bigint,
	    "UpdatedDateTime" = CURRENT_TIMESTAMP,
        "UpdatedBy" = CURRENT_USER,
		"ThresholdType" = "lvThresholdType",
		"ThresholdInfo" = "lvThresholdInfo"
		--"AlertStatus" = (CASE WHEN "lvSeverity" IN (1,2) THEN 'Open'
							--ELSE 'AllOk' END)
	WHERE "FDAAlertRulesId" =  "InFDAAlertRulesId"
	AND "FDAAlertOutputId" = "InFDAAlertRulesRunId"
	AND  "SegmentValue" = "InSegmentValues";
	
	UPDATE fda."FDAAlertOutputByAdvancedSegmentLevel2"-------ALERT COLUMN AND SEGMENT DATA
	SET "SegmentInfo" = "lvSegmentInfo",
		"ColumnInfo" = "lvColumnInfo"
	WHERE "FDAAlertOutputId" = "InFDAAlertRulesRunId"
	AND "FDAAlertRulesId" = "InFDAAlertRulesId"
	AND "SegmentValues" = "InSegmentValues";
	
	RAISE NOTICE 'Column Data: % ','ALERT COLUMN AND SEGMENT DATA INSERTED';

	IF "lvSeverity" = 1
	THEN
		 "OutAlertStatus" := 'CRITICAL';
		 "OutSeverity" := '1';
	
    ELSE IF "lvSeverity" = 2
	THEN
		 "OutAlertStatus" := 'MEDIUM CRITICAL';
		 "OutSeverity" := '2';
	
	ELSE IF ("lvSeverity" != 1 AND "lvSeverity" != 2)
	THEN
		 "OutAlertStatus" := 'OK';
		 "OutSeverity" := '9';
	END IF;
   END IF;
  END IF;
  
  

RETURN "lvSeverity";
 

END IF;
---------------------------------------------------------- END OF SIMPLE --------------------------------------------------------
RAISE NOTICE 'Value: % ','End Of SIMPLE';

END;
--select ROUND(27057.333,0)
$BODY$;
---------------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: fda.Proc_InsertFDAMaintainDatabase(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, refcursor)

-- DROP FUNCTION IF EXISTS fda."Proc_InsertFDAMaintainDatabase"(character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, refcursor);

CREATE OR REPLACE FUNCTION fda."Proc_InsertFDAMaintainDatabase"(
	"InFDASystemsId" character varying,
	"InSystemName" character varying,
	"InSystemOwner" character varying,
	"InSystemAliasName" character varying,
	"InSystemType" character varying,
	"InSystemUser" character varying,
	"InSystemPassword" character varying,
	"InSystemCategoryType" character varying,
	"InUserName" character varying,
	"InConnectionDetails" character varying,
	"InSchema" character varying,
	"InWarehouse" character varying,
	"InRoleName" character varying,
	"InAccountName" character varying,
	"InContainerName" character varying,
	"InAccessKeyID" character varying,
	"InSecretAccessKey" character varying,
	"InBucketName" character varying,
	"InUsageFlag" character varying,
	"InLandscapeName" character varying,
	"InRegion" character varying,
	"InS3BucketLocation" character varying,
	"InPortNumber" character varying,
	"InProjectId" character varying,
	"InClientEmail" character varying,
	"InPrivateKey" character varying,
	"InConnectionOption" character varying,
	"InPassPhrase" character varying,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$

DECLARE "OutFDASystemsId" VARCHAR;
		"ErrorIndId" INT;
		"OutStatusmsg" VARCHAR;
		"lvOrgId" BIGINT;
		"lvOrgName" VARCHAR;
		"lvSystemId" BIGINT;
		"lvUserType" VARCHAR;
	
BEGIN		
	
	SELECT "OrganizationId","UserType"
	INTO "lvOrgId","lvUserType"
	FROM fda."FDAUsers"
	WHERE "U_UserName" = "InUserName";
	
	SELECT "OrganizationName"
    INTO "lvOrgName"
	FROM fda."Organization"
    WHERE "OrganizationId" = "lvOrgId";
		
	IF UPPER("lvUserType") = 'PUBLIC' THEN
	
	    SELECT "FDASystemsId"
		INTO "lvSystemId"
		FROM fda."FDASystems"
		WHERE "SystemAliasName" =  "InSystemAliasName"
			AND "OrganizationId" = "lvOrgId"
			AND "CreatedBy" = "InUserName";
		
	 ELSE
	
	    SELECT "FDASystemsId"
		INTO "lvSystemId"
		FROM fda."FDASystems"
		WHERE "SystemAliasName" =  "InSystemAliasName"
			AND "OrganizationId" = "lvOrgId";
		
	END IF;
	
	
		IF "InFDASystemsId" = '' THEN 
		
			IF COALESCE("lvSystemId",0) > 0 THEN
		
				RAISE EXCEPTION 'System Already Exists!!'; 
				"OutStatusmsg" := 'SYSTEM NAME ALREADY EXISTS';
		
			END IF;
		
			RAISE NOTICE 'NOTICE :%','INSERT';
			
			INSERT INTO fda."FDASystems"
			(
				"SystemName",
				"SystemAliasName",
				"SystemType",
				"SystemUserName",
				"SystemPassword",
				"SystemCategoryType",
				"CreatedBy",
				"CreatedOn",
				"ConnectionDetails",
				"Schema",
				"Warehouse",
				"RoleName",
				"OrganizationId",
				"Organization",
				"AccountName",
				"ContainerName",
				"AccessKeyID",
				"SecretAccessKey",
				"BucketName",
				"UsageFlag",
				"LandscapeName",
				"Region",
				"S3BucketLocation",
				"PortNumber",
				"SystemOwner",
				"ProjectId",
				"ClientEmail",  
				"PrivateKey",
				"RowCountOutlierInd",
				"FreshnessOutlierInd",
				"RuleOutllierInd",
				"ConnectionOption",
				"PassPhrase"
				
			)
			VALUES
			(
				COALESCE(NULLIF("InSystemName",''),"InSystemAliasName"),
				"InSystemAliasName",
				"InSystemType",
				"InSystemUser",
				"InSystemPassword",
				"InSystemCategoryType",
				"InUserName",
				CURRENT_TIMESTAMP,
				"InConnectionDetails",
				"InSchema",
				"InWarehouse",
				"InRoleName",
				"lvOrgId",
				"lvOrgName",
				"InAccountName",
				"InContainerName",
				"InAccessKeyID"   , 
				"InSecretAccessKey",
				"InBucketName",
				"InUsageFlag",
				"InLandscapeName",
				"InRegion",
				"InS3BucketLocation",
				NULLIF("InPortNumber",'')::bigint,
				"InSystemOwner",
				"InProjectId",
				"InClientEmail",  
				"InPrivateKey",
				'Y',
				'Y',
				'Y',
				"InConnectionOption",
				"InPassPhrase"
			); 
			
			SELECT "FDASystemsId"
			INTO "OutFDASystemsId"
			FROM fda."FDASystems"
			WHERE "SystemAliasName" = "InSystemAliasName"
				AND "OrganizationId" = "lvOrgId"
				AND "CreatedBy" = "InUserName";
				
			"OutStatusmsg" := 'SUCCESS';	
			
			OPEN $29 FOR
				SELECT "OutFDASystemsId","OutStatusmsg";

			RETURN NEXT $29;
		
		ELSE IF "InFDASystemsId" > '' THEN
		
			RAISE NOTICE 'ErrorIndId :%','UPDATE';
			RAISE NOTICE 'InProjectId :%',"InProjectId";
			
			UPDATE fda."FDASystems"
			SET "SystemName" = "InSystemName",
				"SystemType" = "InSystemType",
				"SystemUserName" = "InSystemUser",
				"CreatedBy" = "InUserName",
				"SystemPassword" = "InSystemPassword",
				"SystemCategoryType" = "InSystemCategoryType",
				"LastUpdatedBy" = "InUserName",
				"LastUpdatedOn" = CURRENT_TIMESTAMP,
				"ConnectionDetails" = "InConnectionDetails",
				"Schema" = "InSchema",
				"Warehouse" = "InWarehouse",
				"RoleName" = "InRoleName",
				"OrganizationId" = "lvOrgId",
				"Organization" = "lvOrgName",
				"AccountName" = "InAccountName",
				"ContainerName" = "InContainerName",
				"AccessKeyID" = "InAccessKeyID",
				"SecretAccessKey" = "InSecretAccessKey",
				"BucketName" = "InBucketName",
				"UsageFlag" = "InUsageFlag",
				"LandscapeName" = "InLandscapeName",
				"Region" = "InRegion",
				"S3BucketLocation" = "InS3BucketLocation",
				"PortNumber" = NULLIF("InPortNumber",'')::bigint,
				"SystemOwner" = "InSystemOwner",
				"ProjectId" = "InProjectId",
				"ClientEmail" = "InClientEmail",  
				"PrivateKey" = "InPrivateKey",
				"ConnectionOption" = "InConnectionOption",
				"PassPhrase" = "InPassPhrase"
			WHERE "FDASystemsId" =  CAST("InFDASystemsId" AS BIGINT);
			
			"OutStatusmsg" := 'SUCCESS';
			
			OPEN $29 FOR
				SELECT "InFDASystemsId" AS "OutFDASystemsId","OutStatusmsg";
			RETURN NEXT $29;
	
		END IF;	
		END IF;
------------------------------------
	
/*OPEN $9 FOR
SELECT "OutFDASystemsId";
RETURN NEXT $9;*/
	
END;
$BODY$;
---------------------------------------------------------------------------------------------------------------
-- FUNCTION: fda.Proc_ListMasterRuleObjectDetails(integer, integer, character varying, character varying, character varying, character varying, character varying, character varying, refcursor, refcursor)

-- DROP FUNCTION IF EXISTS fda."Proc_ListMasterRuleObjectDetails"(integer, integer, character varying, character varying, character varying, character varying, character varying, character varying, refcursor, refcursor);

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
											b."MasterRuleId",
											b."AlertWhenTrendIncrease"
										FROM fda."FDASystemObjects" a
										INNER JOIN fda."FDASystemObjectFields" b
										ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
										WHERE b."FDASystemObjectFieldsId" IN (SELECT 
																					DISTINCT "FDASystemObjectFieldsId"
																				FROM fda."FDASystemObjectFields"
																				where "MasterRuleId" = ''' ,"InMasterRuleId", ''')
										)c
							ON a."FDADataQualityRulesId" = c."MasterRuleId"
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
-----------------------------------------------------------------------------------------------------------------------------
-- FUNCTION: fda.fn_GetAlertSeviority(numeric, numeric, numeric, numeric, character varying, numeric)

-- DROP FUNCTION IF EXISTS fda."fn_GetAlertSeviority"(numeric, numeric, numeric, numeric, character varying, numeric);

CREATE OR REPLACE FUNCTION fda."fn_GetAlertSeviority"(
	"InSourceValue" numeric,
	"InTargetValue" numeric,
	"InUpperDiffLimit" numeric,
	"InLowerDiffLimit" numeric,
	"InThresholdInd" character varying,
	"InThresholdLimit" numeric)
    RETURNS bigint
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
DECLARE 
"RESULT" BIGINT;
"lvSourceTargetDiff" DECIMAL(20,3);

BEGIN

RAISE NOTICE 'InSourceValue from fn_GetAlertSeviority : %', "InSourceValue";
RAISE NOTICE 'InTargetValue from fn_GetAlertSeviority : %', "InTargetValue";
RAISE NOTICE 'InUpperDiffLimit from fn_GetAlertSeviority : %', "InUpperDiffLimit";
RAISE NOTICE 'InLowerDiffLimit from fn_GetAlertSeviority : %', "InLowerDiffLimit";
RAISE NOTICE 'InThresholdInd from fn_GetAlertSeviority : %', "InThresholdInd";
RAISE NOTICE 'InThresholdLimit from fn_GetAlertSeviority : %', "InThresholdLimit"; 

IF UPPER("InThresholdInd") = UPPER('NoAlert') OR "InThresholdInd" = ''
	THEN

     "RESULT" := 9;

ELSE IF UPPER("InThresholdInd") = UPPER('Percentage') 
	THEN
		RAISE NOTICE 'Percentage Block : %', 'percent';	
		IF  COALESCE("InSourceValue",0) = COALESCE("InTargetValue",0) 
			THEN
			RAISE NOTICE 'Percentage Block 1st IF : %', '111';	
			
				"RESULT" := 9;
		ELSE IF (COALESCE("InSourceValue",0) = 0 AND COALESCE("InTargetValue",0) = 0) 
			THEN
			RAISE NOTICE 'Percentage Block 2nd ELSE IF : %', '222';
				"RESULT" := 9; -- Both are zero so no alert 

		ELSE IF  ABS((COALESCE("InTargetValue",0)-  COALESCE("InSourceValue",0)) * 100 / CASE WHEN CAST(COALESCE("InSourceValue",1) AS VARCHAR) LIKE '0.000%' THEN 1 ELSE COALESCE("InSourceValue",1) END ) = 0.000 
			THEN
			RAISE NOTICE 'Percentage Block 3rd ELSE IF : %', '333';
				
			"RESULT" := 9;
		ELSE IF  COALESCE("InSourceValue",0) = 0 AND COALESCE("InTargetValue",0) != 0 
			AND ((COALESCE("InTargetValue",0) - COALESCE("InSourceValue",0)) > "InUpperDiffLimit"
				OR (COALESCE("InTargetValue",0) - COALESCE("InSourceValue",0)) < "InLowerDiffLimit")
			THEN
			
			RAISE NOTICE 'Percentage Block 4th ELSE IF : %', '444';
					
				"RESULT" := 1;  -- Critical because we can't calculate Threshold %
		ELSE IF ABS((COALESCE("InTargetValue",0)-  COALESCE("InSourceValue",0)) * 100 / CASE WHEN COALESCE("InSourceValue",1)::varchar LIKE '0.000%' THEN 1 END ) BETWEEN 0.1 and  CAST("InThresholdLimit" AS NUMERIC(17,6))*0.8 
			THEN
		
			RAISE NOTICE 'Percentage Block 5th ELSE IF : %', '555';
				
				"RESULT" := 9;-- 20% of Threshold allowed variance
		ELSE IF ABS((COALESCE("InTargetValue",0)-  COALESCE("InSourceValue",0)) * 100 / CASE WHEN COALESCE("InSourceValue",1)::varchar LIKE '0.000%' THEN 1 END ) BETWEEN CAST("InThresholdLimit" AS NUMERIC(17,6))*0.8 and  CAST("InThresholdLimit" AS NUMERIC(17,6)) 
			AND ((COALESCE("InTargetValue",0) - COALESCE("InSourceValue",0)) > "InUpperDiffLimit"
				OR (COALESCE("InTargetValue",0) - COALESCE("InSourceValue",0)) < "InLowerDiffLimit")
				
			THEN
				RAISE NOTICE 'Percentage Block 6th ELSE IF : %', '666';
				
				"RESULT" := 1; -- 20% of Threshold allowed variance
		ELSE IF ABS((COALESCE("InTargetValue",0)-  COALESCE("InSourceValue",0)) * 100 / CASE WHEN COALESCE("InSourceValue",1)::varchar LIKE '0.000%' THEN 1  ELSE "InSourceValue" END ) > CAST("InThresholdLimit" AS NUMERIC(17,6))  
			THEN 
				
				RAISE NOTICE 'Percentage Block 7th ELSE IF : %', '777';
				
				"RESULT" := 1;
		ELSE  
			RAISE NOTICE 'Percentage Block ELSE : %', 'ELSE';
				"RESULT" := 9;
		END IF;
		END IF;
		END IF;
		END IF;
		END IF;
		END IF;
		END IF;
		
		RAISE NOTICE 'Percentage Result : %', "RESULT";

ELSE IF UPPER("InThresholdInd") = UPPER('Absolute') 
	THEN
	
	RAISE NOTICE 'Func Name : %', 'fn_GetAlertSeviority';
	RAISE NOTICE 'InSourceValue : %', "InSourceValue";
	RAISE NOTICE 'InTargetValue : %', "InTargetValue";
	--RAISE NOTICE 'InUpperDiffLimit : %', "InUpperDiffLimit";
	--RAISE NOTICE 'InLowerDiffLimit : %', "InLowerDiffLimit";
	--RAISE NOTICE 'InThresholdInd : %', "InThresholdInd";
	--RAISE NOTICE 'InThresholdLimit : %', "InThresholdLimit";
	"lvSourceTargetDiff" := ABS(COALESCE("InTargetValue",0) - COALESCE("InSourceValue",0));
	RAISE NOTICE 'lvSourceTargetDiff : %', "lvSourceTargetDiff";

		IF  COALESCE("InSourceValue",0) = COALESCE("InTargetValue",0) 
			THEN
			
				"RESULT" := 9;
				
		ELSE IF (COALESCE("InSourceValue",0) = 0 AND COALESCE("InTargetValue",0) = 0) 
			THEN
			
				"RESULT" := 9; -- Both are zero so not alert 
				
		ELSE IF ABS(COALESCE("lvSourceTargetDiff",0)) >= ("InThresholdLimit" :: NUMERIC(17,6))
			AND ABS(COALESCE("lvSourceTargetDiff",0)) <= ("InThresholdLimit" :: NUMERIC(17,6)) 
			AND ABS(COALESCE("lvSourceTargetDiff",0)) > "InUpperDiffLimit"
			OR ABS(COALESCE("lvSourceTargetDiff",0)) < "InLowerDiffLimit"
			THEN
			RAISE NOTICE 'Threshold allowed : %', '20% of Threshold allowed variance';
				"RESULT" := 1; -- 20% of Threshold allowed variance
				
		ELSE IF ABS(COALESCE("lvSourceTargetDiff",0)) > ("InThresholdLimit" :: NUMERIC(17,6))
			AND ABS(COALESCE("lvSourceTargetDiff",0)) > "InUpperDiffLimit"
			OR ABS(COALESCE("lvSourceTargetDiff",0)) < "InLowerDiffLimit"
			THEN
			
				"RESULT" := 1;		
		ELSE  
				"RESULT" := 9;
		END IF;
		END IF;
		END IF;
		END IF;
		
	RAISE NOTICE 'Absolute Result : %', "RESULT";

ELSE IF UPPER("InThresholdInd") = UPPER('StandardDeviation') 
	THEN

		IF  COALESCE("InSourceValue",0) = COALESCE("InTargetValue",0) 
			THEN
			
				"RESULT" := 9;
				
		ELSE IF (COALESCE("InSourceValue",0) = 0 AND COALESCE("InSourceValue",0) = 0) 
			THEN
			
				"RESULT" := 9; -- Both are zero so not alert 
				
		ELSE IF ABS(COALESCE("InTargetValue",0)-  COALESCE("InSourceValue",0)) BETWEEN CAST("InThresholdLimit" AS NUMERIC(17,6))*0.8 and  CAST(InThresholdLimit AS NUMERIC(17,6)) 
			AND ((COALESCE("InTargetValue",0) - COALESCE("InSourceValue",0)) > "InUpperDiffLimit"
				OR (COALESCE("InTargetValue",0) - COALESCE("InSourceValue",0)) < "InLowerDiffLimit")
			THEN
			
				"RESULT" := 1; -- 20% of Threshold allowed variance
				
		ELSE IF ABS(COALESCE("InTargetValue",0)-  COALESCE("InSourceValue",0)) > CAST("InThresholdLimit" AS NUMERIC(17,6)) 
			AND ((COALESCE("InTargetValue",0) - COALESCE("InSourceValue",0)) > "InUpperDiffLimit"
				OR (COALESCE("InTargetValue",0) - COALESCE("InSourceValue",0)) < "InLowerDiffLimit")
				
			THEN
				"RESULT" := 1;
		ELSE  
				"RESULT" := 9;
		END IF;
		END IF;
		END IF;
		END IF;
		
	RAISE NOTICE 'StandardDeviation Result : %', "RESULT";
ELSE 

	"RESULT" := 9;
	
END IF;
END IF;
END IF;
END IF;

RETURN COALESCE("RESULT",1);
END
$BODY$;
-------------------------------------------------------------------------------------------------------------------
-- FUNCTION: fda.Proc_GetSystemInfo(character varying, refcursor)

-- DROP FUNCTION IF EXISTS fda."Proc_GetSystemInfo"(character varying, refcursor);

CREATE OR REPLACE FUNCTION fda."Proc_GetSystemInfo"(
	"InSystemName" character varying,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
DECLARE "OutSystemName" VARCHAR(100);
		"OutSystemAliasName" VARCHAR(100);
		"OutSystemType" VARCHAR(100);
		"OutSystemCategoryType" VARCHAR(100);
		"OutUserFriendlySystemName" VARCHAR(100);
		"OutAutoSyncUpInd" VARCHAR(100);
		"OutSystemUserName" VARCHAR(100);
		"OutConnectionDetails" VARCHAR;
		"OutSystemPassword" VARCHAR;
		"OutSchema" VARCHAR;
		"OutWarehouse" VARCHAR;
		"OutRoleName" VARCHAR;
		"OutFDASystemsId" BIGINT;
		"OutAccountName"  VARCHAR;
		"OutContainerName" VARCHAR;
		"OutAccessKeyID"   VARCHAR;   
		"OutSecretAccessKey"  VARCHAR;
		"OutBucketName"  VARCHAR ;
		"OutLandscapeName" VARCHAR;
		"OutRegion"	VARCHAR ;
		"OutS3BucketLocation" VARCHAR ;
		"OutPortNumber"	VARCHAR ;
		--"OutSpreadSheetId" VARCHAR ;
		"OutClientEmail" VARCHAR ;
		"OutPrivateKey" VARCHAR ;
		"OutProjectId" VARCHAR ;
		"OutConnectionOption"  VARCHAR ;
		"OutPassPhrase" 	    VARCHAR ;

BEGIN

SELECT 
	"FDASystemsId",
	"SystemName",
	"SystemAliasName",
	"SystemType",
	"SystemCategoryType",
	"UserFriendlySystemName" ,
	"AutoSyncUpInd",
	"SystemUserName",
	"ConnectionDetails",
	"SystemPassword",
	"Schema",
	"Warehouse",
	"RoleName",
	COALESCE("AccountName",''),
	COALESCE("ContainerName",''),
	"AccessKeyID", 
	"SecretAccessKey" ,
	"BucketName",
	"LandscapeName",
	COALESCE("Region",''),
	COALESCE("S3BucketLocation",''),
	COALESCE("PortNumber"::text,''),
	--COALESCE("SpreadSheetId",''),
	COALESCE("ProjectId",''),
	COALESCE("ClientEmail",''),
	COALESCE("PrivateKey",''),
	COALESCE("ConnectionOption",''),
	COALESCE("PassPhrase",'')
	
	
INTO 
	"OutFDASystemsId",
	"OutSystemName",
	"OutSystemAliasName",
	"OutSystemType",
	"OutSystemCategoryType",
	"OutUserFriendlySystemName" ,
	"OutAutoSyncUpInd",
	"OutSystemUserName",
	"OutConnectionDetails",
	"OutSystemPassword",
	"OutSchema",
	"OutWarehouse",
	"OutRoleName",
	"OutAccountName" ,
	"OutContainerName",
	"OutAccessKeyID", 
	"OutSecretAccessKey" ,
	"OutBucketName" ,
	"OutLandscapeName",
	"OutRegion",
	"OutS3BucketLocation",
	"OutPortNumber"	,
	--"OutSpreadSheetId",
	"OutProjectId",
	"OutClientEmail",
	"OutPrivateKey",
	"OutConnectionOption",
	"OutPassPhrase"
	
FROM fda."FDASystems"
WHERE "SystemAliasName" = "InSystemName";

OPEN $2 FOR --OPEN THE REF CURSOR

	SELECT 
			"OutFDASystemsId",
			COALESCE("OutSystemName",'') "OutSystemName",
			"OutSystemAliasName",
			"OutSystemType",
			"OutSystemCategoryType",
			"OutUserFriendlySystemName" ,
			"OutAutoSyncUpInd",
			"OutSystemUserName",
			"OutConnectionDetails",
			"OutSystemPassword",
			"OutSystemUserName",
			"OutConnectionDetails",
			"OutSystemPassword",
			"OutSchema",
			"OutWarehouse",
			"OutRoleName",
			"OutAccountName" ,
			"OutContainerName",
			"OutAccessKeyID", 
			"OutSecretAccessKey" ,
			"OutBucketName" ,
			"OutLandscapeName",
			"OutRegion",
			"OutS3BucketLocation",
			"OutPortNumber",
			--"OutSpreadSheetId",
			"OutProjectId",
			"OutClientEmail",
			"OutPrivateKey",
			"OutConnectionOption",
			"OutPassPhrase";

RETURN NEXT $2;

/*
SELECT fda."Proc_GetSystemInfo"(
	'dsigma',--"InSystemName" character varying,
	'refcursor');
	FETCH ALL IN "refcursor";
*/

END;
$BODY$;
--------------------------------------------------------------------------------------------------------
-- FUNCTION: fda.Proc_InsertFDAAlertRules_V3(character varying, character varying, text, character varying, character varying, character varying, character varying, character varying, character varying, text, text, text, text, character varying, text, character varying, character varying, text, text, text, text, character varying, text, text, text, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, text, text, character varying, character varying, text, character varying, text, text, text, character varying, text, character varying, text, character varying, text, bigint, character varying, refcursor)

-- DROP FUNCTION IF EXISTS fda."Proc_InsertFDAAlertRules_V3"(character varying, character varying, text, character varying, character varying, character varying, character varying, character varying, character varying, text, text, text, text, character varying, text, character varying, character varying, text, text, text, text, character varying, text, text, text, character varying, character varying, character varying, character varying, character varying, character varying, character varying, character varying, text, text, character varying, character varying, text, character varying, text, text, text, character varying, text, character varying, text, character varying, text, bigint, character varying, refcursor);

CREATE OR REPLACE FUNCTION fda."Proc_InsertFDAAlertRules_V3"(
	"InApplicationName" character varying,
	"InAlertName" character varying,
	"InAlertDescription" text,
	"InAlertType" character varying,
	"InFolderId" character varying,
	"InSourceInfoEntryType" character varying,
	"InTargetInfoEntryType" character varying,
	"InSourceSystemId" character varying,
	"InSourceTableId" character varying,
	"InSourceColumnId" text,
	"InSourceSegmentByColumnsLevel1" text,
	"InSourceSegmentByColumnsLevel2" text,
	"InSourceConditionString" text,
	"InSourceQueryName" character varying,
	"InSourceQueryString" text,
	"InTargetSystemId" character varying,
	"InTargetTableId" character varying,
	"InTargetColumnId" text,
	"InTargetSegmentByColumnsLevel1" text,
	"InTargetSegmentByColumnsLevel2" text,
	"InTargetConditionString" text,
	"InTargetQueryName" character varying,
	"InTargetQueryString" text,
	"InSourceSegmentValue" text,
	"InTargetSegmentValue" text,
	"InAllowNewSegmentInd" character varying,
	"InThresholdType" character varying,
	"InLowerThresholdType" character varying,
	"InUpperThresholdType" character varying,
	"InLowerThresholdValue" character varying,
	"InUpperThresholdValue" character varying,
	"InBaseLineValueType" character varying,
	"InBaseLineValue" character varying,
	"InSourceColumnLevelThreshold" text,
	"InTargetColumnLevelThreshold" text,
	"InCheckForSeasonalityInd" character varying,
	"InCheckForSeasonalityValue" character varying,
	"InUserEmailTobeNotfied" text,
	"InUpdatedBy" character varying,
	"InPrimaryOwnerEmail" text,
	"InSecondaryOwnerEmail" text,
	"InAlertTag" text,
	"InStoredComparedInd" character varying,
	"InSourceTargetColumnMapping" text,
	"InSourceApiName" character varying,
	"InSourceApiURL" text,
	"InTargetApiName" character varying,
	"InTargetApiURL" text,
	"InMaxRecordCount" bigint,
	"InUploadInd" character varying,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$

DECLARE "OutFDAAlertRulesId" BIGINT;
		"First" VARCHAR(1000);
		"Second" VARCHAR(1000);
		"SourceColumnNames" TEXT;
		"TargetColumnNames" TEXT;
		"SourceColumnCount" BIGINT;
		"SourceCheckedColumnCount" BIGINT;
		"TargetColumnCount" BIGINT;
		"TargetCheckedColumnCount" BIGINT;
		"SourceSegmentCountLevel1" BIGINT;
		"SourceSegmentCountLevel2" BIGINT;
		"TargetSegmentCountLevel1" BIGINT;
		"TargetSegmentCountLevel2" BIGINT;
		"lvAlertTypeCategory" VARCHAR(100);
		"Column" VARCHAR(100);
		"VerifyQuery" TEXT;
		"IsNumericCheckInd" BIGINT;
		"NumericCheck" BIGINT;
		"IsNumericColumnQueryString" VARCHAR(1000);
		"ID" BIGINT;
		"SourceGroupBy_Columns" TEXT;
		"TargetGroupBy_Columns" TEXT;
		"Counter" BIGINT = 1;
		"ColumnData" VARCHAR(1000);
		"ColumnName" VARCHAR(100);
		"AppId" BIGINT;
		"SourceSystemId" BIGINT;
		"TargetSystemId" BIGINT;
		"SourceObjectId" BIGINT;
		"TargetObjectId" BIGINT;
		"ConditionValue" TEXT;
		"lvdefaultFolder" BIGINT;
		
DECLARE "ITEM_CURSOR_S" CURSOR FOR SELECT "VALUE"
		FROM UNNEST(STRING_TO_ARRAY("InSourceConditionString" ,'|')) "VALUE"
		WHERE "VALUE" IS NOT NULL;

DECLARE "ITEM_CURSOR_T" CURSOR FOR SELECT "VALUE"
		FROM UNNEST(STRING_TO_ARRAY("InTargetConditionString" ,'|')) "VALUE"
		WHERE "VALUE" IS NOT NULL;
BEGIN

------------------------------------------CREATE ADHOC FOLDER BY DEFAULT-------------------------------------------------------------------
IF "InFolderId" = ''
THEN 
	
	SELECT COUNT(*)
		INTO "lvdefaultFolder"
	FROM fda."Folders"
	WHERE "FolderName" = 'ADHOC'	
		AND "FolderCategory" = 'AlertRules';
		
	IF "lvdefaultFolder" = 0 
	THEN 
		INSERT INTO fda."Folders" ("FolderName","FolderCategory","CreatedBy","CreatedDateTime")
		VALUES('ADHOC','AlertRules',"InUpdatedBy",CURRENT_TIMESTAMP);
	END IF;

	"InFolderId" := (SELECT "FoldersId"::VARCHAR
					 FROM fda."Folders"
					 WHERE "FolderName" = 'ADHOC'	
						AND "FolderCategory" = 'AlertRules'
					);
END IF;

---------------------------------------UPDATE ALERT TYPE CATEGORY ACCORDING TO NUMBER OF COLUMNS-------------------------------------------------------------
IF UPPER("InTargetInfoEntryType") = UPPER('Editor') AND UPPER("InAlertType") = UPPER('TargetValue') 
THEN 
	
"TargetColumnCount" := (SELECT COUNT("VALUE") 
						FROM  UNNEST(STRING_TO_ARRAY("InTargetColumnId" ,'|')) "VALUE" 
						WHERE SPLIT_PART("VALUE",'^',2) = 'true'
						);
"TargetSegmentCountLevel1" := (SELECT COUNT("VALUE") 
					     FROM  UNNEST(STRING_TO_ARRAY("InTargetSegmentByColumnsLevel1" ,'|')) "VALUE" 
						 );
"TargetSegmentCountLevel2" := (SELECT COUNT("VALUE") 
					     FROM  UNNEST(STRING_TO_ARRAY("InTargetSegmentByColumnsLevel2" ,'|')) "VALUE" 
						 );						 						 
						 
ELSE IF UPPER("InTargetInfoEntryType") = UPPER('Api') AND UPPER("InAlertType") = UPPER('TargetValue') 
THEN 
	
"TargetColumnCount" := (SELECT COUNT("VALUE") 
						FROM  UNNEST(STRING_TO_ARRAY("InTargetColumnId" ,'|')) "VALUE" 
						WHERE SPLIT_PART("VALUE",'^',2) = 'true'
						);
"TargetSegmentCountLevel1" := (SELECT COUNT("VALUE") 
					     FROM  UNNEST(STRING_TO_ARRAY("InTargetSegmentByColumnsLevel1" ,'|')) "VALUE" 
						 );
"TargetSegmentCountLevel2" := (SELECT COUNT("VALUE") 
					     FROM  UNNEST(STRING_TO_ARRAY("InTargetSegmentByColumnsLevel2" ,'|')) "VALUE" 
						 );
						 
ELSE 

"SourceColumnCount" := (SELECT COUNT("VALUE") 
                        FROM  UNNEST(STRING_TO_ARRAY("InSourceColumnId" ,'|')) "VALUE" 
                        --WHERE SPLIT_PART("VALUE",'^',2) = 'true'
						);
"TargetColumnCount" := (SELECT COUNT("VALUE") 
						FROM  UNNEST(STRING_TO_ARRAY("InTargetColumnId" ,'|')) "VALUE" 
						--WHERE SPLIT_PART("VALUE",'^',2) = 'true'
						);
"SourceSegmentCountLevel1" := (SELECT COUNT("VALUE") 
								FROM  UNNEST(STRING_TO_ARRAY("InSourceSegmentByColumnsLevel1" ,'|')) "VALUE" 
								);
"SourceSegmentCountLevel2" := (SELECT COUNT("VALUE") 
								  FROM  UNNEST(STRING_TO_ARRAY("InSourceSegmentByColumnsLevel2" ,'|')) "VALUE" 
								);						 
"TargetSegmentCountLevel1" := (SELECT COUNT("VALUE") 
								FROM  UNNEST(STRING_TO_ARRAY("InTargetSegmentByColumnsLevel1" ,'|')) "VALUE" 
								);
"TargetSegmentCountLevel2" := (SELECT COUNT("VALUE") 
								  FROM  UNNEST(STRING_TO_ARRAY("InTargetSegmentByColumnsLevel2" ,'|')) "VALUE" 
								);
						 
END IF;
END IF;
					 
SELECT COUNT("VALUE") INTO "SourceCheckedColumnCount" 
FROM  UNNEST(STRING_TO_ARRAY("InSourceColumnId" ,'|')) "VALUE" 
WHERE SPLIT_PART("VALUE",'^',2) = 'true';

SELECT COUNT("VALUE") INTO "TargetCheckedColumnCount"
FROM  UNNEST(STRING_TO_ARRAY("InTargetColumnId" ,'|')) "VALUE" 
WHERE SPLIT_PART("VALUE",'^',2) = 'true';
 
/*
IF UPPER("InThresholdType") = 'FULLDATACOMPARE' OR "SourceColumnCount" > 1 OR "TargetColumnCount" > 1 
		OR "SourceSegmentCountLevel1" > 1 OR "TargetSegmentCountLevel1" > 1 --OR "SourceSegmentCountLevel2" > 1 OR "TargetSegmentCountLevel2" > 1
	THEN
		"lvAlertTypeCategory" = 'ADVANCED';
ELSE
		"lvAlertTypeCategory" = 'NORMAL';

END IF; 
*/

"lvAlertTypeCategory" := 'ADVANCED';
	
"OutFDAAlertRulesId" := nextval('fda."seq_Ruleld"');

RAISE NOTICE 'Value: % ','Rules Id Created Id';
RAISE NOTICE 'Value: % ',"OutFDAAlertRulesId";
RAISE NOTICE 'VALUE: % ','1111';

"AppId" := (SELECT "FDAApplicationsId" FROM fda."FDAApplications" 
			WHERE "ApplicationName" = "InApplicationName"
			);
"SourceSystemId":= (SELECT  "FDASystemsId" FROM fda."FDASystems" 
					WHERE "SystemAliasName" =  "InSourceSystemId" 
					LIMIT 1
					);
"TargetSystemId" := (SELECT "FDASystemsId" FROM fda."FDASystems" 
					WHERE "SystemAliasName" =  "InTargetSystemId" 
					LIMIT 1
					);
"SourceObjectId" := (SELECT "FDASystemObjectsId" FROM fda."FDASystemObjects" a,fda."FDASystems" b 
					WHERE a."FDASystemsId" = b."FDASystemsId" 
						AND a."ObjectName" = "InSourceTableId"
						AND b."SystemAliasName" = "InSourceSystemId" 
					LIMIT 1
					);
"TargetObjectId" := (SELECT "FDASystemObjectsId" FROM fda."FDASystemObjects" a,fda."FDASystems" b 
					WHERE a."FDASystemsId" = b."FDASystemsId" 
						AND a."ObjectName" = "InTargetTableId"
						AND b."SystemAliasName" = "InTargetSystemId" 
					LIMIT 1
					);

            INSERT INTO fda."FDAAlertRules"
                        (
							"FDAAlertRulesId",
							"FolderId",
							"ApplicationId",
							"AlertName",
							"AlertDescription",
							"AlertTypeInd",
							"AlertTypeCategory",
							"SourceInfoEntryType",
							"TargetInfoEntryType",
							"FDASystemSourceId",
							"FDASourceTableId",
							"FDASystemTargeteId",
							"FDATargetTableId",
							"AllowNewSegmentInd",
							"ThresholdType",
							"BaseLineValueType",
							"BaseLineValue",
							"CheckForSeasonalityInd",
							"CheckForSeasonalityValue",
							"CreatedDateTime" ,
							"UpdatedBy",
							"NewBaseLineDateTime",
							"NewBaseLineDateTimeSource",
							"AlertTag",
							"StoredComparedInd"
                        )
			VALUES 
                        (
							"OutFDAAlertRulesId",    --FDAAlertRulesId
	
							CAST(COALESCE(NULLIF("InFolderId",''),'0') AS BIGINT),  --FolderId
	
							"AppId",   --ApplicationId
							"InAlertName", 
							"InAlertDescription",
							"InAlertType" ,   --AlertTypeInd
							"lvAlertTypeCategory",
	
							"InSourceInfoEntryType",   --SourceInfoEntryType
	
							"InTargetInfoEntryType",   --TargetInfoEntryType
	
							"SourceSystemId",  --FDASystemSourceId
	
							"SourceObjectId" ,   --FDASourceTableId
	
							"TargetSystemId"  ,    --FDASystemTargeteId
	
							"TargetObjectId"   ,   --FDATargetTableId
							
							"InAllowNewSegmentInd",
	
							"InThresholdType",            --ThresholdType
	
							"InBaseLineValueType",     --BaseLineValueType
							"InBaseLineValue",         --BaseLineValue
							"InCheckForSeasonalityInd",    --CheckForSeasonalityInd
							"InCheckForSeasonalityValue",  --CheckForSeasonalityValue
	
							CURRENT_TIMESTAMP,     --CreatedDateTime
							"InUpdatedBy",   --UpdatedBy
							CURRENT_TIMESTAMP,      -- NewBaseLinDate is set current date for the first time
							'ORIGIN',
							"InAlertTag",
							"InStoredComparedInd"
                        );
   
RAISE NOTICE 'VALUE: % ','1111';
   --Number Of Columns Count 
IF "InSourceQueryString" > ''
THEN
		"SourceColumnNames" := SUBSTRING(LEFT("InSourceQueryString",POSITION('FROM' IN "InSourceQueryString")-2),7,LENGTH("InSourceQueryString"));
          
		SELECT COUNT("VALUE") 
		INTO "SourceColumnCount" 
		FROM UNNEST(STRING_TO_ARRAY("SourceColumnNames" ,',')) "VALUE";
     
     
ELSE
     
		SELECT COUNT("VALUE") 
		INTO "SourceColumnCount"
		FROM(SELECT "VALUE" FROM UNNEST(STRING_TO_ARRAY("InSourceSegmentByColumnsLevel1" ,'|')) "VALUE"
			 UNION
			 SELECT "VALUE" FROM UNNEST(STRING_TO_ARRAY("InSourceSegmentByColumnsLevel2" ,'|')) "VALUE"
			)x;
    
END IF;

IF "InTargetQueryString" > '' 
THEN

		"TargetColumnNames" := SUBSTRING(LEFT("InTargetQueryString",POSITION('FROM' IN "InTargetQueryString")-2),7,LENGTH("InTargetQueryString"));
         
		SELECT COUNT("VALUE") 
		INTO "TargetColumnCount" 
		FROM UNNEST(STRING_TO_ARRAY("TargetColumnNames",',')) "VALUE";
     
ELSE
     
        SELECT COUNT("VALUE") 
		INTO "TargetColumnCount"
		FROM(SELECT "VALUE" FROM UNNEST(STRING_TO_ARRAY("InTargetSegmentByColumnsLevel1" ,'|')) "VALUE"
			 UNION
			 SELECT "VALUE" FROM UNNEST(STRING_TO_ARRAY("InTargetSegmentByColumnsLevel2" ,'|')) "VALUE"
			)x;
			
END IF;

RAISE NOTICE 'VALUE: % ','Column count ended';
--Validate And Update Query Column
IF "InSourceQueryString" > '' OR "InTargetQueryString" > '' AND "SourceColumnCount" = "TargetColumnCount"
THEN
		UPDATE fda."FDAAlertRules"
	    SET "SourceQueryName" = "InSourceQueryName",
			"SourceQuery" = "InSourceQueryString",
			"TargetQueryName" = "InTargetQueryName",
	        "TargetQuery" = "InTargetQueryString"
	    WHERE "FDAAlertRulesId" = "OutFDAAlertRulesId";

ELSE IF "InSourceQueryString" = '' AND "InTargetQueryString" > '' 
THEN 
		UPDATE fda."FDAAlertRules"
	    SET "TargetQueryName" = "InTargetQueryName",
			"TargetQuery" = "InTargetQueryString"
	    WHERE "FDAAlertRulesId" = "OutFDAAlertRulesId";
END IF;
END IF;

RAISE NOTICE 'VALUE: % ','1234';
--Validate And Update API Column

IF "InSourceApiURL" > '' OR "InTargetApiURL" > ''
THEN
		UPDATE fda."FDAAlertRules"
	    SET "SourceApiName" = "InSourceApiName",
			"SourceApiURL" = "InSourceApiURL",
			"TargetApiName" = "InTargetApiName",
	        "TargetApiURL" = "InTargetApiURL"
	    WHERE "FDAAlertRulesId" = "OutFDAAlertRulesId";
END IF;

--Fetch Segment Column Name
	
IF UPPER(COALESCE("InThresholdType",'')) = UPPER('FullDataCompare') 
THEN 

	IF COALESCE("InTargetColumnId",'') = '' AND (COALESCE("InTargetSegmentByColumnsLevel1",'') > '' OR COALESCE("InTargetSegmentByColumnsLevel2",'') > '')
	THEN
	
		SELECT string_agg(CONCAT('true','^',
			a."FieldName",'^',
			(CASE WHEN a."FieldDataType" IN ('NUMBER','INTEGER','DECIMAL','DECIMAL17,3','DECIMAL17,2','INT','NUMBER','DOUBLE','SMALLINT','TINYINT','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG') THEN 'NUMBER' ELSE 'STRING' END)
			,'^',
			(CASE WHEN a."FieldDataType" IN ('NUMBER','INTEGER','DECIMAL','DECIMAL17,3','DECIMAL17,2','INT','NUMBER','DOUBLE','SMALLINT','TINYINT','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG') THEN 'SUM' ELSE 'COUNT' END)), '|'
			ORDER BY a."FieldName" ASC) 
        INTO "InTargetColumnId"       
		FROM  fda."FDASystemObjectFields" a,
			fda."FDASystemObjects" b, 
			fda."FDASystems" c
		WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
			AND b."FDASystemsId" = c."FDASystemsId" 
			AND b."ObjectName" = "InTargetTableId"
			AND c."SystemAliasName" = "InTargetSystemId"
			AND ( a."FieldName" NOT IN ("InTargetSegmentByColumnsLevel1")
				 OR a."FieldName" NOT IN ("InTargetSegmentByColumnsLevel2")
				)
		GROUP BY a."FDASystemObjectsId"
		LIMIT 10;
	
	END IF;
	
	IF "InAlertType" = 'SourceTargetValue' AND COALESCE("InSourceColumnId",'') = '' 
			AND (COALESCE("InSourceSegmentByColumnsLevel1",'') > '' OR COALESCE("InSourceSegmentByColumnsLevel2",'') > '')
	THEN
	
		SELECT string_agg(CONCAT('true','^',
			a."FieldName",'^',
			(CASE WHEN a."FieldDataType" IN ('NUMBER','INTEGER','DECIMAL','DECIMAL17,3','DECIMAL17,2','INT','NUMBER','DOUBLE','SMALLINT','TINYINT','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG') THEN 'NUMBER' ELSE 'STRING' END)
			,'^',
			(CASE WHEN a."FieldDataType" IN ('NUMBER','INTEGER','DECIMAL','DECIMAL17,3','DECIMAL17,2','INT','NUMBER','DOUBLE','SMALLINT','TINYINT','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG') THEN 'SUM' ELSE 'COUNT' END)), '|'
			ORDER BY a."FieldName" ASC) 
        INTO "InSourceColumnId"       
		FROM  fda."FDASystemObjectFields" a,
			fda."FDASystemObjects" b, 
			fda."FDASystems" c
		WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
			AND b."FDASystemsId" = c."FDASystemsId"
			AND b."ObjectName" = "InSourceTableId"
			AND c."SystemAliasName" = "InSourceSystemId"
			AND ( a."FieldName" NOT IN ("InSourceSegmentByColumnsLevel1")
				 OR a."FieldName" NOT IN ("InSourceSegmentByColumnsLevel2")
				)
		GROUP BY a."FDASystemObjectsId"
		LIMIT 10;
	
	END IF;

END IF;

--------------------------------------------------------------------------------------------------------------------------------------------
IF "InSourceInfoEntryType" = 'Wizard'
THEN
------------------------------------------------------------------SOURCE COLUMN-------------------------------------------------------------
	IF COALESCE("InSourceTargetColumnMapping",'') > '' AND COALESCE("InSourceColumnId",'') > ''
	THEN
			INSERT INTO fda."FDAAlertRulesSourceColumn"
			("FDAAlertRulesId","FDASourceTableColumnId","Position","SourceColumnName","DataType","Function","Status")
			SELECT DISTINCT
					"OutFDAAlertRulesId",
					a."FDASystemObjectFieldsId",
					CAST(NULLIF(d."Rank",'') AS INT) "Position",
					a."FieldName",
                    (CASE WHEN d."DataType" IN ('VARCHAR','NVARCHAR','NVARCHAR2','CHAR','STRING','BOOLEAN','TEXT','VARBINARY','NCHAR','VARCHAR2','BLOB','CLOB','NCLOB') THEN 'STRING'
						  WHEN d."DataType" IN ('NUMBER','INTEGER','DECIMAL','DECIMAL17,3','DECIMAL17,2','INT','NUMBER','DOUBLE','SMALLINT','TINYINT','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG') THEN 'NUMBER'
						  WHEN d."DataType" IN ('DATE','DATETIME','TIME','TIMESTAMP','TIMESTAMP_LTZ','TIMESTAMP_NTZ','TIMESTAMP_TZ','DATETIME2','TIMESTAMP6') THEN  'DATE'
						  ELSE '' END) "DataType",
                    d."Function",
					d."Status"
			FROM  fda."FDASystemObjectFields" a,
					fda."FDASystemObjects" b, 
					fda."FDASystems" c,
				(SELECT 
						SPLIT_PART("VALUE",'^',1) "Rank",
						SPLIT_PART("VALUE",'^',2) "Status",
						SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',1) "ColumnName",
						REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',2),')','') "DataType",
						(CASE WHEN  SPLIT_PART("VALUE",'^',5) > '' THEN  SPLIT_PART("VALUE",'^',5)
							WHEN  SPLIT_PART("VALUE",'^',5) = '' AND UPPER(COALESCE("InThresholdType",'')) <> UPPER('FullDataCompare') THEN 
								(CASE WHEN REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',2),')','') IN ('VARCHAR','NVARCHAR','NVARCHAR2','CHAR','STRING','DATE','DATETIME','TIME','TIMESTAMP','TIMESTAMP_LTZ','TIMESTAMP_NTZ','TIMESTAMP_TZ','TIMESTAMP6','DATETIME2','BOOLEAN','TEXT','VARBINARY','NCHAR','VARCHAR2','BLOB','CLOB','NCLOB') THEN 'COUNT DISTINCT'
									  WHEN REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',2),')','') IN  ('NUMBER','INTEGER','DECIMAL','DECIMAL17,3','DECIMAL17,2','INT','NUMBER','DOUBLE','SMALLINT','TINYINT','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG') THEN  'SUM' 
								END )
							ELSE ''
						END)"Function"
				FROM  UNNEST(STRING_TO_ARRAY("InSourceTargetColumnMapping",'|')) "VALUE"
				)d 
			WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
				AND b."FDASystemsId" = c."FDASystemsId" 
				AND a."FieldName" = d."ColumnName"
				AND b."ObjectName" = "InSourceTableId"
				AND c."SystemAliasName" = "InSourceSystemId"
				ORDER BY "Position";
				
	-------------------------'FDA_RECORD_COUNT' COLUMN INSERT------------------------------------------
		
		INSERT INTO fda."FDAAlertRulesSourceColumn"
			("FDAAlertRulesId","Position","Status","SourceColumnName","DataType","Function")	
		SELECT 
						"OutFDAAlertRulesId",
						SPLIT_PART("VALUE",'^',1)::BIGINT "Rank",
						SPLIT_PART("VALUE",'^',2) "Status",
						SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',1) "ColumnName",
						REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',2),')','') "DataType",
						(CASE WHEN  SPLIT_PART("VALUE",'^',5) > '' THEN  SPLIT_PART("VALUE",'^',5)
							WHEN  SPLIT_PART("VALUE",'^',5) = '' AND UPPER(COALESCE("InThresholdType",'')) <> UPPER('FullDataCompare') THEN 
								(CASE WHEN REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',2),')','') IN ('VARCHAR','NVARCHAR','NVARCHAR2','CHAR','STRING','DATE','DATETIME','TIME','TIMESTAMP','TIMESTAMP_LTZ','TIMESTAMP_NTZ','TIMESTAMP_TZ','TIMESTAMP6','DATETIME2','BOOLEAN','TEXT','VARBINARY','NCHAR','VARCHAR2','BLOB','CLOB','NCLOB') THEN 'COUNT DISTINCT'
									  WHEN REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',2),')','') IN  ('NUMBER','INTEGER','DECIMAL','DECIMAL17,3','DECIMAL17,2','INT','NUMBER','DOUBLE','SMALLINT','TINYINT','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG') THEN  'SUM' 
								END)
							ELSE ''
						END)"Function"
		FROM  UNNEST(STRING_TO_ARRAY("InSourceTargetColumnMapping",'|')) "VALUE"
		WHERE SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',1) = 'FDA_RECORD_COUNT'
			AND SPLIT_PART("VALUE",'^',2) = 'true';		
												
	END IF;
------------------------------------------------------------------SOURCE PRIMARY SEGMENT-------------------------------------------------------------------
	IF COALESCE("InSourceSegmentByColumnsLevel1",'') > ''
	THEN
			INSERT INTO fda."FDAAlertRulesSourceSegment"
			("FDAAlertRulesId","GroupBySourceColumnId","Position","GroupBySourceColumnName","DataType")
			SELECT  "OutFDAAlertRulesId",
					a."FDASystemObjectFieldsId",
					CAST(d."Rank" AS INT),
					a."FieldName",
					COALESCE(a."UserOverwriteDatatype",a."FieldDataType")
			FROM  fda."FDASystemObjectFields" a,
				  fda."FDASystemObjects" b, 
				  fda."FDASystems" c,
				  (SELECT SPLIT_PART("VALUE",'^',1) "Rank",
						  SPLIT_PART("VALUE",'^',2) "SegmentName"
				  FROM UNNEST(STRING_TO_ARRAY("InSourceSegmentByColumnsLevel1" ,'|')) "VALUE" 
				  WHERE "VALUE" IS NOT NULL
				  )d
			WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
				AND b."FDASystemsId" = c."FDASystemsId" 
				AND a."FieldName" = d."SegmentName"
				AND b."ObjectName" = "InSourceTableId"
				AND c."SystemAliasName" = "InSourceSystemId"
			ORDER BY d."Rank";

	END IF;
------------------------------------------------------------------SOURCE SECONDARY SEGMENT-------------------------------------------------------------------			
	IF COALESCE("InSourceSegmentByColumnsLevel2",'') > ''
	THEN
			INSERT INTO fda."FDAAlertRulesSourceSegmentSecondary"
			("FDAAlertRulesId","GroupBySourceColumnId","Position","GroupBySourceColumnName","DataType")
			SELECT  "OutFDAAlertRulesId",
					a."FDASystemObjectFieldsId",
					CAST(d."Rank" AS INT),
					a."FieldName",
					COALESCE(a."UserOverwriteDatatype",a."FieldDataType")
			FROM  fda."FDASystemObjectFields" a,
				  fda."FDASystemObjects" b, 
				  fda."FDASystems" c,
				  (SELECT SPLIT_PART("VALUE",'^',1) "Rank",
				  		  SPLIT_PART("VALUE",'^',2) "SegmentName"
				  FROM UNNEST(STRING_TO_ARRAY("InSourceSegmentByColumnsLevel2" ,'|')) "VALUE" 
				  WHERE "VALUE" IS NOT NULL
				  )d
			WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
				AND b."FDASystemsId" = c."FDASystemsId" 
				AND a."FieldName" = d."SegmentName"
				AND b."ObjectName" = "InSourceTableId"
				AND c."SystemAliasName" = "InSourceSystemId"
			ORDER BY d."Rank";

	END IF;	
END IF;

--------------------------------------------------------------------------------------------------------------------------------------------
IF "InSourceInfoEntryType" = 'Editor' OR "InSourceInfoEntryType" = 'Api'
THEN
------------------------------------------------------------------SOURCE COLUMN-------------------------------------------------------------

	IF COALESCE("InSourceTargetColumnMapping",'') > '' AND COALESCE("InSourceColumnId",'') > ''
	THEN
			
			INSERT INTO fda."FDAAlertRulesSourceColumn"("FDAAlertRulesId","Position","SourceColumnName","DataType","Function","Status")
			SELECT DISTINCT
				   "OutFDAAlertRulesId",
				   CAST(NULLIF(d."Rank",'') AS INT) "Position",
				   d."ColumnName",
				   d."DataType",
				   d."Function",
				   d."Status"
			FROM 
				(SELECT 
					SPLIT_PART("VALUE",'^',1) "Rank",
					SPLIT_PART("VALUE",'^',2) "Status",
					SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',1) "ColumnName",
					REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',2),')','') "DataType",
					(CASE 
						WHEN  SPLIT_PART("VALUE",'^',5) > '' THEN  SPLIT_PART("VALUE",'^',5)
						WHEN  SPLIT_PART("VALUE",'^',5) = '' AND UPPER(COALESCE("InThresholdType",'')) <> UPPER('FullDataCompare') THEN 
							(CASE 
								WHEN REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',2),')','') IN ('VARCHAR','NVARCHAR','NVARCHAR2','CHAR','STRING','DATE','DATETIME','TIME','TIMESTAMP','TIMESTAMP_LTZ','TIMESTAMP_NTZ','TIMESTAMP_TZ','TIMESTAMP6','DATETIME2','BOOLEAN','TEXT','VARBINARY','NCHAR','VARCHAR2','BLOB','CLOB','NCLOB') THEN 'COUNT DISTINCT'
								WHEN REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',2),')','') IN ('NUMBER','INTEGER','DECIMAL','DECIMAL17,3','DECIMAL17,2','INT','NUMBER','DOUBLE','SMALLINT','TINYINT','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG') THEN  'SUM' 
							END)
						ELSE ''
					END)"Function"
				FROM UNNEST(STRING_TO_ARRAY("InSourceTargetColumnMapping",'|')) "VALUE"
				)d 
            ORDER BY "Position";

    END IF;
		
------------------------------------------------------------------SOURCE PRIMARY SEGMENT-------------------------------------------------------------------
	IF COALESCE("InSourceSegmentByColumnsLevel1",'') > ''
	THEN
	          INSERT INTO fda."FDAAlertRulesSourceSegment"("FDAAlertRulesId","Position","GroupBySourceColumnName")
              SELECT "OutFDAAlertRulesId",
					CAST(SPLIT_PART("VALUE",'^',1) AS INT) "Rank",
					SPLIT_PART("VALUE",'^',2) "SegmentName"
			  FROM  UNNEST(STRING_TO_ARRAY("InSourceSegmentByColumnsLevel1" ,'|')) "VALUE"
			  ORDER BY "Rank";
    END IF;
------------------------------------------------------------------SOURCE SECONDARY SEGMENT-------------------------------------------------------------------
	IF COALESCE("InSourceSegmentByColumnsLevel2",'') > ''
	THEN
	        INSERT INTO fda."FDAAlertRulesSourceSegmentSecondary"("FDAAlertRulesId","Position","GroupBySourceColumnName")
            SELECT "OutFDAAlertRulesId",
					CAST(SPLIT_PART("VALUE",'^',1) AS INT) "Rank",
					SPLIT_PART("VALUE",'^',2) "SegmentName"
			FROM  UNNEST(STRING_TO_ARRAY("InSourceSegmentByColumnsLevel2" ,'|')) "VALUE"
			ORDER BY "Rank";
    END IF;
END IF;

-----------------------------------------------------------------------------------------------------------------------------------------------
IF "InTargetInfoEntryType" = 'Wizard'
THEN
-------------------------------------------------------------------TARGET COLUMN SOURCE TARGET VALUE---------------------------------------------------------------
	IF COALESCE("InSourceTargetColumnMapping",'') > '' AND COALESCE("InTargetColumnId",'') > ''
	THEN 				
			INSERT INTO fda."FDAAlertRulesTargetColumn"
			("FDAAlertRulesId","FDATargetTableColumnId","Position","TargetColumnName","DataType","Function","Status")
			SELECT DISTINCT
					"OutFDAAlertRulesId",
					a."FDASystemObjectFieldsId",
					CAST(NULLIF(d."Rank",'') AS INT) "Position",
					a."FieldName",
                    (CASE 
						WHEN d."DataType" IN ('VARCHAR','NVARCHAR','NVARCHAR2','CHAR','STRING','BOOLEAN','TEXT','VARBINARY','NCHAR','VARCHAR2','BLOB','CLOB','NCLOB') THEN 'STRING'
						WHEN d."DataType" IN ('NUMBER','INTEGER','DECIMAL','DECIMAL17,3','DECIMAL17,2','INT','NUMBER','DOUBLE','SMALLINT','TINYINT','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG') THEN 'NUMBER'
						WHEN d."DataType" IN ('DATE','DATETIME','TIME','TIMESTAMP','TIMESTAMP_LTZ','TIMESTAMP_NTZ','TIMESTAMP_TZ','DATETIME2','TIMESTAMP6') THEN  'DATE'
						ELSE '' 
					END) "DataType",
                   d."Function",
				   d."Status"
			FROM  fda."FDASystemObjectFields" a,
				  fda."FDASystemObjects" b, 
				  fda."FDASystems" c,
					(SELECT 
							SPLIT_PART("VALUE",'^',1) "Rank",
							SPLIT_PART("VALUE",'^',2) "Status",
							SPLIT_PART(SPLIT_PART("VALUE",'^',4),'(',1) "ColumnName",
							UPPER(REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',4),'(',2),')','')) "DataType",
							(CASE 
								WHEN  SPLIT_PART("VALUE",'^',5) > ''  THEN  SPLIT_PART("VALUE",'^',5)
								WHEN  SPLIT_PART("VALUE",'^',5) = '' AND UPPER(COALESCE("InThresholdType",'')) <> UPPER('FullDataCompare') THEN  
									(CASE 
										WHEN UPPER(REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',4),'(',2),')','')) IN ('VARCHAR','NVARCHAR','NVARCHAR2','CHAR','STRING','DATE','DATETIME','TIME','TIMESTAMP','TIMESTAMP_LTZ','TIMESTAMP_NTZ','TIMESTAMP_TZ','TIMESTAMP6','DATETIME2','BOOLEAN','TEXT','VARBINARY','NCHAR','VARCHAR2','BLOB','CLOB','NCLOB') THEN 'COUNT DISTINCT'
										WHEN UPPER(REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',4),'(',2),')','')) IN  ('NUMBER','INTEGER','DECIMAL','DECIMAL17,3','DECIMAL17,2','INT','NUMBER','DOUBLE','SMALLINT','TINYINT','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG') THEN  'SUM' 
									END )
									ELSE ''
							END)"Function" 
					FROM  UNNEST(STRING_TO_ARRAY("InSourceTargetColumnMapping",'|')) "VALUE"
					)d 
			WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
				AND b."FDASystemsId" = c."FDASystemsId" 
				AND a."FieldName" = d."ColumnName"
				AND b."ObjectName" = "InTargetTableId"
				AND c."SystemAliasName" = "InTargetSystemId"
			ORDER  BY "Position";
				
	--------------------------'FDA_RECORD_COUNT' COLUMN INSERT-------------------------------------
		
			INSERT INTO fda."FDAAlertRulesTargetColumn"
			("FDAAlertRulesId","Position","Status","TargetColumnName","DataType","Function")
			SELECT 
					"OutFDAAlertRulesId",
					SPLIT_PART("VALUE",'^',1)::BIGINT "Rank",
					SPLIT_PART("VALUE",'^',2) "Status",
					SPLIT_PART(SPLIT_PART("VALUE",'^',4),'(',1) "ColumnName",
					UPPER(REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',4),'(',2),')','')) "DataType",
					(CASE 
						WHEN  SPLIT_PART("VALUE",'^',5) > ''  THEN  SPLIT_PART("VALUE",'^',5)
						WHEN  SPLIT_PART("VALUE",'^',5) = '' AND UPPER(COALESCE("InThresholdType",'')) <> UPPER('FullDataCompare') THEN  
							(CASE 
								WHEN UPPER(REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',4),'(',2),')','')) IN ('VARCHAR','NVARCHAR','NVARCHAR2','CHAR','STRING','DATE','DATETIME','TIME','TIMESTAMP','TIMESTAMP_LTZ','TIMESTAMP_NTZ','TIMESTAMP_TZ','TIMESTAMP6','DATETIME2','BOOLEAN','TEXT','VARBINARY','NCHAR','VARCHAR2','BLOB','CLOB','NCLOB') THEN 'COUNT DISTINCT'
								WHEN UPPER(REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',4),'(',2),')','')) IN  ('NUMBER','INTEGER','DECIMAL','DECIMAL17,3','DECIMAL17,2','INT','NUMBER','DOUBLE','SMALLINT','TINYINT','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG') THEN  'SUM' 
							END)
						ELSE ''
					END)"Function" 
			FROM  UNNEST(STRING_TO_ARRAY("InSourceTargetColumnMapping",'|')) "VALUE"
			WHERE SPLIT_PART(SPLIT_PART("VALUE",'^',4),'(',1) = 'FDA_RECORD_COUNT'
				AND SPLIT_PART("VALUE",'^',2) = 'true';
-------------------------------------------------------------------TARGET COLUMN TARGET VALUE---------------------------------------------------------------
					
	ELSE IF COALESCE("InSourceTargetColumnMapping",'') = '' AND COALESCE("InTargetColumnId",'') > ''
	THEN			
		RAISE NOTICE 'VALUE: % ','TARGET INSERT WITHOUT SOURCE';
			 
			INSERT INTO fda."FDAAlertRulesTargetColumn"
			("FDAAlertRulesId","FDATargetTableColumnId","Position","TargetColumnName","DataType","Function","Status")
			SELECT 
					"OutFDAAlertRulesId",
					a."FDASystemObjectFieldsId",
					CAST(NULLIF(d."Rank",'') AS INT) "Position",
					a."FieldName",
                    (CASE WHEN d."DataType" IN ('VARCHAR','NVARCHAR','NVARCHAR2','CHAR','STRING','BOOLEAN','TEXT','VARBINARY','NCHAR','VARCHAR2','BLOB','CLOB','NCLOB') THEN 'STRING'
						  WHEN d."DataType" IN ('NUMBER','INTEGER','DECIMAL','DECIMAL17,3','DECIMAL17,2','INT','NUMBER','DOUBLE','SMALLINT','TINYINT','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG') THEN 'NUMBER'
						  WHEN d."DataType" IN ('DATE','DATETIME','TIME','TIMESTAMP','TIMESTAMP_LTZ','TIMESTAMP_NTZ','TIMESTAMP_TZ','DATETIME2','TIMESTAMP6') THEN  'DATE'
						 ELSE '' 
					END) "DataType",
                    (CASE 
						WHEN  d."Function" > '' THEN  d."Function"
						WHEN  d."Function" = '' AND UPPER(COALESCE("InThresholdType",'')) <> UPPER('FullDataCompare')  THEN 
								(CASE WHEN d."DataType" IN ('VARCHAR','NVARCHAR','NVARCHAR2','CHAR','STRING','DATE','DATETIME','TIME','TIMESTAMP','TIMESTAMP_LTZ','TIMESTAMP_NTZ','TIMESTAMP_TZ','TIMESTAMP6','DATETIME2','BOOLEAN','TEXT','VARBINARY','NCHAR','VARCHAR2','BLOB','CLOB','NCLOB') THEN 'COUNT DISTINCT'
									  WHEN d."DataType" IN ('NUMBER','INTEGER','DECIMAL','DECIMAL17,3','DECIMAL17,2','INT','NUMBER','DOUBLE','SMALLINT','TINYINT','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG') THEN  'SUM' 
								END)
						ELSE ''
					END) "Function",
					d."Status"
			FROM  fda."FDASystemObjectFields" a,
				  fda."FDASystemObjects" b, 
				  fda."FDASystems" c,
				(SELECT 
						SPLIT_PART("VALUE",'^',1) "Rank",
						SPLIT_PART("VALUE",'^',2) "Status",
						SPLIT_PART("VALUE",'^',3) "ColumnName",
						SPLIT_PART("VALUE",'^',4) "DataType",
						SPLIT_PART("VALUE",'^',5) "Function" 
				FROM  UNNEST(STRING_TO_ARRAY("InTargetColumnId",'|')) "VALUE"
				WHERE "VALUE" IS NOT NULL
				)d 
			WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
				AND b."FDASystemsId" = c."FDASystemsId" 
				AND a."FieldName" = d."ColumnName"
				AND b."ObjectName" = "InTargetTableId"
				AND c."SystemAliasName" = "InTargetSystemId"
				ORDER  BY "Position";
										
			INSERT INTO fda."FDAAlertRulesTargetColumn"
			("FDAAlertRulesId","Position","TargetColumnName","DataType","Function","Status")
			SELECT 					
					"OutFDAAlertRulesId",
				    SPLIT_PART("VALUE",'^',1)::int "Rank",
					SPLIT_PART("VALUE",'^',3) "ColumnName",
					SPLIT_PART("VALUE",'^',4) "DataType",
					SPLIT_PART("VALUE",'^',5) "Function" ,
					SPLIT_PART("VALUE",'^',2) "Status"
            FROM  UNNEST(STRING_TO_ARRAY("InTargetColumnId",'|')) "VALUE"
			WHERE "VALUE" IS NOT NULL
				AND SPLIT_PART("VALUE",'^',3) = 'FDA_RECORD_COUNT'
				AND SPLIT_PART("VALUE",'^',2) = 'true';

	END IF;
	END IF;
--------------------------------------------------------------------TARGET SEGMENT TARGET VALUE----------------------------------------------------------------------
	IF (COALESCE("InTargetSegmentByColumnsLevel1",'') > '' OR COALESCE("InTargetSegmentByColumnsLevel2",'') > '') AND "InAlertType" = 'TargetValue'
	THEN
	--------------------------------------------TARGET PRIMARY SEGMENT TARGET VALUE-------------------------------------------------------	
		IF COALESCE("InTargetSegmentByColumnsLevel1",'') > '' AND "InAlertType" = 'TargetValue'
		THEN
			INSERT INTO fda."FDAAlertRulesTargetSegment"
				("FDAAlertRulesId","GroupByTargetColumnId","Position","GroupByTargetColumnName","DataType","FieldCalculationType")
				SELECT "OutFDAAlertRulesId",
						a."FDASystemObjectFieldsId",
						CAST(d."Rank" AS INT),
						d."SegmentName",
						d."DataType",
						d."Function" 
				FROM  fda."FDASystemObjectFields" a,
					fda."FDASystemObjects" b, 
					fda."FDASystems" c,
					(SELECT e."Rank",
							e."SegmentName",
							f."DataType",
							f."Function" 
						FROM
							(SELECT SPLIT_PART("VALUE",'^',1) "Rank",
									SPLIT_PART("VALUE",'^',2) "SegmentName"
							FROM  UNNEST(STRING_TO_ARRAY("InTargetSegmentByColumnsLevel1"  ,'|')) "VALUE"
							WHERE "VALUE" IS NOT NULL
							)e,
							(SELECT SPLIT_PART("VALUE",'^',2) "Status",
									SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',1) "ColumnName",
									SPLIT_PART("VALUE",'^',4) "DataType",
									SPLIT_PART("VALUE",'^',5) "Function" 
							FROM  UNNEST(STRING_TO_ARRAY("InTargetColumnId",'|')) "VALUE"
							WHERE "VALUE" IS NOT NULL 
								AND SPLIT_PART("VALUE",'^',2) = 'false'
							) f
						WHERE e."SegmentName" = f."ColumnName"
					) d
				WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
				AND b."FDASystemsId" = c."FDASystemsId" 
				AND a."FieldName" = d."SegmentName"
				AND b."ObjectName" = "InTargetTableId"
				AND c."SystemAliasName" = "InTargetSystemId"
				ORDER BY d."Rank";
		END IF;
	--------------------------------------------TARGET SECONDARY SEGMENT TARGET VALUE-------------------------------------------------------
		IF COALESCE("InTargetSegmentByColumnsLevel2",'') > '' AND "InAlertType" = 'TargetValue'
		THEN
			INSERT INTO fda."FDAAlertRulesTargetSegmentSecondary"
			("FDAAlertRulesId","GroupByTargetColumnId","Position","GroupByTargetColumnName","DataType","FieldCalculationType")
			SELECT "OutFDAAlertRulesId",
					a."FDASystemObjectFieldsId",
					CAST(d."Rank" AS INT),
					d."SegmentName",
					d."DataType",
					d."Function" 
			FROM  fda."FDASystemObjectFields" a,
				  fda."FDASystemObjects" b, 
				  fda."FDASystems" c,
				(SELECT e."Rank",
						e."SegmentName",
						f."DataType",
						f."Function" 
				FROM
					(SELECT SPLIT_PART("VALUE",'^',1) "Rank",
							SPLIT_PART("VALUE",'^',2) "SegmentName"
					FROM  UNNEST(STRING_TO_ARRAY("InTargetSegmentByColumnsLevel2"  ,'|')) "VALUE"
					WHERE "VALUE" IS NOT NULL
					)e,
					(SELECT SPLIT_PART("VALUE",'^',2) "Status",
							SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',1) "ColumnName",
							SPLIT_PART("VALUE",'^',4) "DataType",
							SPLIT_PART("VALUE",'^',5) "Function" 
					FROM  UNNEST(STRING_TO_ARRAY("InTargetColumnId",'|')) "VALUE"
					WHERE "VALUE" IS NOT NULL 
						AND SPLIT_PART("VALUE",'^',2) = 'false'
					) f
				WHERE e."SegmentName" = f."ColumnName"
				) d
			WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
				AND b."FDASystemsId" = c."FDASystemsId" 
				AND a."FieldName" = d."SegmentName"
				AND b."ObjectName" = "InTargetTableId"
				AND c."SystemAliasName" = "InTargetSystemId"
			ORDER BY d."Rank";
		END IF;

--------------------------------------------------------------------TARGET SEGMENT SOURCE TARGET VALUE----------------------------------------------------------------------						
	ELSE IF (COALESCE("InTargetSegmentByColumnsLevel1",'') > '' OR COALESCE("InTargetSegmentByColumnsLevel2",'') > '') AND "InAlertType" = 'SourceTargetValue'
	THEN
	------------------------------------------------------------TARGET PRIMARY SEGMENT SOURCE TARGET VALUE------------------------------------------------------
		IF COALESCE("InTargetSegmentByColumnsLevel1",'') > '' AND "InAlertType" = 'SourceTargetValue'
		THEN
				INSERT INTO fda."FDAAlertRulesTargetSegment"
				("FDAAlertRulesId","GroupByTargetColumnId","Position","GroupByTargetColumnName","DataType")
				SELECT "OutFDAAlertRulesId",
						a."FDASystemObjectFieldsId",
						CAST(d."Rank" AS INT),
						a."FieldName",
						COALESCE(a."UserOverwriteDatatype",a."FieldDataType")
				FROM  fda."FDASystemObjectFields" a,
					  fda."FDASystemObjects" b, 
					  fda."FDASystems" c,
					  (SELECT SPLIT_PART("VALUE",'^',1) "Rank",
					 		  SPLIT_PART("VALUE",'^',2) "SegmentName"
					  FROM  UNNEST(STRING_TO_ARRAY("InTargetSegmentByColumnsLevel1" ,'|')) "VALUE"
					  WHERE "VALUE" IS NOT NULL
					  ) d
				WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
					AND b."FDASystemsId" = c."FDASystemsId" 
					AND a."FieldName" = d."SegmentName"
					AND b."ObjectName" = "InTargetTableId"
					AND c."SystemAliasName" = "InTargetSystemId"
				ORDER BY d."Rank";
		END IF;
	------------------------------------------------------------TARGET SECONDARY SEGMENT SOURCE TARGET VALUE------------------------------------------------------
		IF COALESCE("InTargetSegmentByColumnsLevel2",'') > '' AND "InAlertType" = 'SourceTargetValue'
		THEN 
				INSERT INTO fda."FDAAlertRulesTargetSegmentSecondary"
				("FDAAlertRulesId","GroupByTargetColumnId","Position","GroupByTargetColumnName","DataType")
				SELECT "OutFDAAlertRulesId",
						a."FDASystemObjectFieldsId",
						CAST(d."Rank" AS INT),
						a."FieldName",
						COALESCE(a."UserOverwriteDatatype",a."FieldDataType")
				FROM  fda."FDASystemObjectFields" a,
					  fda."FDASystemObjects" b, 
					  fda."FDASystems" c,
					  (SELECT SPLIT_PART("VALUE",'^',1) "Rank",
					 		  SPLIT_PART("VALUE",'^',2) "SegmentName"
					  FROM  UNNEST(STRING_TO_ARRAY("InTargetSegmentByColumnsLevel2" ,'|')) "VALUE"
					  WHERE "VALUE" IS NOT NULL
					  ) d
				WHERE a."FDASystemObjectsId" = b."FDASystemObjectsId"
					AND b."FDASystemsId" = c."FDASystemsId" 
					AND a."FieldName" = d."SegmentName"
					AND b."ObjectName" = "InTargetTableId"
					AND c."SystemAliasName" = "InTargetSystemId"
				ORDER BY d."Rank";
		END IF;

	END IF;
	END IF;
END IF;
----------------------------------------------SAVE COLUMN AND SEGMENT INFO FOR TARGET SIDE-------------------------------------
IF "InTargetInfoEntryType" = 'Editor' OR "InTargetInfoEntryType" = 'Api'
THEN
-------------------------------------------------------------------TARGET COLUMN SOURCE TARGET VALUE---------------------------------------------------------------
	IF COALESCE("InSourceTargetColumnMapping",'') > '' AND COALESCE("InTargetColumnId",'') > ''
	THEN
			INSERT INTO fda."FDAAlertRulesTargetColumn"
			("FDAAlertRulesId","Position","TargetColumnName","DataType","Function","Status")
			SELECT DISTINCT
					"OutFDAAlertRulesId",
					CAST(NULLIF(d."Rank",'') AS INT) "Position",
					d."ColumnName",
					"DataType","Function",
					d."Status"
			FROM 
				(SELECT 
						SPLIT_PART("VALUE",'^',1) "Rank",
						SPLIT_PART("VALUE",'^',2) "Status",
						SPLIT_PART(SPLIT_PART("VALUE",'^',4),'(',1) "ColumnName",
						UPPER(REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',4),'(',2),')','')) "DataType",
						(CASE WHEN  SPLIT_PART("VALUE",'^',5) > '' THEN  SPLIT_PART("VALUE",'^',5)
							  WHEN  SPLIT_PART("VALUE",'^',5) = '' AND UPPER(COALESCE('FullDataCompare','')) <> UPPER('FullDataCompare') THEN 
									(CASE WHEN UPPER(REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',4),'(',2),')','')) IN ('VARCHAR','NVARCHAR','NVARCHAR2','CHAR','STRING','DATE','DATETIME','TIME','TIMESTAMP','TIMESTAMP_LTZ','TIMESTAMP_NTZ','TIMESTAMP_TZ','TIMESTAMP6','DATETIME2','BOOLEAN','TEXT','VARBINARY','NCHAR','VARCHAR2','BLOB','CLOB','NCLOB') THEN 'COUNT DISTINCT'
										  WHEN UPPER(REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',4),'(',2),')','')) IN  ('NUMBER','INTEGER','DECIMAL','DECIMAL17,3','DECIMAL17,2','INT','NUMBER','DOUBLE','SMALLINT','TINYINT','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG') THEN  'SUM' 
									END)
							ELSE ''
						END)"Function"
			    FROM  UNNEST(STRING_TO_ARRAY("InSourceTargetColumnMapping",'|')) "VALUE"
			    )d 
            ORDER BY "Position";

-------------------------------------------------------------------TARGET COLUMN TARGET VALUE---------------------------------------------------------------				
	ELSE IF COALESCE("InSourceTargetColumnMapping",'') = '' AND COALESCE("InTargetColumnId",'') > ''
	THEN 
			INSERT INTO fda."FDAAlertRulesTargetColumn"
			("FDAAlertRulesId","Position","TargetColumnName","DataType","Function","Status")
			SELECT "OutFDAAlertRulesId",
					CAST(NULLIF(SPLIT_PART("VALUE",'^',1),'') AS INT) "Position",
					SPLIT_PART("VALUE",'^',3),
					(CASE WHEN SPLIT_PART("VALUE",'^',4) IN ('VARCHAR','NVARCHAR','NVARCHAR2','CHAR','STRING','BOOLEAN','TEXT','VARBINARY','NCHAR','VARCHAR2','BLOB','CLOB','NCLOB') THEN 'STRING'
						  WHEN SPLIT_PART("VALUE",'^',4) IN ('NUMBER','INTEGER','DECIMAL','DECIMAL17,3','DECIMAL17,2','INT','NUMBER','DOUBLE','SMALLINT','TINYINT','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG') THEN 'NUMBER'
						  WHEN SPLIT_PART("VALUE",'^',4) IN ('DATE','DATETIME','TIME','TIMESTAMP','TIMESTAMP_LTZ','TIMESTAMP_NTZ','TIMESTAMP_TZ','DATETIME2','TIMESTAMP6') THEN  'DATE'
						ELSE '' 
					END),
					SPLIT_PART("VALUE",'^',5),						
					SPLIT_PART("VALUE",'^',2)
					
			FROM UNNEST(STRING_TO_ARRAY("InTargetColumnId" ,'|')) "VALUE"
			ORDER  BY "Position";
	END IF;
	END IF;
--------------------------------------------------------------------(Editor) TARGET SEGMENT TARGET VALUE----------------------------------------------------------------------		
	IF (COALESCE("InTargetSegmentByColumnsLevel1",'') > '' OR COALESCE("InTargetSegmentByColumnsLevel2",'') > '')
			AND "InAlertType" = 'TargetValue' AND "InTargetInfoEntryType" =  'Editor'
	THEN
	------------------------------------------------------------(Editor) TARGET PRIMARY SEGMENT TARGET VALUE---------------------------------------------------	
		IF COALESCE("InTargetSegmentByColumnsLevel1",'') > '' AND "InAlertType" = 'TargetValue' AND "InTargetInfoEntryType" =  'Editor'
		THEN
			INSERT INTO fda."FDAAlertRulesTargetSegment"
			("FDAAlertRulesId","Position","GroupByTargetColumnName","DataType","FieldCalculationType")
			SELECT "OutFDAAlertRulesId",
					CAST(e."Rank" AS INT),
					e."SegmentName",
					f."DataType",
					f."Function" 
			FROM
				(SELECT SPLIT_PART("VALUE",'^',1) "Rank",
						SPLIT_PART("VALUE",'^',2) "SegmentName"
				FROM  UNNEST(STRING_TO_ARRAY("InTargetSegmentByColumnsLevel1"  ,'|')) "VALUE"
				WHERE "VALUE" IS NOT NULL
				)e,
				(SELECT SPLIT_PART("VALUE",'^',2) "Status",
						SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',1) "ColumnName",
						SPLIT_PART("VALUE",'^',4) "DataType",
						SPLIT_PART("VALUE",'^',5) "Function" 
				FROM  UNNEST(STRING_TO_ARRAY("InTargetColumnId",'|')) "VALUE"
				WHERE "VALUE" IS NOT NULL 
					AND SPLIT_PART("VALUE",'^',2) = 'false'
				) f
			WHERE e."SegmentName" = f."ColumnName"
			ORDER BY e."Rank";
		END IF;
	----------------------------------------------------------------(Editor) TARGET SECONDARY SEGMENT TARGET VALUE---------------------------------------------
		IF COALESCE("InTargetSegmentByColumnsLevel2",'') > '' AND "InAlertType" = 'TargetValue' AND "InTargetInfoEntryType" =  'Editor'
		THEN
			INSERT INTO fda."FDAAlertRulesTargetSegmentSecondary"
			("FDAAlertRulesId","Position","GroupByTargetColumnName","DataType","FieldCalculationType")
			SELECT "OutFDAAlertRulesId",
					CAST(e."Rank" AS INT),
					e."SegmentName",
					f."DataType",
					f."Function" 
			FROM
				(SELECT SPLIT_PART("VALUE",'^',1) "Rank",
						SPLIT_PART("VALUE",'^',2) "SegmentName"
				FROM  UNNEST(STRING_TO_ARRAY("InTargetSegmentByColumnsLevel2"  ,'|')) "VALUE"
				WHERE "VALUE" IS NOT NULL
				)e,
				(SELECT SPLIT_PART("VALUE",'^',2) "Status",
						SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',1) "ColumnName",
						SPLIT_PART("VALUE",'^',4) "DataType",
						SPLIT_PART("VALUE",'^',5) "Function" 
				FROM  UNNEST(STRING_TO_ARRAY("InTargetColumnId",'|')) "VALUE"
				WHERE "VALUE" IS NOT NULL 
					AND SPLIT_PART("VALUE",'^',2) = 'false'
				) f
			WHERE e."SegmentName" = f."ColumnName"
			ORDER BY e."Rank";
		END IF;
--------------------------------------------------------------------(API) TARGET SEGMENT TARGET VALUE----------------------------------------------------------------------
	ELSE IF (COALESCE("InTargetSegmentByColumnsLevel1",'') > '' OR COALESCE("InTargetSegmentByColumnsLevel2",'') > '')
			AND "InAlertType" = 'TargetValue' AND "InTargetInfoEntryType" = 'Api'
	THEN
	------------------------------------------------------------(API) TARGET PRIMARY SEGMENT TARGET VALUE----------------------------------------------------		
		IF COALESCE("InTargetSegmentByColumnsLevel1",'') > '' AND "InAlertType" = 'TargetValue' AND "InTargetInfoEntryType" = 'Api'
		THEN
			INSERT INTO fda."FDAAlertRulesTargetSegment"
			("FDAAlertRulesId","Position","GroupByTargetColumnName","DataType","FieldCalculationType")
			SELECT "OutFDAAlertRulesId",
					CAST(e."Rank" AS INT),
					e."SegmentName",
					f."DataType",
					f."Function" 
			FROM
				(SELECT SPLIT_PART("VALUE",'^',1) "Rank",
						SPLIT_PART("VALUE",'^',2) "SegmentName"
				FROM  UNNEST(STRING_TO_ARRAY("InTargetSegmentByColumnsLevel1"  ,'|')) "VALUE"
				WHERE "VALUE" IS NOT NULL
				)e,
			(SELECT SPLIT_PART("VALUE",'^',2) "Status",
					SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',1) "ColumnName",
					SPLIT_PART("VALUE",'^',4) "DataType",
					SPLIT_PART("VALUE",'^',5) "Function" 
			FROM  UNNEST(STRING_TO_ARRAY("InTargetColumnId",'|')) "VALUE"
			WHERE "VALUE" IS NOT NULL 
				AND SPLIT_PART("VALUE",'^',2) = 'true'
			) f
						--WHERE e."SegmentName" = f."ColumnName"
		ORDER BY e."Rank";
		END IF;
	----------------------------------------------------------------(API) TARGET SECONDARY SEGMENT TARGET VALUE------------------------------------------------
		IF COALESCE("InTargetSegmentByColumnsLevel2",'') > '' AND "InAlertType" = 'TargetValue' AND "InTargetInfoEntryType" = 'Api'
		THEN
			INSERT INTO fda."FDAAlertRulesTargetSegmentSecondary"
			("FDAAlertRulesId","Position","GroupByTargetColumnName","DataType","FieldCalculationType")
			SELECT "OutFDAAlertRulesId",
					CAST(e."Rank" AS INT),
					e."SegmentName",
					f."DataType",
					f."Function" 
			FROM
				(SELECT SPLIT_PART("VALUE",'^',1) "Rank",
						SPLIT_PART("VALUE",'^',2) "SegmentName"
				FROM  UNNEST(STRING_TO_ARRAY("InTargetSegmentByColumnsLevel2"  ,'|')) "VALUE"
				WHERE "VALUE" IS NOT NULL
				)e,
				(SELECT SPLIT_PART("VALUE",'^',2) "Status",
						SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',1) "ColumnName",
						SPLIT_PART("VALUE",'^',4) "DataType",
						SPLIT_PART("VALUE",'^',5) "Function" 
				FROM  UNNEST(STRING_TO_ARRAY("InTargetColumnId",'|')) "VALUE"
				WHERE "VALUE" IS NOT NULL 
					AND SPLIT_PART("VALUE",'^',2) = 'true'
				) f
				--WHERE e."SegmentName" = f."ColumnName"
			ORDER BY e."Rank";
		END IF;
--------------------------------------------------------------------TARGET SEGMENT SOURCE TARGET VALUE----------------------------------------------------------------------		
	ELSE IF (COALESCE("InTargetSegmentByColumnsLevel1",'') > '' OR COALESCE("InTargetSegmentByColumnsLevel2",'') > '') AND "InAlertType" = 'SourceTargetValue'
	THEN
	----------------------------------------------------------------TARGET PRIMARY SEGMENT SOURCE TARGET VALUE---------------------------------------------
		IF COALESCE("InTargetSegmentByColumnsLevel1",'') > '' AND "InAlertType" = 'SourceTargetValue'
		THEN
			INSERT INTO fda."FDAAlertRulesTargetSegment"
			("FDAAlertRulesId","Position","GroupByTargetColumnName")
			SELECT "OutFDAAlertRulesId",
					CAST(SPLIT_PART("VALUE",'^',1) AS INT) "Rank",
					SPLIT_PART("VALUE",'^',2) "SegmentName" 
			FROM UNNEST(STRING_TO_ARRAY("InTargetSegmentByColumnsLevel1" ,'|')) "VALUE"
			ORDER BY "Rank";
		END IF;
	----------------------------------------------------------------TARGET SECONDARY SEGMENT SOURCE TARGET VALUE-------------------------------------------		
		IF COALESCE("InTargetSegmentByColumnsLevel2",'') > '' AND "InAlertType" = 'SourceTargetValue'
		THEN
			INSERT INTO fda."FDAAlertRulesTargetSegmentSecondary"
			("FDAAlertRulesId","Position","GroupByTargetColumnName")
			SELECT "OutFDAAlertRulesId",
					CAST(SPLIT_PART("VALUE",'^',1) AS INT) "Rank",
					SPLIT_PART("VALUE",'^',2) "SegmentName" 
			FROM UNNEST(STRING_TO_ARRAY("InTargetSegmentByColumnsLevel2" ,'|')) "VALUE"
			ORDER BY "Rank";
		END IF;
		
	END IF;	
	END IF;
	END IF;
END IF;
   
-------------------------------------------------SOURCE TARGET COLUMN MAPPING------------------------------------------------------------------

IF UPPER("InUploadInd") = UPPER('BulkUpload') THEN
    INSERT INTO fda."FDAAlertRulesColumnMapping"
    ("FDAAlertRulesId","Position","SourceColumnName","SourceDataType","TargetColumnName","TargetDataType","Function","Status")
     SELECT "OutFDAAlertRulesId",
            "Position",
            "SourceColumnName",
            "SourceDataType",
            "TargetColumnName",
            "TargetDataType",
            "Function",
            "Status"
     FROM
         (SELECT --"OutFDAAlertRulesId",
        y."Position" AS "Position",
        y."SourceColumnName" AS "SourceColumnName",
        y."SourceDataType" AS "SourceDataType",
        y."TargetColumnName" AS "TargetColumnName",
        y."TargetDataType" AS "TargetDataType",
         (CASE WHEN y."TargetDataType" IN  ('VARCHAR','NVARCHAR','NVARCHAR2','CHAR','STRING','DATE','DATETIME','TIME','TIMESTAMP','TIMESTAMP_LTZ','TIMESTAMP_NTZ','TIMESTAMP_TZ','TIMESTAMP6','DATETIME2','BOOLEAN','TEXT','VARBINARY','NCHAR','VARCHAR2','BLOB','CLOB','NCLOB') 
    THEN 'COUNT DISTINCT'
         WHEN y."TargetDataType" IN  ('NUMBER','INTEGER','DECIMAL','DECIMAL17,3','DECIMAL17,2','INT','NUMBER','DOUBLE','SMALLINT','TINYINT','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG')
         
         THEN  'SUM' ELSE '' END) AS "Function",
        y."Status" AS "Status"
FROM
(SELECT   x."Position",
          x."Status",
          x."SourceColumnName",
          x."TargetColumnName",
 		 (CASE WHEN x."SourceColumnName" = 'FDA_RECORD_COUNT' THEN 'NUMBER' ELSE
         (SELECT COALESCE(NULLIF(F."UserOverwriteDatatype",''),F."FieldDataType")
           FROM fda."FDASystemObjectFields" F
           JOIN fda."FDASystemObjects" O ON F."FDASystemObjectsId" = O."FDASystemObjectsId"
           JOIN fda."FDASystems" S ON   S."FDASystemsId" = O."FDASystemsId"
           WHERE F."FieldName" = x."SourceColumnName"
           AND S."SystemAliasName" = "InSourceSystemId"
           AND O."ObjectName" = "InSourceTableId")END) AS "SourceDataType",
 
 		 (CASE WHEN x."TargetColumnName" = 'FDA_RECORD_COUNT' THEN 'NUMBER' ELSE
         (SELECT COALESCE(NULLIF(F."UserOverwriteDatatype",''),F."FieldDataType")
           FROM fda."FDASystemObjectFields" F
           JOIN fda."FDASystemObjects" O ON F."FDASystemObjectsId" = O."FDASystemObjectsId"
           JOIN fda."FDASystems" S ON   S."FDASystemsId" = O."FDASystemsId"
           WHERE F."FieldName" = x."TargetColumnName"
           AND S."SystemAliasName" = "InTargetSystemId"
           AND O."ObjectName" = "InTargetTableId")END) AS "TargetDataType"
FROM        
     (SELECT   
    SPLIT_PART(value, '^', 2) AS "Status",
    CAST(SPLIT_PART(value, '^', 1) AS INT) + 1 AS "Position",  
    SPLIT_PART(value, '^', 3) AS "SourceColumnName",
    SPLIT_PART(value, '^', 4) AS "TargetColumnName",
    CASE WHEN SPLIT_PART(value, '^', 4) <> '' THEN 'Mapped' ELSE SPLIT_PART(value, '^', 4) END AS "MappingFunction"
FROM 
    UNNEST(STRING_TO_ARRAY("InSourceTargetColumnMapping",'|')) AS value
)x
)y)z;     
ELSE 
    IF COALESCE("InSourceTargetColumnMapping",'') > '' AND COALESCE("InSourceColumnId",'') > '' AND COALESCE("InTargetColumnId",'') > ''
    THEN
        INSERT INTO fda."FDAAlertRulesColumnMapping"
        ("FDAAlertRulesId","Position","SourceColumnName","SourceDataType","TargetColumnName","TargetDataType","Function","Status")
        SELECT  "OutFDAAlertRulesId",
                "Rank" AS "Position",
                "SourceColumnName",
                "SourceDataType",
                "TargetColumnName",
                "TargetDataType",
                "Function",
                "Status" 
        FROM     
            (SELECT 
                SPLIT_PART("VALUE",'^',1) "Rank",
                SPLIT_PART("VALUE",'^',2) "Status",
                SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',1) "SourceColumnName",
                REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',2),')','') "SourceDataType",
                SPLIT_PART(SPLIT_PART("VALUE",'^',4),'(',1) "TargetColumnName",
                UPPER(REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',4),'(',2),')','')) "TargetDataType",
                (CASE WHEN  SPLIT_PART("VALUE",'^',5) > '' THEN  SPLIT_PART("VALUE",'^',5)
                      WHEN  SPLIT_PART("VALUE",'^',5) = '' AND UPPER(COALESCE("InThresholdType",'')) <> UPPER('FullDataCompare') THEN 
                            (CASE WHEN REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',2),')','') IN ('VARCHAR','NVARCHAR','NVARCHAR2','CHAR','STRING','DATE','DATETIME','TIME','TIMESTAMP','TIMESTAMP_LTZ','TIMESTAMP_NTZ','TIMESTAMP_TZ','TIMESTAMP6','DATETIME2','BOOLEAN','TEXT','VARBINARY','NCHAR','VARCHAR2','BLOB','CLOB','NCLOB') THEN 'COUNT DISTINCT'
                                  WHEN REPLACE(SPLIT_PART(SPLIT_PART("VALUE",'^',3),'(',2),')','') IN  ('NUMBER','INTEGER','DECIMAL','DECIMAL17,3','DECIMAL17,2','INT','NUMBER','DOUBLE','SMALLINT','TINYINT','NUMERIC','FLOAT','BINARY_FLOAT','BINARY_DOUBLE','LONG') THEN  'SUM' 
                            END)
                        ELSE ''
                    END)"Function"
            FROM  UNNEST(STRING_TO_ARRAY("InSourceTargetColumnMapping",'|')) "VALUE" 
            )a;
    END IF;
END IF;
			 
-----------------------------------UPDATE SOURCE COLUMN LEVEL THRESHOLD DATA-----------------------------------------------------

IF "InThresholdType" IN('default','FullDataCompare')
THEN
		RAISE NOTICE 'InMaxRecordCount: % ',"InMaxRecordCount";
	
	    UPDATE fda."FDAAlertRules"
	    SET  "LowerThresholdType" = "InLowerThresholdType",
              "LowerThresholdValue" = CAST(COALESCE(NULLIF("InLowerThresholdValue",''),'0') AS BIGINT),
		      "UpperThresholdType" = "InUpperThresholdType",
		      "UpperThresholdValue" = CAST(COALESCE(NULLIF("InUpperThresholdValue",''),'0') AS BIGINT),
			  "MaxRecordCount" = "InMaxRecordCount"
		WHERE "FDAAlertRulesId" = "OutFDAAlertRulesId";
	
ELSE
        UPDATE fda."FDAAlertRules"
	    SET  "LowerThresholdType" = '',
              "LowerThresholdValue" = 0,
		      "UpperThresholdType" = '',
		      "UpperThresholdValue" = 0,
			  "MaxRecordCount" = "InMaxRecordCount"
		WHERE "FDAAlertRulesId" = "OutFDAAlertRulesId";
END IF;	 

IF "InThresholdType" = 'customize' 
THEN
	IF COALESCE("InSourceColumnLevelThreshold",'') > '' 
	THEN
	
		UPDATE fda."FDAAlertRulesSourceColumn" AS TARGET
		SET TARGET."LowerThresholdType" = SOURCE."LowerThresholdType",
			TARGET."LowerThresholdValue" = SOURCE."LowerThresholdValue" ,
			TARGET."UpperThresholdType" = SOURCE."UpperThresholdType" ,
			TARGET."UpperThresholdValue" = SOURCE."UpperThresholdValue",
			TARGET."SourceColumnLevelThresholdString" = SOURCE."SourceColumnLevelThresholdString",
			TARGET."LastUpdatedDateTime" = CURRENT_TIMESTAMP
		FROM 
			(SELECT "OutFDAAlertRulesId" FDAAlertRulesId,
					SPLIT_PART(SourceTargetComparison."VALUE",'^',1) "ColumnName",
					SPLIT_PART(SourceTargetComparison."VALUE",'^',2) "UpperThresholdType",
					SPLIT_PART(SourceTargetComparison."VALUE",'^',3) "UpperThresholdValue",
					SPLIT_PART(SourceTargetComparison."VALUE",'^',4) "LowerThresholdType",
					SPLIT_PART(SourceTargetComparison."VALUE",'^',5) "LowerThresholdValue",
					"VALUE" SourceColumnLevelThresholdString 
			FROM  UNNEST(STRING_TO_ARRAY("InSourceColumnLevelThreshold" ,'|')) "VALUE"
			WHERE "VALUE" IS NOT NULL
			) AS SOURCE
		WHERE TARGET."FDAAlertRulesId" = SOURCE."FDAAlertRulesId"
		AND TARGET."SourceColumnName" = SOURCE."ColumnName";
		
		RAISE NOTICE 'Value: % ','MERGE';

	END IF;
END IF;

   --Update Target Column Level Threshold Data
IF "InTargetColumnLevelThreshold" > '' 
THEN 
	IF "InThresholdType" = 'customize' 
	THEN
		PERFORM fda."Proc_InsertCustomThresholdDetails" ("OutFDAAlertRulesId","InTargetColumnLevelThreshold");
	END IF;
ELSE
   
		UPDATE fda."FDAAlertRulesTargetColumn"
		SET  "LowerThresholdType" = '',
			"LowerThresholdValue" = 0,
			"UpperThresholdType" = '',
			"UpperThresholdValue" = 0
		WHERE "FDAAlertRulesId" = "OutFDAAlertRulesId";

END IF;

-----------------------------------------------------------SAVE SOURCE SEGMENT VALUE----------------------------------------------------------------
IF "InSourceSegmentValue" > ''
THEN
	RAISE NOTICE 'Value: % ','SourceSegmentValue INSERT';     
   /*INSERT INTO fda."FDAAlertRulesSourceSegmentValue"
	(
	"FDAAlertRulesId",
    "CheckedStatus",
	"SourceSegmentValue1",
	"SourceSegmentValue2",
	"SourceSegmentValue3",
	"SourceSegmentValue4",
	"SourceSegmentValue5",
	"LastUpdatedBy",
	"LastUpdatedDateTime"
	)
	SELECT 
	"OutFDAAlertRulesId",
	CASE WHEN SPLIT_PART("VALUE",'^',1) = 'undefined' THEN ''
	ELSE SPLIT_PART("VALUE",'^',1) END,
    CASE WHEN SPLIT_PART("VALUE",'^',2) = 'undefined' THEN ''
	ELSE SPLIT_PART("VALUE",'^',2) END,
	CASE WHEN SPLIT_PART("VALUE",'^',3) = 'undefined' THEN ''
	ELSE SPLIT_PART("VALUE",'^',3) END,
	CASE WHEN SPLIT_PART("VALUE",'^',4) = 'undefined' THEN ''
	ELSE SPLIT_PART("VALUE",'^',4) END,
	CASE WHEN SPLIT_PART("VALUE",'^',5) = 'undefined' THEN ''
	ELSE SPLIT_PART("VALUE",'^',5) END,
	CASE WHEN SPLIT_PART("VALUE",'^',6) = 'undefined' THEN ''
	ELSE SPLIT_PART("VALUE",'^',6) END,
	"InUpdatedBy",
	CURRENT_TIMESTAMP
	FROM UNNEST(STRING_TO_ARRAY("InSourceSegmentValue" ,'|')) "VALUE";
	*/
END IF;
-----------------------------------------------------------SAVE TARGET SEGMENT VALUE---------------------------------------------------
IF "InTargetSegmentValue" > ''
THEN
RAISE NOTICE 'Value: % ','TargetSegmentValue INSERT';
    INSERT INTO fda."FDAAlertRulesTargetSegmentValue"
	(
		"FDAAlertRulesId",
		"CheckedStatus",
		"TargetSegmentValue1",
		"TargetSegmentValue2",
		"TargetSegmentValue3",
		"TargetSegmentValue4",
		"TargetSegmentValue5",
		"LastUpdatedBy",
		"LastUpdatedDateTime"
	)
	SELECT 
		"OutFDAAlertRulesId",
		CASE WHEN SPLIT_PART("VALUE",'^',1) = 'undefined' THEN '' ELSE SPLIT_PART("VALUE",'^',1) END,
		CASE WHEN SPLIT_PART("VALUE",'^',2) = 'undefined' THEN '' ELSE SPLIT_PART("VALUE",'^',2) END,
		CASE WHEN SPLIT_PART("VALUE",'^',3) = 'undefined' THEN '' ELSE SPLIT_PART("VALUE",'^',3) END,
		CASE WHEN SPLIT_PART("VALUE",'^',4) = 'undefined' THEN '' ELSE SPLIT_PART("VALUE",'^',4) END,
		CASE WHEN SPLIT_PART("VALUE",'^',5) = 'undefined' THEN '' ELSE SPLIT_PART("VALUE",'^',5) END,
		CASE WHEN SPLIT_PART("VALUE",'^',6) = 'undefined' THEN '' ELSE SPLIT_PART("VALUE",'^',6) END,
		"InUpdatedBy",
		CURRENT_TIMESTAMP
	FROM UNNEST(STRING_TO_ARRAY("InTargetSegmentValue" ,'|')) "VALUE";

END IF;

---------------------------------------------ALERT CONDITION INSERT--------------------------------------------------------------------------------------------------
FOR row IN "ITEM_CURSOR_S" LOOP
/*"First" = REPLACE(CAST(row AS TEXT),'(','');
"First" = REPLACE("First",')',''); 
"First" = REPLACE("First",'"',''); */
"First" = CAST(row AS TEXT);
"First" = REPLACE("First",'""','"');
"ConditionValue" = (SELECT RIGHT("Value",LENGTH("Value") - STRPOS("Value",','))  
					FROM (SELECT RIGHT("First", LENGTH("First") - STRPOS("First",',')) "Value" )x
					);
					
RAISE NOTICE 'ConditionValue: % ',"ConditionValue";					
                
	IF (SPLIT_PART("First",',',1) > '' AND SPLIT_PART("First",',',2) > '' AND "ConditionValue" > '')
	THEN
		
		INSERT INTO fda."FDAAlertConditionSource"
				(
					"FDAAlertRulesId" ,
					"AlertTypeInd" ,
					"DataType",
					"ColumnName",
					"Condition" ,
					"Value" ,
					"CreatedDateTime" ,
					"UpdatedBy"
				)
		VALUES 
				(
					"OutFDAAlertRulesId"  ,
					"InAlertType",
					(SELECT COALESCE(NULLIF(a."UserOverwriteDatatype",''),a."FieldDataType") "DataType" 
					FROM fda."FDASystemObjectFields" a
					INNER JOIN  fda."FDASystemObjects" b
					ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
					INNER JOIN fda."FDASystems" c
					ON b."FDASystemsId" = c."FDASystemsId"
					WHERE a."FieldName" = SPLIT_PART(SPLIT_PART("First",',',1),'"',2)
					AND b."ObjectName" = "InSourceTableId"
					AND c."SystemAliasName" = "InSourceSystemId"),
					SPLIT_PART(SPLIT_PART("First",',',1),'"',2),
					SPLIT_PART("First",',',2),
					(SELECT LEFT("ConditionValue", STRPOS("ConditionValue",'")')-1)),
					CURRENT_TIMESTAMP,
					"InUpdatedBy"
				);
	END IF;
		
END LOOP;
 

 
  
FOR row IN "ITEM_CURSOR_T" LOOP
/*"Second" = REPLACE(CAST(row AS TEXT),'(','');
"Second" = REPLACE("Second",')',''); 
"Second" = REPLACE("Second",'"',''); */
"Second" = CAST(row AS TEXT);
"Second" = REPLACE("Second",'""','"');
RAISE NOTICE 'Second: % ',"Second";
"ConditionValue" = (SELECT RIGHT("Value",LENGTH("Value") - STRPOS("Value",','))  
					FROM (SELECT RIGHT("Second", LENGTH("Second") - STRPOS("Second",',')) "Value" )x
					);

RAISE NOTICE 'ConditionValue: % ',"ConditionValue";

    IF (SPLIT_PART("Second",',',1) > '' AND SPLIT_PART("Second",',',2) > '' AND "ConditionValue" > '')
	THEN
		INSERT INTO fda."FDAAlertConditionTarget"
				(
					"FDAAlertRulesId" ,
					"AlertTypeInd" ,
					"DataType",
					"ColumnName",
					"Condition" ,
					"Value" ,
					"CreatedDateTime" ,
					"UpdatedBy"
				)
		VALUES 
				(
					"OutFDAAlertRulesId" ,
					"InAlertType",
					(SELECT COALESCE(NULLIF(a."UserOverwriteDatatype",''),a."FieldDataType") "DataType"
					FROM fda."FDASystemObjectFields" a
					INNER JOIN  fda."FDASystemObjects" b
					ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
					INNER JOIN fda."FDASystems" c
					ON b."FDASystemsId" = c."FDASystemsId"
					WHERE a."FieldName" = SPLIT_PART(SPLIT_PART("Second",',',1),'"',2)
					AND b."ObjectName" = "InTargetTableId"
					AND c."SystemAliasName" = "InTargetSystemId"),
					SPLIT_PART(SPLIT_PART("Second",',',1),'"',2),
					SPLIT_PART("Second",',',2),
					(SELECT LEFT("ConditionValue", STRPOS("ConditionValue",'")')-1)),			
					CURRENT_TIMESTAMP,
					"InUpdatedBy"
				);
	END  IF;
		
END LOOP;

------------------------------------------------------------ALERT EMAIL INSERT---------------------------------------------------------------------------------------

IF COALESCE("InUserEmailTobeNotfied",'') > ''
THEN
-- Insert users to be notified
RAISE NOTICE 'VALUE: % ','NotifiedOwnerEmail INSERT';
RAISE NOTICE 'InUserEmailTobeNotfied: % ',"InUserEmailTobeNotfied";
    INSERT INTO fda."FDANotifiedOwnerEmail"
	(
		"FDAAlertRulesId" ,
		"Email"
	)
	SELECT  "OutFDAAlertRulesId",                                                                                
			"VALUE"
	FROM UNNEST(STRING_TO_ARRAY("InUserEmailTobeNotfied" ,'|')) "VALUE"
	WHERE "VALUE" IS NOT NULL;
		
END IF;

IF COALESCE("InPrimaryOwnerEmail",'') > ''
THEN
-- Insert Primary Owner email
RAISE NOTICE 'VALUE: % ','PrimaryOwnerEmail INSERT';
RAISE NOTICE 'InPrimaryOwnerEmail: % ',"InPrimaryOwnerEmail";

    INSERT INTO fda."FDAPrimaryOwnerEmail"
	(
		"FDAAlertRulesId" ,
		"Email"
	)
	SELECT  "OutFDAAlertRulesId",                                                                                
			"VALUE"
	FROM UNNEST(STRING_TO_ARRAY("InPrimaryOwnerEmail" ,'|')) "VALUE"
	WHERE "VALUE" IS NOT NULL;
		
END IF;

IF COALESCE("InSecondaryOwnerEmail",'') > ''
THEN
-- Insert Secondary Owner email
RAISE NOTICE 'VALUE: % ','SecondaryOwnerEmail INSERT';
RAISE NOTICE 'InSecondaryOwnerEmail: % ',"InSecondaryOwnerEmail";
    INSERT INTO fda."FDASecondaryOwnerEmail"
	(
		"FDAAlertRulesId" ,
		"Email"
	)
	SELECT  "OutFDAAlertRulesId",                                                                                
			"VALUE"
    FROM UNNEST(STRING_TO_ARRAY("InSecondaryOwnerEmail" ,'|')) "VALUE"
    WHERE "VALUE" IS NOT NULL;
		
END IF;
-----------------------------------------------------------------------------------------------------------------------------------------------------	

RAISE NOTICE 'FDAAlertRulesId: % ',"OutFDAAlertRulesId";
RAISE NOTICE 'SourceColumnNames: % ',"SourceColumnNames";
RAISE NOTICE 'SourceColumn: % ',"InSourceColumnId";
RAISE NOTICE 'SourceColumnCount: % ',"SourceColumnCount";
RAISE NOTICE 'TargetColumn: % ',"InTargetColumnId";
RAISE NOTICE 'TargetColumnCount: % ',"TargetColumnCount";
RAISE NOTICE 'PrimaryGroupBySourceColumn: % ',"InSourceSegmentByColumnsLevel1";
RAISE NOTICE 'SecondaryGroupBySourceColumn: % ',"InSourceSegmentByColumnsLevel2";
RAISE NOTICE 'PrimaryGroupByTargetColumn: % ',"InTargetSegmentByColumnsLevel1";
RAISE NOTICE 'SecondaryGroupByTargetColumn: % ',"InTargetSegmentByColumnsLevel2";
RAISE NOTICE 'ConditionValue: % ',"ConditionValue";
RAISE NOTICE 'Second: % ',"Second";

OPEN $51 FOR	
	SELECT "OutFDAAlertRulesId";
RETURN NEXT $51;

END;
$BODY$;
----------------------------------------------------------------------------------------------------------------