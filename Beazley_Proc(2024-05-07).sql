Alter table fda."FDASystems"
add "PassPhrase" character varying(150);
-------------------------------------------------------
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
			SET "SystemAliasName" = "InSystemAliasName",
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
-----------------------------------------------------------------
CREATE OR REPLACE FUNCTION fda."Proc_ViewFDAMaintainDatabase"(
	"InFDASystemId" character varying,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
	DECLARE "OutSystemName" 		VARCHAR;
			"OutSystemOwner" 		VARCHAR;
			"OutSystemAliasName" 	VARCHAR;
			"OutSystemType" 		VARCHAR;
			"OutSystemUserName" 	VARCHAR;
			"OutSystemPassword" 	VARCHAR;
			"OutSystemCategoryType" VARCHAR;
			"OutLastUpdatedBy" 		VARCHAR;
			"OutLastUpdatedOn" 		VARCHAR;
			"OutConnectionDetails" 	VARCHAR;
			"OutSchema" 			VARCHAR;
			"OutWarehouse" 			VARCHAR;
			"OutRoleName" 			VARCHAR;
			"OutAccountName" 		VARCHAR;
			"OutContainerName" 		VARCHAR;
			"OutAccessKeyID" 		VARCHAR;   
			"OutSecretAccessKey" 	VARCHAR;
			"OutBucketName" 		VARCHAR ;
			"OutUsageFlag" 			VARCHAR ;
			"OutLandscapeName"      VARCHAR ;
			"OutRegion"				VARCHAR ;
			"OutS3BucketLocation"	VARCHAR ;
			"OutPortNumber"			VARCHAR ;
			--"OutSpreadSheetId"		VARCHAR ;
			"OutClientEmail"		VARCHAR ;
			"OutPrivateKey"			VARCHAR ;
			"OutProjectId" 			VARCHAR ;
			"OutConnectionOption" 	VARCHAR ;
			"OutPassPhrase" 	    VARCHAR ;
			
						

BEGIN

	SELECT 
			"SystemName",
			COALESCE("SystemOwner",''),
			"SystemAliasName",
			"SystemType",
			"SystemUserName",
			(CASE WHEN "SystemPassword" > '' THEN '*****'
				ELSE '*****' 
			END) "SystemPassword",
			UPPER("SystemCategoryType"),
			"LastUpdatedBy",
			"LastUpdatedOn",
			"ConnectionDetails",
			"Schema",
			"Warehouse",
			"RoleName",
			COALESCE("AccountName",''),
			COALESCE("ContainerName",''),
			"AccessKeyID" ,  
			"SecretAccessKey" as "SecretAccessKey",
			"BucketName",
			COALESCE("UsageFlag",''),
			COALESCE("LandscapeName",''),
			COALESCE("Region" ,''),
			COALESCE("S3BucketLocation" ,''),
			COALESCE("PortNumber":: TEXT,''),
			--COALESCE("SpreadSheetId",''),
			COALESCE("ProjectId",''),
			COALESCE("ClientEmail",''),
			(CASE WHEN "PrivateKey" > '' THEN '**********'
				ELSE '**********' 
			END) AS "PrivateKey",
			COALESCE("ConnectionOption",''),
			COALESCE("PassPhrase",'')
			
	INTO 
			"OutSystemName",
			"OutSystemOwner",
			"OutSystemAliasName",
			"OutSystemType",
			"OutSystemUserName",
			"OutSystemPassword",
			"OutSystemCategoryType",
			"OutLastUpdatedBy",
			"OutLastUpdatedOn",
			"OutConnectionDetails",
			"OutSchema",
			"OutWarehouse" ,
			"OutRoleName" ,
			"OutAccountName",
			"OutContainerName",
			"OutAccessKeyID"  ,  
			"OutSecretAccessKey",
			"OutBucketName",
			"OutUsageFlag",
			"OutLandscapeName",
			"OutRegion",				
			"OutS3BucketLocation",	
			"OutPortNumber",
			--"OutSpreadSheetId",
			"OutProjectId",
			"OutClientEmail",	
			"OutPrivateKey",
			"OutConnectionOption",
			"OutPassPhrase"
			
			
	FROM fda."FDASystems"
	WHERE CAST("FDASystemsId" AS VARCHAR) = "InFDASystemId";
	
	OPEN $2 FOR
		SELECT "OutSystemName",
				"OutSystemOwner",
				"OutSystemAliasName",
				"OutSystemType",
				"OutSystemUserName",
				"OutSystemPassword",
				"OutSystemCategoryType",
				"OutLastUpdatedBy",
				"OutLastUpdatedOn",
				"OutConnectionDetails",
				"OutSchema",
				"OutWarehouse" ,
				"OutRoleName",
				"OutAccountName",
				"OutContainerName",
				"OutAccessKeyID" ,   
				"OutSecretAccessKey",
				"OutBucketName",
				"OutUsageFlag",
				"OutLandscapeName",
				"OutRegion",				
				"OutS3BucketLocation",	
				"OutPortNumber",
				--"OutSpreadSheetId",
				"OutProjectId" ,
				"OutClientEmail",	
				"OutPrivateKey",
				"OutConnectionOption",
				"OutPassPhrase";
	RETURN NEXT $2;
END;
$BODY$;
----------------------------------------------------------------
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
			"OutSystemName",
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
------------------------------------------------------
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

declare "lvFieldName" text;

BEGIN

SELECT 	b."FieldName"
INTO "lvFieldName"
FROM fda."FDADataQualityMasterRulesDetails" a
INNER JOIN fda."FDASystemObjectFields" b
	ON a."FDADataQualityRulesId" = b."MasterRuleId"
INNER JOIN fda."FDASystems" c
	ON b."FDASystemsId" =c."FDASystemsId" 
INNER JOIN fda."FDASystemObjects" d
	ON b."FDASystemObjectsId" = d."FDASystemObjectsId"
	AND c."FDASystemsId" = d."FDASystemsId"
WHERE b."FDASystemObjectFieldsId" = "InFieldId";
	
OPEN $3 FOR --OPEN THE REF CURSOR
	SELECT DISTINCT
		d."ObjectName",
		c."SystemName",
		c."SystemAliasName",
		c."SystemPassword",
		c."ConnectionDetails",
		c."SystemUserName",
		c."Schema",
		c."RoleName",
		c."Warehouse",
		c."Region",
		c."S3BucketLocation",
		c."PortNumber",
		c."AccessKeyID",
		c."SecretAccessKey",
		c."ClientEmail",
		c."PrivateKey",
		c."ProjectId",
		c."PassPhrase",
		COALESCE(a."SegmentedByFieldName",'') "SegmentedByFieldName",
		COALESCE(a."SegmentedByFieldValue",'') "SegmentedByFieldValue",
		a."RuleType" AS "RuleName", 
		b."FieldName",
		(CASE WHEN a."RuleType" IN ('Fixed static value','Possible Character') THEN COALESCE(NULLIF(a."LeftFieldValue",'null'),'')
			ELSE COALESCE(NULLIF(a."LeftFieldValue",'null'),'') END ) AS "LeftFieldValue", 
		(CASE WHEN a."RuleType" IN ('Fixed static value','Possible Character') THEN COALESCE(NULLIF(a."RightFieldValue",'null'),'')
			ELSE COALESCE(NULLIF(a."RightFieldValue",'null'),'') END ) AS "RightFieldValue",
		--REPLACE(COALESCE(NULLIF(a."RightFieldValue",'null'),''),',','~^~') "RightFieldValue",
        UPPER(c."SystemType") "SystemType",
        (CASE WHEN b."FieldDataType" IN ('VARCHAR','NVARCHAR','CHAR','BOOLEAN','TEXT','STRING','CHAR','CHARACTER','NCHAR','TEXT','NVARCHAR','NVARCHAR2','CHAR VARYING','NCHAR VARYING') AND COALESCE(b."UserOverwriteDatatype",'STRING')= 'STRING'THEN  'STRING'
              WHEN b."FieldDataType" IN ('NUMBER','INTEGER','DECIMAL','INT','FLOAT','NUMERIC','BIGINT','SMALLINT','TINYINT','BYTEINT','FLOAT','FLOAT4','FLOAT8','DOUBLE','DOUBLE PRECISION','REAL') AND COALESCE(b."UserOverwriteDatatype",'NUMBER')= 'NUMBER'THEN  'NUMBER'
              WHEN b."FieldDataType" IN ('DATE','DATETIME','TIME','TIMESTAMP','TIMESTAMP_LTZ','TIMESTAMP_NTZ','TIMESTAMP_TZ','DATETIME2') AND COALESCE(b."UserOverwriteDatatype",'DATE')= 'DATE'  THEN  'DATE'
		 ELSE b."UserOverwriteDatatype" END) "FieldDataType"
          --b."UserOverwriteDatatype"
    FROM fda."FDADataQualityMasterRulesDetails" a
	INNER JOIN fda."FDASystemObjectFields" b
		ON a."FDADataQualityRulesId" = b."MasterRuleId"
	INNER JOIN fda."FDASystems" c
	
		ON b."FDASystemsId" =c."FDASystemsId" 
	INNER JOIN fda."FDASystemObjects" d
		ON b."FDASystemObjectsId" = d."FDASystemObjectsId"
		AND c."FDASystemsId" = d."FDASystemsId"
    WHERE b."FDASystemObjectFieldsId" = "InFieldId";

---PERFORM fda."Proc_ErrorTracking"('Proc_ListFieldOutlierCheckRules','lvFieldName'||'-'||coalesce("lvFieldName",'NULL'),"lvFieldName",'Mohan');
	
RETURN NEXT $3;

END;
$BODY$;
-------------------------------------------------------------------
CREATE OR REPLACE FUNCTION fda."Proc_InsertFDAFullDataCompareAlertRunHistory"(
	"InAlertId" bigint,
	"InAlertRunId" bigint,
	"InSourceData" text,
	"InTargetData" text,
	"InSegmentCount" text,
	"InUpdatedBy" text)
    RETURNS integer
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
AS $BODY$
 
DECLARE "lvDataCompareRunId" BIGINT;
		"lvLastRunId" BIGINT;
		"lvSourceExtraRecordCount" BIGINT;
		"lvTargetExtraRecordCount" BIGINT;
		"lvSeverity" BIGINT;
		"lvAlertType" VARCHAR;
		"lvAlertRunCount" BIGINT;
		"lvBaseLineType" VARCHAR;
		"lvBaseLineValue" BIGINT;
		"lvThresholdType" VARCHAR;
		"lvThresholdLimit" BIGINT;
		"lvSourceRecordCount" BIGINT;
		"lvTargetRecordCount" BIGINT;
		
		"lvTotalRecordCount" BIGINT;
		"lvTotalDataMisMatchCount" BIGINT;
		
		"lvRecordDiffPercent" DECIMAL(18,3);
		
		"lvColumnInfo" TEXT;
		"lvSegmentInfo" TEXT;

BEGIN
	
	--ALERT DETAILS FETCH
	SELECT "AlertTypeInd","BaseLineValueType",CAST(COALESCE(NULLIF("BaseLineValue",''),'1') AS BIGINT),"UpperThresholdType","UpperThresholdValue"
		INTO "lvAlertType","lvBaseLineType","lvBaseLineValue","lvThresholdType","lvThresholdLimit"
	FROM fda."FDAAlertRules"
	WHERE "FDAAlertRulesId" = "InAlertId";
	
	SELECT a."FDAAlertOutputId"
		INTO "lvLastRunId"
	FROM fda."FDAAlertOutput" a,
		fda."FDAAlertRules" b
	WHERE a."FDAAlertRulesId" = b."FDAAlertRulesId"
		AND a."FDAAlertRulesId" = "InAlertId"
		AND a."CurrentAlertStatus" = 'COMPLETE'
		AND CAST(a."UpdatedDateTime" AS DATE) >= CAST(b."NewBaseLineDateTime" AS DATE)
        --AND CAST(a."UpdatedDateTime" AS TIME) > CAST(b."NewBaseLineDateTime" AS TIME)
	ORDER BY a."FDAAlertOutputId" DESC
	LIMIT 1;

	RAISE NOTICE 'lvAlertType : %', "lvAlertType";
	RAISE NOTICE 'lvBaseLineType : %', "lvBaseLineType";
	RAISE NOTICE 'lvBaseLineValue : %', "lvBaseLineValue";
	RAISE NOTICE 'lvThresholdType : %', "lvThresholdType";
	RAISE NOTICE 'lvThresholdLimit : %', "lvThresholdLimit";

	--ALERT RUN COUNT CHECK
	SELECT COUNT(a."FDAAlertOutputId")
		INTO "lvAlertRunCount"
	FROM fda."FDAAlertOutput" a,
		fda."FDAAlertRules" b
	WHERE a."FDAAlertRulesId" = b."FDAAlertRulesId"
		AND a."FDAAlertRulesId" = "InAlertId"
		AND a."CurrentAlertStatus" = 'COMPLETE'
		AND CAST(a."UpdatedDateTime" AS DATE) >= CAST(b."NewBaseLineDateTime" AS DATE)
        AND CAST(a."UpdatedDateTime" AS TIME) > CAST(b."NewBaseLineDateTime" AS TIME);
		--AND CAST(a."UpdatedDateTime" AS timestamp without time zone) >= b."NewBaseLineDateTime";
		
	RAISE NOTICE 'lvAlertRunCount : %', "lvAlertRunCount";

IF UPPER("lvAlertType") = UPPER('SourceTargetValue') THEN 
		SELECT 
		STRING_AGG("Position"||'^'||"SourceColumnName" ||'^'||"TargetColumnName",'|') "ColumnInfo"
		INTO "lvColumnInfo"
		FROM 
		(SELECT 
			"FDAAlertRulesId",
			"Position",
			"Status",
				 "SourceColumnName",
				 "TargetColumnName"
		FROM fda."FDAAlertRulesColumnMapping" 
		WHERE "Status" = 'true'
			AND "FDAAlertRulesId" = "InAlertId") X;
	ELSE 
		SELECT STRING_AGG("Position"||'^'||"TargetColumnName",'|') "ColumnInfo"
		INTO "lvColumnInfo"
		FROM(SELECT  "Position","TargetColumnName"
		FROM fda."FDAAlertRulesTargetColumn"
		WHERE "FDAAlertRulesId" = "InAlertId"
		AND "Status" = 'true'
		ORDER BY "Position")x;
	END IF;
		
	SELECT STRING_AGG("TargetSegmentByName",'^') "SegmentInfo"
	INTO "lvSegmentInfo"
	FROM(SELECT  "Position"||'~'||"GroupByTargetColumnName"  "TargetSegmentByName"  
	FROM fda."FDAAlertRulesTargetSegment" 
	WHERE "FDAAlertRulesId" = "InAlertId"
	ORDER BY "Position")X;

------------------------------------------------------------------------------------------------------------------

IF "lvAlertType" = 'SourceTargetValue' AND "InAlertId" > 0 AND "InAlertRunId" > 0 THEN

	INSERT INTO fda."FDAAlertOutputFullDataCompare"
	(
		"FDAAlertOutputId" ,
		"FDAAlertRulesId" ,
		"SourceSegmentValue1"  ,
		"TargetSegmentValue1"  ,
		"SourceSegmentValue2"  ,
		"TargetSegmentValue2"  ,
		"SourceSegmentValue3"  ,
		"TargetSegmentValue3"  ,
		"SourceSegmentValue4"  ,
		"TargetSegmentValue4"  ,
		"SourceSegmentValue5"  ,
		"TargetSegmentValue5"  ,
		--"SourceSegmentValue6"  ,
		--"TargetSegmentValue6"  ,
		--"SourceSegmentValue7"  ,
		--"TargetSegmentValue7"  ,
		--"SourceSegmentValue8"  ,
		--"TargetSegmentValue8"  ,
		--"SourceSegmentValue9"  ,
		--"TargetSegmentValue9"  ,
		--"SourceSegmentValue10"  ,
		--"TargetSegmentValue10"  ,
		"SourceColumnValue1" ,
		"TargetColumnValue1" ,
		"Severity1" ,
		"SourceColumnValue2" ,
		"TargetColumnValue2" ,
		"Severity2" ,
		"SourceColumnValue3" ,
		"TargetColumnValue3" ,
		"Severity3" ,
		"SourceColumnValue4" ,
		"TargetColumnValue4" ,
		"Severity4" ,
		"SourceColumnValue5" ,
		"TargetColumnValue5" ,
		"Severity5" ,
		"SourceColumnValue6" ,
		"TargetColumnValue6" ,
		"Severity6" ,
		"SourceColumnValue7" ,
		"TargetColumnValue7" ,
		"Severity7" ,
		"SourceColumnValue8" ,
		"TargetColumnValue8" ,
		"Severity8" ,
		"SourceColumnValue9" ,
		"TargetColumnValue9" ,
		"Severity9" ,
		"SourceColumnValue10" ,
		"TargetColumnValue10" ,
		"Severity10" ,
		"SourceColumnValue11" ,
		"TargetColumnValue11" ,
		"Severity11" ,
		"SourceColumnValue12" ,
		"TargetColumnValue12" ,
		"Severity12" ,
		"SourceColumnValue13" ,
		"TargetColumnValue13" ,
		"Severity13" ,
		"SourceColumnValue14" ,
		"TargetColumnValue14" ,
		"Severity14" ,
		"SourceColumnValue15" ,
		"TargetColumnValue15" ,
		"Severity15" ,
		"SourceColumnValue16" ,
		"TargetColumnValue16" ,
		"Severity16" ,
		"SourceColumnValue17" ,
		"TargetColumnValue17" ,
		"Severity17" ,
		"SourceColumnValue18" ,
		"TargetColumnValue18" ,
		"Severity18" ,
		"SourceColumnValue19" ,
		"TargetColumnValue19" ,
		"Severity19" ,
		"SourceColumnValue20" ,
		"TargetColumnValue20" ,
		"Severity20" ,
		"SourceColumnValue21" ,
		"TargetColumnValue21" ,
		"Severity21" ,
		"SourceColumnValue22" ,
		"TargetColumnValue22" ,
		"Severity22" ,
		"SourceColumnValue23" ,
		"TargetColumnValue23" ,
		"Severity23" ,
		"SourceColumnValue24" ,
		"TargetColumnValue24" ,
		"Severity24" ,
		"SourceColumnValue25" ,
		"TargetColumnValue25" ,
		"Severity25" ,
		"SourceColumnValue26" ,
		"TargetColumnValue26" ,
		"Severity26" ,
		"SourceColumnValue27" ,
		"TargetColumnValue27" ,
		"Severity27" ,
		"SourceColumnValue28" ,
		"TargetColumnValue28" ,
		"Severity28" ,
		"SourceColumnValue29" ,
		"TargetColumnValue29" ,
		"Severity29" ,
		"SourceColumnValue30" ,
		"TargetColumnValue30" ,
		"Severity30" ,
		"SourceColumnValue31" ,
		"TargetColumnValue31" ,
		"Severity31" ,
		"SourceColumnValue32" ,
		"TargetColumnValue32" ,
		"Severity32" ,
		"SourceColumnValue33" ,
		"TargetColumnValue33" ,
		"Severity33" ,
		"SourceColumnValue34" ,
		"TargetColumnValue34" ,
		"Severity34" ,
		"SourceColumnValue35" ,
		"TargetColumnValue35" ,
		"Severity35" ,
		"SourceColumnValue36" ,
		"TargetColumnValue36" ,
		"Severity36" ,
		"SourceColumnValue37" ,
		"TargetColumnValue37" ,
		"Severity37" ,
		"SourceColumnValue38" ,
		"TargetColumnValue38" ,
		"Severity38" ,
		"SourceColumnValue39" ,
		"TargetColumnValue39" ,
		"Severity39" ,
		"SourceColumnValue40" ,
		"TargetColumnValue40" ,
		"Severity40" ,
		"SourceColumnValue41" ,
		"TargetColumnValue41" ,
		"Severity41" ,
		"SourceColumnValue42" ,
		"TargetColumnValue42" ,
		"Severity42" ,
		"SourceColumnValue43" ,
		"TargetColumnValue43" ,
		"Severity43" ,
		"SourceColumnValue44" ,
		"TargetColumnValue44" ,
		"Severity44" ,
		"SourceColumnValue45" ,
		"TargetColumnValue45" ,
		"Severity45" ,
		"SourceColumnValue46" ,
		"TargetColumnValue46" ,
		"Severity46" ,
		"SourceColumnValue47" ,
		"TargetColumnValue47" ,
		"Severity47" ,
		"SourceColumnValue48" ,
		"TargetColumnValue48" ,
		"Severity48" ,
		"SourceColumnValue49" ,
		"TargetColumnValue49" ,
		"Severity49" ,
		"SourceColumnValue50" ,
		"TargetColumnValue50" ,
		"Severity50" ,
		"SourceColumnValue51" ,
		"TargetColumnValue51" ,
		"Severity51" ,
		"SourceColumnValue52" ,
		"TargetColumnValue52" ,
		"Severity52" ,
		"SourceColumnValue53" ,
		"TargetColumnValue53" ,
		"Severity53" ,
		"SourceColumnValue54" ,
		"TargetColumnValue54" ,
		"Severity54" ,
		"SourceColumnValue55" ,
		"TargetColumnValue55" ,
		"Severity55" ,
		"SourceColumnValue56" ,
		"TargetColumnValue56" ,
		"Severity56" ,
		"SourceColumnValue57" ,
		"TargetColumnValue57" ,
		"Severity57" ,
		"SourceColumnValue58" ,
		"TargetColumnValue58" ,
		"Severity58" ,
		"SourceColumnValue59" ,
		"TargetColumnValue59" ,
		"Severity59" ,
		"SourceColumnValue60" ,
		"TargetColumnValue60" ,
		"Severity60" ,
		"SourceColumnValue61" ,
		"TargetColumnValue61" ,
		"Severity61" ,
		"SourceColumnValue62" ,
		"TargetColumnValue62" ,
		"Severity62" ,
		"SourceColumnValue63" ,
		"TargetColumnValue63" ,
		"Severity63" ,
		"SourceColumnValue64" ,
		"TargetColumnValue64" ,
		"Severity64" ,
		"SourceColumnValue65" ,
		"TargetColumnValue65" ,
		"Severity65" ,
		"SourceColumnValue66" ,
		"TargetColumnValue66" ,
		"Severity66" ,
		"SourceColumnValue67" ,
		"TargetColumnValue67" ,
		"Severity67" ,
		"SourceColumnValue68" ,
		"TargetColumnValue68" ,
		"Severity68" ,
		"SourceColumnValue69" ,
		"TargetColumnValue69" ,
		"Severity69" ,
		"SourceColumnValue70" ,
		"TargetColumnValue70" ,
		"Severity70" ,
		"SourceColumnValue71" ,
		"TargetColumnValue71" ,
		"Severity71" ,
		"SourceColumnValue72" ,
		"TargetColumnValue72" ,
		"Severity72" ,
		"SourceColumnValue73" ,
		"TargetColumnValue73" ,
		"Severity73" ,
		"SourceColumnValue74" ,
		"TargetColumnValue74" ,
		"Severity74" ,
		"SourceColumnValue75" ,
		"TargetColumnValue75" ,
		"Severity75" ,
		"SourceColumnValue76" ,
		"TargetColumnValue76" ,
		"Severity76" ,
		"SourceColumnValue77" ,
		"TargetColumnValue77" ,
		"Severity77" ,
		"SourceColumnValue78" ,
		"TargetColumnValue78" ,
		"Severity78" ,
		"SourceColumnValue79" ,
		"TargetColumnValue79" ,
		"Severity79" ,
		"SourceColumnValue80" ,
		"TargetColumnValue80" ,
		"Severity80" ,
		"SourceColumnValue81" ,
		"TargetColumnValue81" ,
		"Severity81" ,
		"SourceColumnValue82" ,
		"TargetColumnValue82" ,
		"Severity82" ,
		"SourceColumnValue83" ,
		"TargetColumnValue83" ,
		"Severity83" ,
		"SourceColumnValue84" ,
		"TargetColumnValue84" ,
		"Severity84" ,
		"SourceColumnValue85" ,
		"TargetColumnValue85" ,
		"Severity85" ,
		"SourceColumnValue86" ,
		"TargetColumnValue86" ,
		"Severity86" ,
		"SourceColumnValue87" ,
		"TargetColumnValue87" ,
		"Severity87" ,
		"SourceColumnValue88" ,
		"TargetColumnValue88" ,
		"Severity88" ,
		"SourceColumnValue89" ,
		"TargetColumnValue89" ,
		"Severity89" ,
		"SourceColumnValue90" ,
		"TargetColumnValue90" ,
		"Severity90" ,
		"SourceColumnValue91" ,
		"TargetColumnValue91" ,
		"Severity91" ,
		"SourceColumnValue92" ,
		"TargetColumnValue92" ,
		"Severity92" ,
		"SourceColumnValue93" ,
		"TargetColumnValue93" ,
		"Severity93" ,
		"SourceColumnValue94" ,
		"TargetColumnValue94" ,
		"Severity94" ,
		"SourceColumnValue95" ,
		"TargetColumnValue95" ,
		"Severity95" ,
		"SourceColumnValue96" ,
		"TargetColumnValue96" ,
		"Severity96" ,
		"SourceColumnValue97" ,
		"TargetColumnValue97" ,
		"Severity97" ,
		"SourceColumnValue98" ,
		"TargetColumnValue98" ,
		"Severity98" ,
		"SourceColumnValue99" ,
		"TargetColumnValue99" ,
		"Severity99" ,
		"SourceColumnValue100" ,
		"TargetColumnValue100" ,
		"Severity100" ,
		"LastUpdatedBy"  ,
		"LastUpdatedDateTime" 
	)
	SELECT
		"InAlertRunId",
		"InAlertId",
		
		COALESCE(SPLIT_PART(source.SegmentValue,'^',1),''),
		COALESCE(SPLIT_PART(target.SegmentValue,'^',1),''),
		COALESCE(SPLIT_PART(source.SegmentValue,'^',2),''),
		COALESCE(SPLIT_PART(target.SegmentValue,'^',2),''),
		COALESCE(SPLIT_PART(source.SegmentValue,'^',3),''),
		COALESCE(SPLIT_PART(target.SegmentValue,'^',3),''),
		COALESCE(SPLIT_PART(source.SegmentValue,'^',4),''),
		COALESCE(SPLIT_PART(target.SegmentValue,'^',4),''),
		COALESCE(SPLIT_PART(source.SegmentValue,'^',5),''),
		COALESCE(SPLIT_PART(target.SegmentValue,'^',5),''),
		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',1),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',1)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',1)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',1),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',1),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',1)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',1)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',1),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',1),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',1),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',1),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',1),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',1),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',1),'') THEN 9 ELSE 1 END)
		END),
