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
				AND  "FDAObjectSegmentId" IS NULL
		INTO 	
			"Result";
	ELSE		
		SELECT  SUM("OutlierCount") "OutlierCount"
		FROM  fda."FDAObjectScoreOutlierCountByCategory"
        WHERE "FDAObjectScoreId" = "InObjectScoreId"
		AND "MasterRuleId" = SPLIT_PART("InRuleName",'-',1)::BIGINT
		AND  LOWER(COALESCE("RuleName",'NULL')) = LOWER(SPLIT_PART("InRuleName",'-',2))	
		AND  "FDAObjectSegmentId" IS NULL
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

