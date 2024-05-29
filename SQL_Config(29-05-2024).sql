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
		COALESCE(NULLIF(a."LeftFieldValue",'null'),'') AS "LeftFieldValue", 
		COALESCE(NULLIF(a."RightFieldValue",'null'),'')  AS "RightFieldValue",
		(CASE WHEN a."RuleType" = 'Range of Values'  THEN COALESCE(NULLIF(a."UpperThreshold",'null'),'') END) AS "HighestPossibleValue",
		(CASE WHEN a."RuleType" = 'Range of Values'  THEN COALESCE(NULLIF(a."LowerThreshold",'null'),'') END) AS "LowestPossibleValue",
		--REPLACE(COALESCE(NULLIF(a."RightFieldValue",'null'),''),',','~^~') "RightFieldValue",
        UPPER(c."SystemType") "SystemType",
        (CASE WHEN b."FieldDataType" IN ('VARCHAR','NVARCHAR','CHAR','BOOLEAN','TEXT','STRING','CHAR','CHARACTER','NCHAR','TEXT','NVARCHAR','NVARCHAR2','CHAR VARYING','NCHAR VARYING') AND COALESCE(b."UserOverwriteDatatype",'STRING')= 'STRING'THEN  'STRING'
              WHEN b."FieldDataType" IN ('NUMBER','INTEGER','DECIMAL','INT','FLOAT','NUMERIC','BIGINT','SMALLINT','TINYINT','BYTEINT','FLOAT','FLOAT4','FLOAT8','DOUBLE','DOUBLE PRECISION','REAL') AND COALESCE(b."UserOverwriteDatatype",'NUMBER')= 'NUMBER'THEN  'NUMBER'
              WHEN b."FieldDataType" IN ('DATE','DATETIME','TIME','TIMESTAMP','TIMESTAMP_LTZ','TIMESTAMP_NTZ','TIMESTAMP_TZ','DATETIME2') 
					AND COALESCE(b."UserOverwriteDatatype",'DATE')= 'DATE'  THEN  'DATE'
			ELSE b."UserOverwriteDatatype" 
		END) "FieldDataType",
		COALESCE(c."EncryptionInd",'No') "EncryptionInd"
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
--------------------------------------------
ALTER TABLE fda."FDASystems" ADD COLUMN "EncryptionInd" Character Varying(10);

-------------------------------------------
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
	"InEncryptionInd" character varying,
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
				"PassPhrase",
				"EncryptionInd"
				
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
				"InPassPhrase",
				"InEncryptionInd"
			); 
			
			SELECT "FDASystemsId"
			INTO "OutFDASystemsId"
			FROM fda."FDASystems"
			WHERE "SystemAliasName" = "InSystemAliasName"
				AND "OrganizationId" = "lvOrgId"
				AND "CreatedBy" = "InUserName";
				
			"OutStatusmsg" := 'SUCCESS';	
			
			OPEN $30 FOR
				SELECT "OutFDASystemsId","OutStatusmsg";

			RETURN NEXT $30;
		
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
				"PassPhrase" = "InPassPhrase",
				"EncryptionInd" = "InEncryptionInd"
			WHERE "FDASystemsId" =  CAST("InFDASystemsId" AS BIGINT);
			
			"OutStatusmsg" := 'SUCCESS';
			
			OPEN $30 FOR
				SELECT "InFDASystemsId" AS "OutFDASystemsId","OutStatusmsg";
			RETURN NEXT $30;
	
		END IF;	
		END IF;
------------------------------------
	
/*OPEN $9 FOR
SELECT "OutFDASystemsId";
RETURN NEXT $9;*/
	
END;
$BODY$;
-------------------------------------------------------------
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
			"OutEncryptionInd"      VARCHAR ;
						

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
			COALESCE("PassPhrase",''),
			COALESCE("EncryptionInd",'')
			
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
			"OutPassPhrase",
			"OutEncryptionInd"
			
			
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
				"OutPassPhrase",
				"OutEncryptionInd";
	RETURN NEXT $2;
END;
$BODY$;
--------------------------------------------------------------------------
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
		"OutEncryptionInd"      VARCHAR ;

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
	COALESCE("PassPhrase",''),
	COALESCE("EncryptionInd",'')
	
	
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
	"OutPassPhrase",
	"OutEncryptionInd"
	
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
			"OutPassPhrase",
			"OutEncryptionInd";

RETURN NEXT $2;

/*
SELECT fda."Proc_GetSystemInfo"(
	'dsigma',--"InSystemName" character varying,
	'refcursor');
	FETCH ALL IN "refcursor";
*/

END;
$BODY$;