------------------------------
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',2),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',2)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',2)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',2),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',2),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',2)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',2)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',2),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',2),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',2),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',2),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',2),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',2),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',2),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',3),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',3)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',3)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',3),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',3),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',3)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',3)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',3),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',3),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',3),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',3),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',3),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',3),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',3),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',4),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',4)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',4)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',4),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',4),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',4)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',4)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',4),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',4),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',4),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',4),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',4),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',4),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',4),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',5),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',5)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',5)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',5),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',5),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',5)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',5)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',5),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',5),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',5),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',5),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',5),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',5),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',5),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',6),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',6)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',6)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',6),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',6),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',6)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',6)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',6),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',6),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',6),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',6),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',6),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',6),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',6),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',7),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',7)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',7)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',7),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',7),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',7)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',7)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',7),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',7),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',7),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',7),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',7),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',7),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',7),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',8),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',8)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',8)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',8),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',8),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',8)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',8)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',8),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',8),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',8),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',8),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',8),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',8),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',8),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',9),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',9)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',9)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',9),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',9),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',9)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',9)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',9),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',9),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',9),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',9),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',9),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',9),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',9),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',10),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',10)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',10)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',10),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',10),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',10)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',10)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',10),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',10),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',10),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',10),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',10),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',10),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',10),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',11),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',11)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',11)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',11),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',11),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',11)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',11)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',11),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',11),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',11),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',11),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',11),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',11),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',11),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',12),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',12)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',12)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',12),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',12),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',12)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',12)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',12),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',12),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',12),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',12),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',12),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',12),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',12),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',13),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',13)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',13)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',13),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',13),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',13)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',13)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',13),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',13),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',13),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',13),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',13),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',13),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',13),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',14),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',14)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',14)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',14),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',14),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',14)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',14)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',14),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',14),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',14),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',14),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',14),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',14),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',14),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',15),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',15)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',15)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',15),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',15),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',15)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',15)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',15),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',15),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',15),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',15),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',15),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',15),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',15),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',16),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',16)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',16)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',16),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',16),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',16)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',16)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',16),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',16),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',16),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',16),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',16),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',16),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',16),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',17),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',17)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',17)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',17),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',17),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',17)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',17)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',17),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',17),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',17),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',17),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',17),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',17),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',17),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',18),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',18)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',18)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',18),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',18),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',18)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',18)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',18),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',18),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',18),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',18),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',18),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',18),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',18),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',19),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',19)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',19)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',19),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',19),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',19)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',19)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',19),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',19),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',19),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',19),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',19),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',19),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',19),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',20),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',20)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',20)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',20),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',20),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',20)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',20)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',20),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',20),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',20),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',20),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',20),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',20),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',20),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',21),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',21)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',21)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',21),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',21),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',21)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',21)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',21),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',21),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',21),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',21),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',21),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',21),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',21),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',22),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',22)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',22)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',22),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',22),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',22)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',22)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',22),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',22),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',22),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',22),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',22),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',22),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',22),'') THEN 9 ELSE 1 END)
		END),
----------------------------------		
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',23),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(source.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(source.ColumnValue,'^',23)::numeric(32,2))::text 
							ELSE (SPLIT_PART(source.ColumnValue,'^',23)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(source.ColumnValue,'^',23),'') 
		END),
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',23),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',23)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',23)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',23),'') 
		END),		
		(CASE WHEN (COALESCE(SPLIT_PART(source.ColumnValue,'^',23),'') ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',23),'') ~ '^[0-9\.]+$'= 'true') 
					THEN (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',23),'')::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',23),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END)
			ELSE (CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',23),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',23),'') THEN 9 ELSE 1 END)
		END),
----------------------------------	
		COALESCE(SPLIT_PART(source.ColumnValue,'^',24),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',24),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',24),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',24),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',25),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',25),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',25),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',25),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',26),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',26),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',26),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',26),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',27),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',27),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',27),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',27),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',28),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',28),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',28),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',28),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',29),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',29),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',29),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',29),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',30),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',30),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',30),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',30),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',31),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',31),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',31),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',31),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',32),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',32),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',32),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',32),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',33),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',33),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',33),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',33),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',34),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',34),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',34),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',34),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',35),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',35),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',35),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',35),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',36),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',36),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',36),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',36),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',37),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',37),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',37),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',37),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',38),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',38),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',38),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',38),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',39),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',39),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',39),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',39),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',40),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',40),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',40),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',40),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',41),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',41),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',41),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',41),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',42),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',42),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',42),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',42),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',43),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',43),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',43),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',43),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',44),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',44),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',44),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',44),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',45),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',45),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',45),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',45),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',46),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',46),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',46),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',46),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',47),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',47),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',47),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',47),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',48),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',48),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',48),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',48),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',49),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',49),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',49),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',49),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',50),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',50),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',50),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',50),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',51),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',51),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',51),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',51),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',52),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',52),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',52),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',52),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',53),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',53),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',53),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',53),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',54),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',54),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',54),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',54),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',55),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',55),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',55),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',55),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',56),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',56),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',56),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',56),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',57),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',57),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',57),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',57),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',58),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',58),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',58),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',58),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',59),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',59),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',59),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',59),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',60),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',60),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',60),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',60),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',61),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',61),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',61),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',61),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',62),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',62),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',62),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',62),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',63),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',63),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',63),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',63),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',64),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',64),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',64),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',64),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',65),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',65),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',65),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',65),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',66),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',66),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',66),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',66),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',67),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',67),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',67),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',67),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',68),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',68),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',68),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',68),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',69),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',69),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',69),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',69),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',70),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',70),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',70),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',70),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',71),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',71),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',71),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',71),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',72),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',72),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',72),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',72),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',73),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',73),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',73),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',73),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',74),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',74),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',74),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',74),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',75),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',75),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',75),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',75),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',76),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',76),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',76),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',76),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',77),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',77),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',77),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',77),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',78),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',78),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',78),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',78),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',79),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',79),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',79),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',79),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',80),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',80),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',80),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',80),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',81),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',81),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',81),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',81),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',82),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',82),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',82),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',82),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',83),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',83),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',83),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',83),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',84),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',84),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',84),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',84),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',85),''),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',85),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',85),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',85),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',86),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',86),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',86),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',86),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',87),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',87),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',87),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',87),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',88),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',88),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',88),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',88),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',89),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',89),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',89),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',89),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',90),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',90),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',90),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',90),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',91),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',91),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',91),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',91),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',92),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',92),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',92),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',92),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',93),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',93),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',93),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',93),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',94),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',94),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',94),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',94),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',95),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',95),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',95),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',95),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',96),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',96),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',96),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',96),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',97),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',97),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',97),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',97),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',98),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',98),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',98),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',98),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',99),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',99),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',99),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',99),'') THEN 9 ELSE 1 END),
		COALESCE(SPLIT_PART(source.ColumnValue,'^',100),''),
		COALESCE(SPLIT_PART(target.ColumnValue,'^',100),''),
		(CASE WHEN COALESCE(SPLIT_PART(source.ColumnValue,'^',100),'') = COALESCE(SPLIT_PART(target.ColumnValue,'^',100),'') THEN 9 ELSE 1 END),

		"InUpdatedBy",
		CURRENT_TIMESTAMP
	FROM (SELECT DISTINCT "VALUE",
				SPLIT_PART("VALUE",'=',1) SegmentValue ,
				SPLIT_PART("VALUE",'=',2) ColumnValue
			FROM UNNEST(STRING_TO_ARRAY("InSourceData" ,'~')) "VALUE"
			WHERE "VALUE" IS NOT NULL) source
	LEFT OUTER JOIN 
		(SELECT DISTINCT "VALUE",
				SPLIT_PART("VALUE",'=',1) SegmentValue ,
				SPLIT_PART("VALUE",'=',2) ColumnValue
		FROM UNNEST(STRING_TO_ARRAY("InTargetData" ,'~')) "VALUE"
		WHERE "VALUE" IS NOT NULL) target
	ON source.SegmentValue = target.SegmentValue;
	
ELSE IF  "lvAlertType" = 'TargetValue' AND "InAlertId" > 0 AND "InAlertRunId" > 0 THEN

	INSERT INTO fda."FDAAlertOutputFullDataCompare"
	(
		"FDAAlertOutputId" ,
		"FDAAlertRulesId" ,
		"SourceSegmentValue1"  ,
		"TargetSegmentValue1"  ,
		"SourceSegmentValue2"  ,
		"TargetSegmentValue2"  ,
		"SourceSegmentValue3"  ,
		"TargetSegmentValue3"  ,
		"SourceSegmentValue4"  ,
		"TargetSegmentValue4"  ,
		"SourceSegmentValue5"  ,
		"TargetSegmentValue5"  ,
		--"SourceSegmentValue6"  ,
		--"TargetSegmentValue6"  ,
		--"SourceSegmentValue7"  ,
		--"TargetSegmentValue7"  ,
		--"SourceSegmentValue8"  ,
		--"TargetSegmentValue8"  ,
		--"SourceSegmentValue9"  ,
		--"TargetSegmentValue9"  ,
		--"SourceSegmentValue10"  ,
		--"TargetSegmentValue10"  ,
		"SourceColumnValue1" ,
		"TargetColumnValue1" ,
		"Severity1" ,
		"SourceColumnValue2" ,
		"TargetColumnValue2" ,
		"Severity2" ,
		"SourceColumnValue3" ,
		"TargetColumnValue3" ,
		"Severity3" ,
		"SourceColumnValue4" ,
		"TargetColumnValue4" ,
		"Severity4" ,
		"SourceColumnValue5" ,
		"TargetColumnValue5" ,
		"Severity5" ,
		"SourceColumnValue6" ,
		"TargetColumnValue6" ,
		"Severity6" ,
		"SourceColumnValue7" ,
		"TargetColumnValue7" ,
		"Severity7" ,
		"SourceColumnValue8" ,
		"TargetColumnValue8" ,
		"Severity8" ,
		"SourceColumnValue9" ,
		"TargetColumnValue9" ,
		"Severity9" ,
		"SourceColumnValue10" ,
		"TargetColumnValue10" ,
		"Severity10" ,
		"SourceColumnValue11" ,
		"TargetColumnValue11" ,
		"Severity11" ,
		"SourceColumnValue12" ,
		"TargetColumnValue12" ,
		"Severity12" ,
		"SourceColumnValue13" ,
		"TargetColumnValue13" ,
		"Severity13" ,
		"SourceColumnValue14" ,
		"TargetColumnValue14" ,
		"Severity14" ,
		"SourceColumnValue15" ,
		"TargetColumnValue15" ,
		"Severity15" ,
		"SourceColumnValue16" ,
		"TargetColumnValue16" ,
		"Severity16" ,
		"SourceColumnValue17" ,
		"TargetColumnValue17" ,
		"Severity17" ,
		"SourceColumnValue18" ,
		"TargetColumnValue18" ,
		"Severity18" ,
		"SourceColumnValue19" ,
		"TargetColumnValue19" ,
		"Severity19" ,
		"SourceColumnValue20" ,
		"TargetColumnValue20" ,
		"Severity20" ,
		"SourceColumnValue21" ,
		"TargetColumnValue21" ,
		"Severity21" ,
		"SourceColumnValue22" ,
		"TargetColumnValue22" ,
		"Severity22" ,
		"SourceColumnValue23" ,
		"TargetColumnValue23" ,
		"Severity23" ,
		"SourceColumnValue24" ,
		"TargetColumnValue24" ,
		"Severity24" ,
		"SourceColumnValue25" ,
		"TargetColumnValue25" ,
		"Severity25" ,
		"SourceColumnValue26" ,
		"TargetColumnValue26" ,
		"Severity26" ,
		"SourceColumnValue27" ,
		"TargetColumnValue27" ,
		"Severity27" ,
		"SourceColumnValue28" ,
		"TargetColumnValue28" ,
		"Severity28" ,
		"SourceColumnValue29" ,
		"TargetColumnValue29" ,
		"Severity29" ,
		"SourceColumnValue30" ,
		"TargetColumnValue30" ,
		"Severity30" ,
		"SourceColumnValue31" ,
		"TargetColumnValue31" ,
		"Severity31" ,
		"SourceColumnValue32" ,
		"TargetColumnValue32" ,
		"Severity32" ,
		"SourceColumnValue33" ,
		"TargetColumnValue33" ,
		"Severity33" ,
		"SourceColumnValue34" ,
		"TargetColumnValue34" ,
		"Severity34" ,
		"SourceColumnValue35" ,
		"TargetColumnValue35" ,
		"Severity35" ,
		"SourceColumnValue36" ,
		"TargetColumnValue36" ,
		"Severity36" ,
		"SourceColumnValue37" ,
		"TargetColumnValue37" ,
		"Severity37" ,
		"SourceColumnValue38" ,
		"TargetColumnValue38" ,
		"Severity38" ,
		"SourceColumnValue39" ,
		"TargetColumnValue39" ,
		"Severity39" ,
		"SourceColumnValue40" ,
		"TargetColumnValue40" ,
		"Severity40" ,
		"SourceColumnValue41" ,
		"TargetColumnValue41" ,
		"Severity41" ,
		"SourceColumnValue42" ,
		"TargetColumnValue42" ,
		"Severity42" ,
		"SourceColumnValue43" ,
		"TargetColumnValue43" ,
		"Severity43" ,
		"SourceColumnValue44" ,
		"TargetColumnValue44" ,
		"Severity44" ,
		"SourceColumnValue45" ,
		"TargetColumnValue45" ,
		"Severity45" ,
		"SourceColumnValue46" ,
		"TargetColumnValue46" ,
		"Severity46" ,
		"SourceColumnValue47" ,
		"TargetColumnValue47" ,
		"Severity47" ,
		"SourceColumnValue48" ,
		"TargetColumnValue48" ,
		"Severity48" ,
		"SourceColumnValue49" ,
		"TargetColumnValue49" ,
		"Severity49" ,
		"SourceColumnValue50" ,
		"TargetColumnValue50" ,
		"Severity50" ,
		"SourceColumnValue51" ,
		"TargetColumnValue51" ,
		"Severity51" ,
		"SourceColumnValue52" ,
		"TargetColumnValue52" ,
		"Severity52" ,
		"SourceColumnValue53" ,
		"TargetColumnValue53" ,
		"Severity53" ,
		"SourceColumnValue54" ,
		"TargetColumnValue54" ,
		"Severity54" ,
		"SourceColumnValue55" ,
		"TargetColumnValue55" ,
		"Severity55" ,
		"SourceColumnValue56" ,
		"TargetColumnValue56" ,
		"Severity56" ,
		"SourceColumnValue57" ,
		"TargetColumnValue57" ,
		"Severity57" ,
		"SourceColumnValue58" ,
		"TargetColumnValue58" ,
		"Severity58" ,
		"SourceColumnValue59" ,
		"TargetColumnValue59" ,
		"Severity59" ,
		"SourceColumnValue60" ,
		"TargetColumnValue60" ,
		"Severity60" ,
		"SourceColumnValue61" ,
		"TargetColumnValue61" ,
		"Severity61" ,
		"SourceColumnValue62" ,
		"TargetColumnValue62" ,
		"Severity62" ,
		"SourceColumnValue63" ,
		"TargetColumnValue63" ,
		"Severity63" ,
		"SourceColumnValue64" ,
		"TargetColumnValue64" ,
		"Severity64" ,
		"SourceColumnValue65" ,
		"TargetColumnValue65" ,
		"Severity65" ,
		"SourceColumnValue66" ,
		"TargetColumnValue66" ,
		"Severity66" ,
		"SourceColumnValue67" ,
		"TargetColumnValue67" ,
		"Severity67" ,
		"SourceColumnValue68" ,
		"TargetColumnValue68" ,
		"Severity68" ,
		"SourceColumnValue69" ,
		"TargetColumnValue69" ,
		"Severity69" ,
		"SourceColumnValue70" ,
		"TargetColumnValue70" ,
		"Severity70" ,
		"SourceColumnValue71" ,
		"TargetColumnValue71" ,
		"Severity71" ,
		"SourceColumnValue72" ,
		"TargetColumnValue72" ,
		"Severity72" ,
		"SourceColumnValue73" ,
		"TargetColumnValue73" ,
		"Severity73" ,
		"SourceColumnValue74" ,
		"TargetColumnValue74" ,
		"Severity74" ,
		"SourceColumnValue75" ,
		"TargetColumnValue75" ,
		"Severity75" ,
		"SourceColumnValue76" ,
		"TargetColumnValue76" ,
		"Severity76" ,
		"SourceColumnValue77" ,
		"TargetColumnValue77" ,
		"Severity77" ,
		"SourceColumnValue78" ,
		"TargetColumnValue78" ,
		"Severity78" ,
		"SourceColumnValue79" ,
		"TargetColumnValue79" ,
		"Severity79" ,
		"SourceColumnValue80" ,
		"TargetColumnValue80" ,
		"Severity80" ,
		"SourceColumnValue81" ,
		"TargetColumnValue81" ,
		"Severity81" ,
		"SourceColumnValue82" ,
		"TargetColumnValue82" ,
		"Severity82" ,
		"SourceColumnValue83" ,
		"TargetColumnValue83" ,
		"Severity83" ,
		"SourceColumnValue84" ,
		"TargetColumnValue84" ,
		"Severity84" ,
		"SourceColumnValue85" ,
		"TargetColumnValue85" ,
		"Severity85" ,
		"SourceColumnValue86" ,
		"TargetColumnValue86" ,
		"Severity86" ,
		"SourceColumnValue87" ,
		"TargetColumnValue87" ,
		"Severity87" ,
		"SourceColumnValue88" ,
		"TargetColumnValue88" ,
		"Severity88" ,
		"SourceColumnValue89" ,
		"TargetColumnValue89" ,
		"Severity89" ,
		"SourceColumnValue90" ,
		"TargetColumnValue90" ,
		"Severity90" ,
		"SourceColumnValue91" ,
		"TargetColumnValue91" ,
		"Severity91" ,
		"SourceColumnValue92" ,
		"TargetColumnValue92" ,
		"Severity92" ,
		"SourceColumnValue93" ,
		"TargetColumnValue93" ,
		"Severity93" ,
		"SourceColumnValue94" ,
		"TargetColumnValue94" ,
		"Severity94" ,
		"SourceColumnValue95" ,
		"TargetColumnValue95" ,
		"Severity95" ,
		"SourceColumnValue96" ,
		"TargetColumnValue96" ,
		"Severity96" ,
		"SourceColumnValue97" ,
		"TargetColumnValue97" ,
		"Severity97" ,
		"SourceColumnValue98" ,
		"TargetColumnValue98" ,
		"Severity98" ,
		"SourceColumnValue99" ,
		"TargetColumnValue99" ,
		"Severity99" ,
		"SourceColumnValue100" ,
		"TargetColumnValue100" ,
		"Severity100" ,
		"LastUpdatedBy"  ,
		"LastUpdatedDateTime" 
	)
	SELECT
		"InAlertRunId",
		"InAlertId",
		
		COALESCE(source."SourceSegmentValue1",SPLIT_PART(target.SegmentValue,'^',1)),
		COALESCE(SPLIT_PART(target.SegmentValue,'^',1),''),
		COALESCE(source."SourceSegmentValue2",SPLIT_PART(target.SegmentValue,'^',2)),
		COALESCE(SPLIT_PART(target.SegmentValue,'^',2),''),
		COALESCE(source."SourceSegmentValue3",SPLIT_PART(target.SegmentValue,'^',3)),
		COALESCE(SPLIT_PART(target.SegmentValue,'^',3),''),
		COALESCE(source."SourceSegmentValue4",SPLIT_PART(target.SegmentValue,'^',4)),
		COALESCE(SPLIT_PART(target.SegmentValue,'^',4),''),
		COALESCE(source."SourceSegmentValue5",SPLIT_PART(target.SegmentValue,'^',5)),
		COALESCE(SPLIT_PART(target.SegmentValue,'^',5),''),
		
		source."SourceColumnValue1",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',1),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',1)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',1)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',1),'') 
		END),	
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue1" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',1),'') ~ '^[0-9\.]+$'= 'true' ) --AND length('.') <> 1
				THEN (CASE WHEN source."SourceColumnValue1"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',1),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue1" = COALESCE(SPLIT_PART(target.ColumnValue,'^',1),'') THEN 9 ELSE 1 END) 
		END),
----------------------------------------------		
		source."SourceColumnValue2",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',2),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',2)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',2)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',2),'') 
		END),	
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue2" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',2),'') ~ '^[0-9\.]+$'= 'true' ) --AND length('.') <> 1
				THEN (CASE WHEN source."SourceColumnValue2"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',2),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue2" = COALESCE(SPLIT_PART(target.ColumnValue,'^',2),'') THEN 9 ELSE 1 END) 
		END),
----------------------------------------------
		source."SourceColumnValue3",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',3),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',3)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',3)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',3),'') 
		END),	
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue3" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',3),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue3"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',3),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue3" = COALESCE(SPLIT_PART(target.ColumnValue,'^',3),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------	
		source."SourceColumnValue4",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',4),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',4)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',4)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',4),'') 
		END),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue4" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',4),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue4"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',4),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue4" = COALESCE(SPLIT_PART(target.ColumnValue,'^',4),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------	
		source."SourceColumnValue5",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',5),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',5)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',5)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',5),'') 
		END),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue5" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',5),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue5"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',5),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue5" = COALESCE(SPLIT_PART(target.ColumnValue,'^',5),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------	
		source."SourceColumnValue6",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',6),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',6)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',6)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',6),'') 
		END),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue6" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',6),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue6"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',6),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue6" = COALESCE(SPLIT_PART(target.ColumnValue,'^',6),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------	
		source."SourceColumnValue7",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',7),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',7)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',7)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',7),'') 
		END),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue7" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',7),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue7"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',7),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
			ELSE (CASE WHEN source."SourceColumnValue7" = COALESCE(SPLIT_PART(target.ColumnValue,'^',7),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------	
		source."SourceColumnValue8",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',8),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',8)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',8)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',8),'') 
		END),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue8" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',8),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue8"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',8),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
			ELSE (CASE WHEN source."SourceColumnValue8" = COALESCE(SPLIT_PART(target.ColumnValue,'^',8),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------	
		source."SourceColumnValue9",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',9),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',9)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',9)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',9),'') 
		END),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue9" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',9),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue9"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',9),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue9" = COALESCE(SPLIT_PART(target.ColumnValue,'^',9),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------	
		source."SourceColumnValue10",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',10),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',10)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',10)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',10),'') 
		END),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue10" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',10),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue10"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',10),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue10" = COALESCE(SPLIT_PART(target.ColumnValue,'^',10),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------	
		source."SourceColumnValue11",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',11),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',11)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',11)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',11),'') 
		END),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue11" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',11),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue11"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',11),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue11" = COALESCE(SPLIT_PART(target.ColumnValue,'^',11),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------	
		source."SourceColumnValue12",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',12),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',12)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',12)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',12),'') 
		END),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue12" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',12),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue12"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',12),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue12" = COALESCE(SPLIT_PART(target.ColumnValue,'^',12),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------	
		source."SourceColumnValue13",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',13),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',13)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',13)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',13),'') 
		END),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue13" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',13),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue13"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',13),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue13" = COALESCE(SPLIT_PART(target.ColumnValue,'^',13),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------	
		source."SourceColumnValue14",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',14),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',14)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',14)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',14),'') 
		END),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue14" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',14),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue14"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',14),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue14" = COALESCE(SPLIT_PART(target.ColumnValue,'^',14),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------	
		source."SourceColumnValue15",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',15),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',15)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',15)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',15),'') 
		END),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue15" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',15),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue15"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',15),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue15" = COALESCE(SPLIT_PART(target.ColumnValue,'^',15),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------	
		source."SourceColumnValue16",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',16),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',16)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',16)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',16),'') 
		END),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue16" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',16),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue16"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',16),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue16" = COALESCE(SPLIT_PART(target.ColumnValue,'^',16),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------	
		source."SourceColumnValue17",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',17),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',17)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',17)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',17),'') 
		END),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue17" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',17),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue17"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',17),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue17" = COALESCE(SPLIT_PART(target.ColumnValue,'^',17),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------	
		source."SourceColumnValue18",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',18),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',18)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',18)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',18),'') 
		END),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue18" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',18),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue18"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',18),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue18" = COALESCE(SPLIT_PART(target.ColumnValue,'^',18),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------	
		source."SourceColumnValue19",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',19),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',19)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',19)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',19),'') 
		END),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue19" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',19),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue19"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',19),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue19" = COALESCE(SPLIT_PART(target.ColumnValue,'^',19),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------
		source."SourceColumnValue20",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',20),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',20)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',20)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',20),'') 
		END),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue20" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',20),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue20"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',20),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue20" = COALESCE(SPLIT_PART(target.ColumnValue,'^',20),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------
		source."SourceColumnValue21",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',21),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',21)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',21)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',21),'') 
		END),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue21" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',21),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue21"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',21),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue21" = COALESCE(SPLIT_PART(target.ColumnValue,'^',21),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------
		source."SourceColumnValue22",
		(CASE WHEN COALESCE(SPLIT_PART(target.ColumnValue,'^',22),'') ~ '^[0-9\.]+$' = 'true' 
					THEN(CASE WHEN strpos(target.ColumnValue::text, '.') > 0 THEN (SPLIT_PART(target.ColumnValue,'^',22)::numeric(32,2))::text 
							ELSE (SPLIT_PART(target.ColumnValue,'^',22)::numeric)::text 
						END)
			ELSE COALESCE(SPLIT_PART(target.ColumnValue,'^',22),'') 
		END),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue22" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',22),'') ~ '^[0-9\.]+$'= 'true' ) 
				THEN (CASE WHEN source."SourceColumnValue22"::numeric(32,2) - COALESCE(SPLIT_PART(target.ColumnValue,'^',22),'')::numeric(32,2) = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue22" = COALESCE(SPLIT_PART(target.ColumnValue,'^',22),'') THEN 9 ELSE 1 END) 
		END),
	----------------------------------------------
		source."SourceColumnValue23",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',23),''),
		(CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9
			  WHEN (source."SourceColumnValue23" ~ '^[0-9\.]+$' = 'true' AND COALESCE(SPLIT_PART(target.ColumnValue,'^',23),'') ~ '^[0-9\.]+$'= 'true' AND length('.') <> 1) 
				THEN (CASE WHEN source."SourceColumnValue23"::numeric - COALESCE(SPLIT_PART(target.ColumnValue,'^',23),'')::numeric = 0.00 THEN 9 ELSE 1 END) 
		ELSE (CASE WHEN source."SourceColumnValue23" = COALESCE(SPLIT_PART(target.ColumnValue,'^',23),'') THEN 9 ELSE 1 END) 
		END),
		source."SourceColumnValue24",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',24),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue24" = COALESCE(SPLIT_PART(target.ColumnValue,'^',24),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue25",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',25),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue25" = COALESCE(SPLIT_PART(target.ColumnValue,'^',25),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue26",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',26),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue26" = COALESCE(SPLIT_PART(target.ColumnValue,'^',26),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue27",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',27),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue27" = COALESCE(SPLIT_PART(target.ColumnValue,'^',27),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue28",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',28),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue28" = COALESCE(SPLIT_PART(target.ColumnValue,'^',28),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue29",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',29),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue29" = COALESCE(SPLIT_PART(target.ColumnValue,'^',29),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue30",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',30),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue30" = COALESCE(SPLIT_PART(target.ColumnValue,'^',30),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue31",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',31),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue31" = COALESCE(SPLIT_PART(target.ColumnValue,'^',31),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue32",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',32),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue32" = COALESCE(SPLIT_PART(target.ColumnValue,'^',32),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue33",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',33),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue33" = COALESCE(SPLIT_PART(target.ColumnValue,'^',33),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue34",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',34),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue34" = COALESCE(SPLIT_PART(target.ColumnValue,'^',34),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue35",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',35),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue35" = COALESCE(SPLIT_PART(target.ColumnValue,'^',35),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue36",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',36),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue36" = COALESCE(SPLIT_PART(target.ColumnValue,'^',36),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue37",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',37),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue37" = COALESCE(SPLIT_PART(target.ColumnValue,'^',37),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue38",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',38),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue38" = COALESCE(SPLIT_PART(target.ColumnValue,'^',38),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue39",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',39),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue39" = COALESCE(SPLIT_PART(target.ColumnValue,'^',39),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue40",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',40),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue40" = COALESCE(SPLIT_PART(target.ColumnValue,'^',40),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue41",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',41),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue41" = COALESCE(SPLIT_PART(target.ColumnValue,'^',41),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue42",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',42),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue42" = COALESCE(SPLIT_PART(target.ColumnValue,'^',42),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue43",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',43),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue43" = COALESCE(SPLIT_PART(target.ColumnValue,'^',43),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue44",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',44),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue44" = COALESCE(SPLIT_PART(target.ColumnValue,'^',44),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue45",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',45),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue45" = COALESCE(SPLIT_PART(target.ColumnValue,'^',45),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue46",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',46),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue46" = COALESCE(SPLIT_PART(target.ColumnValue,'^',46),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue47",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',47),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue47" = COALESCE(SPLIT_PART(target.ColumnValue,'^',47),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue48",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',48),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue48" = COALESCE(SPLIT_PART(target.ColumnValue,'^',48),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue49",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',49),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue49" = COALESCE(SPLIT_PART(target.ColumnValue,'^',49),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue50",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',50),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue50" = COALESCE(SPLIT_PART(target.ColumnValue,'^',50),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue51",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',51),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue51" = COALESCE(SPLIT_PART(target.ColumnValue,'^',51),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue52",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',52),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue52" = COALESCE(SPLIT_PART(target.ColumnValue,'^',52),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue53",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',53),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue53" = COALESCE(SPLIT_PART(target.ColumnValue,'^',53),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue54",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',54),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue54" = COALESCE(SPLIT_PART(target.ColumnValue,'^',54),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue55",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',55),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue55" = COALESCE(SPLIT_PART(target.ColumnValue,'^',55),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue56",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',56),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue56" = COALESCE(SPLIT_PART(target.ColumnValue,'^',56),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue57",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',57),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue57" = COALESCE(SPLIT_PART(target.ColumnValue,'^',57),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue58",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',58),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue58" = COALESCE(SPLIT_PART(target.ColumnValue,'^',58),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue59",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',59),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue59" = COALESCE(SPLIT_PART(target.ColumnValue,'^',59),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue60",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',60),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue60" = COALESCE(SPLIT_PART(target.ColumnValue,'^',60),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue61",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',61),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue61" = COALESCE(SPLIT_PART(target.ColumnValue,'^',61),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue62",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',62),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue62" = COALESCE(SPLIT_PART(target.ColumnValue,'^',62),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue63",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',63),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue63" = COALESCE(SPLIT_PART(target.ColumnValue,'^',63),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue64",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',64),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue64" = COALESCE(SPLIT_PART(target.ColumnValue,'^',64),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue65",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',65),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue65" = COALESCE(SPLIT_PART(target.ColumnValue,'^',65),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue66",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',66),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue66" = COALESCE(SPLIT_PART(target.ColumnValue,'^',66),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue67",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',67),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue67" = COALESCE(SPLIT_PART(target.ColumnValue,'^',67),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue68",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',68),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue68" = COALESCE(SPLIT_PART(target.ColumnValue,'^',68),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue69",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',69),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue69" = COALESCE(SPLIT_PART(target.ColumnValue,'^',69),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue70",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',70),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue70" = COALESCE(SPLIT_PART(target.ColumnValue,'^',70),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue71",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',71),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue71" = COALESCE(SPLIT_PART(target.ColumnValue,'^',71),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue72",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',72),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue72" = COALESCE(SPLIT_PART(target.ColumnValue,'^',72),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue73",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',73),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue73" = COALESCE(SPLIT_PART(target.ColumnValue,'^',73),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue74",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',74),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue74" = COALESCE(SPLIT_PART(target.ColumnValue,'^',74),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue75",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',75),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue75" = COALESCE(SPLIT_PART(target.ColumnValue,'^',75),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue76",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',76),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue76" = COALESCE(SPLIT_PART(target.ColumnValue,'^',76),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue77",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',77),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue77" = COALESCE(SPLIT_PART(target.ColumnValue,'^',77),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue78",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',78),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue78" = COALESCE(SPLIT_PART(target.ColumnValue,'^',78),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue79",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',79),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue79" = COALESCE(SPLIT_PART(target.ColumnValue,'^',79),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue80",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',80),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue80" = COALESCE(SPLIT_PART(target.ColumnValue,'^',80),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue81",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',81),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue81" = COALESCE(SPLIT_PART(target.ColumnValue,'^',81),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue82",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',82),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue82" = COALESCE(SPLIT_PART(target.ColumnValue,'^',82),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue83",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',83),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue83" = COALESCE(SPLIT_PART(target.ColumnValue,'^',83),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue84",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',84),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue84" = COALESCE(SPLIT_PART(target.ColumnValue,'^',84),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue85",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',85),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue85" = COALESCE(SPLIT_PART(target.ColumnValue,'^',85),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue86",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',86),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue86" = COALESCE(SPLIT_PART(target.ColumnValue,'^',86),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue87",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',87),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue87" = COALESCE(SPLIT_PART(target.ColumnValue,'^',87),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue88",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',88),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue88" = COALESCE(SPLIT_PART(target.ColumnValue,'^',88),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue89",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',89),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue89" = COALESCE(SPLIT_PART(target.ColumnValue,'^',89),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue90",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',90),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue90" = COALESCE(SPLIT_PART(target.ColumnValue,'^',90),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue91",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',91),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue91" = COALESCE(SPLIT_PART(target.ColumnValue,'^',91),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue92",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',92),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue92" = COALESCE(SPLIT_PART(target.ColumnValue,'^',92),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue93",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',93),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue93" = COALESCE(SPLIT_PART(target.ColumnValue,'^',93),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue94",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',94),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue94" = COALESCE(SPLIT_PART(target.ColumnValue,'^',94),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue95",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',95),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue95" = COALESCE(SPLIT_PART(target.ColumnValue,'^',95),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue96",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',96),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue96" = COALESCE(SPLIT_PART(target.ColumnValue,'^',96),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue97",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',97),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue97" = COALESCE(SPLIT_PART(target.ColumnValue,'^',97),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue98",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',98),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue98" = COALESCE(SPLIT_PART(target.ColumnValue,'^',98),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue99",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',99),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue99" = COALESCE(SPLIT_PART(target.ColumnValue,'^',99),'') THEN 9 ELSE 1 END,
		source."SourceColumnValue100",
		COALESCE(SPLIT_PART(target.ColumnValue,'^',100),''),
		CASE WHEN COALESCE("lvAlertRunCount",0) = 0 THEN 9 WHEN source."SourceColumnValue100" = COALESCE(SPLIT_PART(target.ColumnValue,'^',100),'') THEN 9 ELSE 1 END,
		
		
		"InUpdatedBy",
		CURRENT_TIMESTAMP
	FROM (SELECT DISTINCT
			"TargetSegmentValue1" AS "SourceSegmentValue1",
			"TargetSegmentValue2" AS "SourceSegmentValue2",
			"TargetSegmentValue3" AS "SourceSegmentValue3",
			"TargetSegmentValue4" AS "SourceSegmentValue4",
			"TargetSegmentValue5" AS "SourceSegmentValue5",
			"TargetColumnValue1" AS	"SourceColumnValue1",
			"TargetColumnValue2" AS	"SourceColumnValue2",
			"TargetColumnValue3" AS	"SourceColumnValue3",
			"TargetColumnValue4" AS	"SourceColumnValue4",
			"TargetColumnValue5" AS	"SourceColumnValue5",
			"TargetColumnValue6" AS	"SourceColumnValue6",
			"TargetColumnValue7" AS	"SourceColumnValue7",
			"TargetColumnValue8" AS	"SourceColumnValue8",
			"TargetColumnValue9" AS	"SourceColumnValue9",
			"TargetColumnValue10" AS "SourceColumnValue10",
			"TargetColumnValue11" AS "SourceColumnValue11",
			"TargetColumnValue12" AS "SourceColumnValue12",
			"TargetColumnValue13" AS "SourceColumnValue13",
			"TargetColumnValue14" AS "SourceColumnValue14",
			"TargetColumnValue15" AS "SourceColumnValue15",
			"TargetColumnValue16" AS "SourceColumnValue16",
			"TargetColumnValue17" AS "SourceColumnValue17",
			"TargetColumnValue18" AS "SourceColumnValue18",
			"TargetColumnValue19" AS "SourceColumnValue19",
			"TargetColumnValue20" AS "SourceColumnValue20",
			"TargetColumnValue21" AS "SourceColumnValue21",
			"TargetColumnValue22" AS "SourceColumnValue22",
			"TargetColumnValue23" AS "SourceColumnValue23",
			"TargetColumnValue24" AS "SourceColumnValue24",
			"TargetColumnValue25" AS "SourceColumnValue25",
			"TargetColumnValue26" AS "SourceColumnValue26",
			"TargetColumnValue27" AS "SourceColumnValue27",
			"TargetColumnValue28" AS "SourceColumnValue28",
			"TargetColumnValue29" AS "SourceColumnValue29",
			"TargetColumnValue30" AS "SourceColumnValue30",
			"TargetColumnValue31" AS "SourceColumnValue31",
			"TargetColumnValue32" AS "SourceColumnValue32",
			"TargetColumnValue33" AS "SourceColumnValue33",
			"TargetColumnValue34" AS "SourceColumnValue34",
			"TargetColumnValue35" AS "SourceColumnValue35",
			"TargetColumnValue36" AS "SourceColumnValue36",
			"TargetColumnValue37" AS "SourceColumnValue37",
			"TargetColumnValue38" AS "SourceColumnValue38",
			"TargetColumnValue39" AS "SourceColumnValue39",
			"TargetColumnValue40" AS "SourceColumnValue40",
			"TargetColumnValue41" AS "SourceColumnValue41",
			"TargetColumnValue42" AS "SourceColumnValue42",
			"TargetColumnValue43" AS "SourceColumnValue43",
			"TargetColumnValue44" AS "SourceColumnValue44",
			"TargetColumnValue45" AS "SourceColumnValue45",
			"TargetColumnValue46" AS "SourceColumnValue46",
			"TargetColumnValue47" AS "SourceColumnValue47",
			"TargetColumnValue48" AS "SourceColumnValue48",
			"TargetColumnValue49" AS "SourceColumnValue49",
			"TargetColumnValue50" AS "SourceColumnValue50",
			"TargetColumnValue51" AS "SourceColumnValue51",
			"TargetColumnValue52" AS "SourceColumnValue52",
			"TargetColumnValue53" AS "SourceColumnValue53",
			"TargetColumnValue54" AS "SourceColumnValue54",
			"TargetColumnValue55" AS "SourceColumnValue55",
			"TargetColumnValue56" AS "SourceColumnValue56",
			"TargetColumnValue57" AS "SourceColumnValue57",
			"TargetColumnValue58" AS "SourceColumnValue58",
			"TargetColumnValue59" AS "SourceColumnValue59",
			"TargetColumnValue60" AS "SourceColumnValue60",
			"TargetColumnValue61" AS "SourceColumnValue61",
			"TargetColumnValue62" AS "SourceColumnValue62",
			"TargetColumnValue63" AS "SourceColumnValue63",
			"TargetColumnValue64" AS "SourceColumnValue64",
			"TargetColumnValue65" AS "SourceColumnValue65",
			"TargetColumnValue66" AS "SourceColumnValue66",
			"TargetColumnValue67" AS "SourceColumnValue67",
			"TargetColumnValue68" AS "SourceColumnValue68",
			"TargetColumnValue69" AS "SourceColumnValue69",
			"TargetColumnValue70" AS "SourceColumnValue70",
			"TargetColumnValue71" AS "SourceColumnValue71",
			"TargetColumnValue72" AS "SourceColumnValue72",
			"TargetColumnValue73" AS "SourceColumnValue73",
			"TargetColumnValue74" AS "SourceColumnValue74",
			"TargetColumnValue75" AS "SourceColumnValue75",
			"TargetColumnValue76" AS "SourceColumnValue76",
			"TargetColumnValue77" AS "SourceColumnValue77",
			"TargetColumnValue78" AS "SourceColumnValue78",
			"TargetColumnValue79" AS "SourceColumnValue79",
			"TargetColumnValue80" AS "SourceColumnValue80",
			"TargetColumnValue81" AS "SourceColumnValue81",
			"TargetColumnValue82" AS "SourceColumnValue82",
			"TargetColumnValue83" AS "SourceColumnValue83",
			"TargetColumnValue84" AS "SourceColumnValue84",
			"TargetColumnValue85" AS "SourceColumnValue85",
			"TargetColumnValue86" AS "SourceColumnValue86",
			"TargetColumnValue87" AS "SourceColumnValue87",
			"TargetColumnValue88" AS "SourceColumnValue88",
			"TargetColumnValue89" AS "SourceColumnValue89",
			"TargetColumnValue90" AS "SourceColumnValue90",
			"TargetColumnValue91" AS "SourceColumnValue91",
			"TargetColumnValue92" AS "SourceColumnValue92",
			"TargetColumnValue93" AS "SourceColumnValue93",
			"TargetColumnValue94" AS "SourceColumnValue94",
			"TargetColumnValue95" AS "SourceColumnValue95",
			"TargetColumnValue96" AS "SourceColumnValue96",
			"TargetColumnValue97" AS "SourceColumnValue97",
			"TargetColumnValue98" AS "SourceColumnValue98",
			"TargetColumnValue99" AS "SourceColumnValue99",
			"TargetColumnValue100" AS "SourceColumnValue100"
		FROM fda."FDAAlertOutputFullDataCompare"
		WHERE "FDAAlertOutputId" = "lvLastRunId"
	    AND "TargetSegmentValue1"||"TargetSegmentValue2"||"TargetSegmentValue3"||"TargetSegmentValue4"||"TargetSegmentValue5"||"TargetColumnValue1"||"TargetColumnValue2"||"TargetColumnValue3"||"TargetColumnValue4"||"TargetColumnValue5"||"TargetColumnValue6"||"TargetColumnValue7"||"TargetColumnValue8"||"TargetColumnValue9"||"TargetColumnValue10"||"TargetColumnValue11"||"TargetColumnValue12"||"TargetColumnValue13"||"TargetColumnValue14"||"TargetColumnValue15"||"TargetColumnValue16"||"TargetColumnValue17"||"TargetColumnValue18"||"TargetColumnValue19"||"TargetColumnValue20"||"TargetColumnValue21"||"TargetColumnValue22"||"TargetColumnValue23"||"TargetColumnValue24"||"TargetColumnValue25"||"TargetColumnValue26"||"TargetColumnValue27"||"TargetColumnValue28"||"TargetColumnValue29"||"TargetColumnValue30"||"TargetColumnValue31"||"TargetColumnValue32"||"TargetColumnValue33"||"TargetColumnValue34"||"TargetColumnValue35"||"TargetColumnValue36"||"TargetColumnValue37"||"TargetColumnValue38"||"TargetColumnValue39"||"TargetColumnValue40"||"TargetColumnValue41"||"TargetColumnValue42"||"TargetColumnValue43"||"TargetColumnValue44"||"TargetColumnValue45"||"TargetColumnValue46"||"TargetColumnValue47"||"TargetColumnValue48"||"TargetColumnValue49"||"TargetColumnValue50"||"TargetColumnValue51"||"TargetColumnValue52"||"TargetColumnValue53"||"TargetColumnValue54"||"TargetColumnValue55"||"TargetColumnValue56"||"TargetColumnValue57"||"TargetColumnValue58"||"TargetColumnValue59"||"TargetColumnValue60"||"TargetColumnValue61"||"TargetColumnValue62"||"TargetColumnValue63"||"TargetColumnValue64"||"TargetColumnValue65"||"TargetColumnValue66"||"TargetColumnValue67"||"TargetColumnValue68"||"TargetColumnValue69"||"TargetColumnValue70"||"TargetColumnValue71"||"TargetColumnValue72"||"TargetColumnValue73"||"TargetColumnValue74"||"TargetColumnValue75"||"TargetColumnValue76"||"TargetColumnValue77"||"TargetColumnValue78"||"TargetColumnValue79"||"TargetColumnValue80"||"TargetColumnValue81"||"TargetColumnValue82"||"TargetColumnValue83"||"TargetColumnValue84"||"TargetColumnValue85"||"TargetColumnValue86"||"TargetColumnValue87"||"TargetColumnValue88"||"TargetColumnValue89"||"TargetColumnValue90"||"TargetColumnValue91"||"TargetColumnValue92"||"TargetColumnValue93"||"TargetColumnValue94"||"TargetColumnValue95"||"TargetColumnValue96"||"TargetColumnValue97"||"TargetColumnValue98"||"TargetColumnValue99"||"TargetColumnValue100" > ''
  		) source
	FULL JOIN 
		(SELECT DISTINCT
				"VALUE",
				SPLIT_PART(SPLIT_PART("VALUE",'=',1),'^',1) TargetSegmentValue1,
				SPLIT_PART(SPLIT_PART("VALUE",'=',1),'^',2) TargetSegmentValue2,
				SPLIT_PART(SPLIT_PART("VALUE",'=',1),'^',3) TargetSegmentValue3,
				SPLIT_PART(SPLIT_PART("VALUE",'=',1),'^',4) TargetSegmentValue4,
				SPLIT_PART(SPLIT_PART("VALUE",'=',1),'^',5) TargetSegmentValue5,
				SPLIT_PART("VALUE",'=',1) SegmentValue ,
				SPLIT_PART("VALUE",'=',2) ColumnValue
		FROM UNNEST(STRING_TO_ARRAY("InTargetData" ,'~')) "VALUE"
		WHERE "VALUE" IS NOT NULL) target
	ON source."SourceSegmentValue1"||'^'||
		source."SourceSegmentValue2"||'^'||
		source."SourceSegmentValue3"||'^'||
		source."SourceSegmentValue4"||'^'||
		source."SourceSegmentValue5" = target.TargetSegmentValue1||'^'||
										target.TargetSegmentValue2||'^'||
										target.TargetSegmentValue3||'^'||
										target.TargetSegmentValue4||'^'||
										target.TargetSegmentValue5;

END IF;
END IF;

--*/

UPDATE fda."FDAAlertOutputFullDataCompare"
SET "SegmentInfo" = "lvSegmentInfo",
	"ColumnInfo" = "lvColumnInfo"
WHERE "FDAAlertOutputId" = "InAlertRunId"
AND "FDAAlertRulesId" = "InAlertId";

SELECT COUNT(*)
INTO "lvTotalRecordCount"
FROM fda."FDAAlertOutputFullDataCompare"
WHERE "FDAAlertOutputId" = "InAlertRunId";

IF COALESCE("lvAlertRunCount",0) = 0 AND "lvAlertType" = 'TargetValue' THEN  --FIRST RUN FOR TARGET ONLY ALERT
	
	"lvSeverity" := 9;
	
ELSE

"lvSeverity" := (SELECT fda."fn_GetFulldataCompareAlertSeverity"("InAlertId","InAlertRunId","lvTotalRecordCount","lvThresholdType","lvThresholdLimit"));
	
END IF;

--/*	
	IF "lvSeverity" > 0 THEN 
	
		UPDATE fda."FDAAlertOutput"
		SET "CurrentAlertStatus" = 'COMPLETE',
			"Severity" = "lvSeverity",
			"AlertInd" = (CASE WHEN "lvSeverity" IN (1,2) THEN 'Y' ELSE 'N' END),
			"UpdatedDateTime" = CURRENT_TIMESTAMP,
			"SourceSegmentCount" = NULLIF(SPLIT_PART("InSegmentCount",'|',1),'')::bigint,
			"TargetSegmentCount" = NULLIF(SPLIT_PART("InSegmentCount",'|',2),'')::bigint,
			"UpdatedBy" = "InUpdatedBy",
			"ThresholdType" = (SELECT "ThresholdType" FROM fda."FDAAlertRules" WHERE "FDAAlertRulesId" = "InAlertId")
		WHERE "CurrentAlertStatus" = 'PENDING'
			AND "FDAAlertOutputId" = "InAlertRunId";
	
	END IF;
--*/	
	RETURN COALESCE("lvSeverity",1);

/*
SELECT fda."Proc_InsertDataCompareAlertRunHistory"(
'1085',  -- "InAlertId" bigint,
'1608',  -- "InAlertRunId" bigint,
'',  -- "InSourceData" text,
'CHEMICALS=2^0^0~CONTRACT MFG=2^0^0',  -- "InTargetData" text,
'Mangal'  -- "InUpdatedBy" text
);

*/
END;
$BODY$;
------------------------------------------------------------
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

--IF "InSearchInput" > '' THEN
BEGIN
"SelectString" :=CONCAT('SELECT 
							"FDADataQualityRulesId",
							"RuleName",
							"RuleDescription",
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
								count("RuleType") "RuleCount"
							FROM (SELECT 
										(CASE WHEN "RuleType" IN (''Enumerated Value'',''Date Range'',''Length Check'') AND ("LeftFieldValue" > '''' AND "RightFieldValue" > '''')
													THEN "RuleType" 
											  WHEN "RuleType" IN (''DataType Check'',''Possible Character'',''Blank/NonBlank'',''Fixed static value'',''Distinct Check'',''Enumerated Value(Query)'',''User Criteria'') AND "LeftFieldValue" > '''' 
													THEN "RuleType"
											  WHEN "RuleType" IN (''Range of Values'',''Possible Character'',''Row Count Variation'') AND ("LeftFieldValue" > '''' OR "RightFieldValue" > '''') 
													THEN "RuleType"  END) "RuleType",
										(CASE WHEN "RuleType" IN (''Enumerated Value'',''Range of Values'',''Date Range'',''Length Check'') AND "LeftFieldValue" > '''' or "RightFieldValue" > ''''
													THEN  CONCAT_WS(''-'',"RuleType","LeftFieldValue","RightFieldValue" )
											  WHEN "RuleType" IN (''DataType Check'',''Possible Character'',''Blank/NonBlank'',''Fixed static value'',''Distinct Check'',''Enumerated Value(Query)'',''User Criteria'') AND "LeftFieldValue" > '''' 
													THEN CONCAT_WS(''-'',"RuleType","LeftFieldValue","RightFieldValue" )
											  WHEN "RuleType" IN (''Possible Character'',''Row Count Variation'') AND ("LeftFieldValue" > '''' OR "RightFieldValue" > '''') 
													THEN CONCAT_WS(''-'',"RuleType","LeftFieldValue","RightFieldValue" )
											  END) "RuleSignature",
										"FDADataQualityRulesId" 
									from fda."FDADataQualityMasterRulesDetails"
								)m
								GROUP BY "FDADataQualityRulesId") b
								ON a."FDADataQualityRulesId" = b."FDADataQualityRulesId" 
							LEFT JOIN (SELECT
								count("FDASystemObjectFieldsId") AS "ColumnsApplied",
					   			STRING_AGG(distinct "FDASystemObjectFieldsId"::text,'','') "LinkedFields",
								c."FDADataQualityRulesId"
							FROM fda."FDASystemObjects" a
							INNER JOIN fda."FDASystemObjectFields" b
								ON a."FDASystemObjectsId" = b."FDASystemObjectsId"
							INNER JOIN fda."FDADataQualityMasterRules" c
								ON b."MasterRuleId" = c."FDADataQualityRulesId"
							GROUP BY c."FDADataQualityRulesId") e
								ON a."FDADataQualityRulesId" =  e."FDADataQualityRulesId"
							LEFT JOIN (SELECT
											COUNT(DISTINCT a."FDASystemObjectsId") AS "ObjectApplied",
					   						STRING_AGG(distinct a."FDASystemObjectsId"::text,'','') "LinkedObject",
											d."FDADataQualityRulesId" 
									  FROM fda."FDASystemObjects" a
									  LEFT JOIN(SELECT
									  		"FDASystemObjectsId",
									  		c."FDADataQualityRulesId" 
									  FROM fda."FDASystemObjectFields" b
									  INNER JOIN fda."FDADataQualityMasterRules" c
									  	ON b."MasterRuleId" = c."FDADataQualityRulesId") d
									  ON a."FDASystemObjectsId" = d."FDASystemObjectsId"
									  GROUP BY d."FDADataQualityRulesId" )f
							ON a."FDADataQualityRulesId" = f."FDADataQualityRulesId"
							LEFT JOIN (SELECT 
											SUM("OutlierCount") AS "NumberOfException",
											"MasterRuleId"
										FROM fda."FDAObjectScoreOutlierCountByCategory"
										WHERE "LastUpdatedOn" > current_date - 30
										AND "MasterRuleId" IS NOT NULL
										GROUP BY "MasterRuleId") g
							 ON a."FDADataQualityRulesId" = g."MasterRuleId"
							 LEFT JOIN fda."FDASystems" h
								ON a."FDASystemsId" = h."FDASystemsId"
							');
							
IF "InOrderBy" > '' AND "InOredrByType" > '' THEN  
"OrderBystring":= CONCAT('ORDER BY "',"InOrderBy"||'" '||"InOredrByType",'
						  OFFSET ', "InOffset" ,' ROWS
						  FETCH NEXT ',"InLimit",' ROWS ONLY');
ELSE 
"OrderBystring":= CONCAT('ORDER BY x."FDADataQualityRulesId" DESC
						  OFFSET ', "InOffset" ,' ROWS
						  FETCH NEXT ',"InLimit",' ROWS ONLY');				
END IF;

IF "InQualityRulesId" > '' OR "InRuleName" > '' OR "InRuleType" > '' OR "InSystemName" > '' OR "InRuleDescription" > '' THEN 
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
END IF;

"SelectString1" :=CONCAT("SelectString","FromString",')x  ',"WhereConditionString","OrderBystring");
"CountSelectString" := CONCAT('SELECT COUNT(*) "OutTotalRecordCount" FROM (',"SelectString","FromString",')x ',"WhereConditionString",' )Y;');

RAISE NOTICE 'SelectString : %',"SelectString1";
RAISE NOTICE 'SelectString : %',"CountSelectString";

OPEN $10 FOR --OPEN THE REF CURSOR

EXECUTE "SelectString1";

RETURN NEXT $10;

OPEN $11 FOR --OPEN THE REF CURSOR

EXECUTE "CountSelectString";

RETURN NEXT $11;
		
/*SELECT 
	a."FDADataQualityRulesId",
	"RuleName",
	"RuleType" AS "RuleType",--"RuleType",
	COALESCE(a."ObjectApplied",0) AS "ObjectApplied",
	COALESCE(a."ColumnsApplied",0) AS "ColumnsApplied",
	SUBSTRING("CreatedOn",1,10) "LastUsedOn",
	COALESCE("NumberOfException",0) AS "NumberOfException"
FROM fda."FDADataQualityMasterRules" a
LEFT JOIN (select 
	string_agg("RuleType",',')"RuleType",
	"FDADataQualityRulesId"
FROM fda."FDADataQualityMasterRulesDetails"
GROUP BY "FDADataQualityRulesId") b
ON a."FDADataQualityRulesId" = b."FDADataQualityRulesId"
OFFSET "InOffset" ROWS
FETCH NEXT "InLimit" ROWS ONLY;

OPEN $4 FOR
	

		SELECT COUNT(*) "OutTotalRecordCount"
		FROM fda."FDADataQualityMasterRules";
RETURN NEXT $4; */

---END IF;
/*
SELECT fda."Proc_ListMaintainDataQuality"(
	'0',--"InOffset" bigint,
	'10',--"InLimit" bigint,
	'',--"InOrderBy" character varying,
	'',--"InOredrByType"  character varying,
	'',--"InQualityRulesId" character varying,
	'',--"InRuleName"  character varying,
	'',--"InRuleType" character varying,
	'R1',--refcursor,
	'R2');
	FETCH ALL IN "R1";
	
	*/

END;
$BODY$;


