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
------------------------------------------------
CREATE OR REPLACE FUNCTION fda."Proc_ListFDASystemObjectFieldDetailsForScoreSyncUp"(
	"InSystemName" character varying,
	"InObjectName" character varying,
	"InIndType" character varying,
	refcursor)
    RETURNS SETOF refcursor 
    LANGUAGE 'plpgsql'
    COST 100
    VOLATILE PARALLEL UNSAFE
    ROWS 1000

AS $BODY$
DECLARE 
"CURRENT_TIME" VARCHAR(10);
"SCORE_SYNC_TIME" VARCHAR(10);
"lvScoreActiveColumnCount" BIGINT;
BEGIN

IF "InSystemName" = '' AND "InObjectName" = '' AND "InIndType" = '' THEN

	SELECT 
		(CASE 
			WHEN LENGTH(CAST(EXTRACT(MINUTE FROM CURRENT_TIMESTAMP) AS TEXT)) = 2 
				THEN CONCAT(EXTRACT(HOUR FROM  CURRENT_TIMESTAMP),':',EXTRACT(MINUTE FROM  CURRENT_TIMESTAMP))
			ELSE CONCAT(EXTRACT(HOUR FROM  CURRENT_TIMESTAMP),':',0,EXTRACT(MINUTE FROM  CURRENT_TIMESTAMP))
		END)
	INTO "CURRENT_TIME";
	
	SELECT "TimeInHH:MM" INTO "SCORE_SYNC_TIME"
	FROM fda."TimeSchedules"
	WHERE "TimeFor" = 'ObjectScore';
	
		IF "SCORE_SYNC_TIME" = "CURRENT_TIME" THEN
		
				OPEN $4 FOR
				
					SELECT DISTINCT
							a."FDASystemsId",
							a."SystemAliasName" "SystemName",
							a."SystemType",
							a."SystemCategoryType"
					FROM fda."FDASystems" a,
						fda."FDASystemObjects" b
					WHERE a."FDASystemsId" = b."FDASystemsId"
						AND COALESCE(b."ObjectType",'') = 'DATA'
						AND COALESCE(UPPER(a."SystemCategoryType"),'') = 'PHYSICAL'
						AND COALESCE(b."ObjectName",'') != ''
						--AND COALESCE(b."ObjectName",'') NOT LIKE 'dbo.v%'
						--AND COALESCE(a."SystemAliasName",'') != 'SAP'
						--AND COALESCE(a."SystemAliasName",'') IN ('decisionsigma','cntrctweb')
						AND COALESCE(b."AutoMetricsInd",'') IS NOT NULL
						AND COALESCE(b."AutoMetricsInd",'') = 'true';
	
				RETURN NEXT $4;
				
		ELSE
				
				OPEN $4 FOR
				
					SELECT DISTINCT
						a."FDASystemsId",
						a."SystemAliasName" "SystemName",
						a."SystemType",
						a."SystemCategoryType"
					FROM fda."FDASystems" a,
					fda."FDASystemObjects" b
					WHERE a."FDASystemsId" = 0;
	
				RETURN NEXT $4;
			
		END IF;

ELSE IF "InSystemName" > '' AND "InObjectName" = '' AND "InIndType" = '' THEN

	OPEN $4 FOR
	
		SELECT DISTINCT
			a."FDASystemsId",
			a."SystemAliasName" "SystemName",
			b."FDASystemObjectsId",
			b."ObjectName",
			b."ObjectType",
			b."SchemaName",
			(SELECT c."FDASystemObjectFieldsId"
			 FROM fda."FDASystemObjectFields" c
			 WHERE c."FieldName" = b."SegmentedBy"
			 	AND b."SegmentedBy" > ''
				AND c."FDASystemObjectsId" = b."FDASystemObjectsId") "SegmentByFieldId",
			b."SegmentedBy" "SegmentByFieldName",
			b."BasicScoreInd",
			b."AdvanceScoreInd"
		FROM fda."FDASystems" a,
			fda."FDASystemObjects" b
		WHERE a."FDASystemsId" = b."FDASystemsId"
			AND COALESCE(a."SystemAliasName",'') = "InSystemName"
			AND COALESCE(b."ObjectType",'') IN ('DATA','TABLE','VIEW')
			AND COALESCE(UPPER(a."SystemCategoryType"),'') = 'PHYSICAL'
			AND COALESCE(b."ObjectName",'') != ''
			--AND COALESCE(b."ObjectName",'') NOT LIKE 'dbo.v%'
			--AND COALESCE(a."SystemAliasName",'') != 'SAP'
			AND COALESCE(b."AutoMetricsInd",'') IS NOT NULL
			AND COALESCE(b."AutoMetricsInd",'') = 'true';
	
	RETURN NEXT $4;

ELSE IF "InSystemName" > '' AND "InObjectName" > '' AND "InIndType" = '' THEN
	
	--SELECT COUNT(c."FDASystemObjectFieldsId")
	--INTO "lvScoreActiveColumnCount"
	--FROM fda."FDASystems" a,
	--	fda."FDASystemObjects" b,
	--	fda."FDASystemObjectFields" c
	--WHERE a."FDASystemsId" = b."FDASystemsId"
	--	AND b."FDASystemObjectsId" = c."FDASystemObjectsId"
	--	AND a."SystemAliasName" = "InSystemName"
	--	AND b."ObjectName" = "InObjectName"
	--	AND COALESCE(c."AutoMetricsInd",'') IN ('true');
	--	
	--IF COALESCE("lvScoreActiveColumnCount",0) > 0 THEN
	
		OPEN $4 FOR
	
			SELECT DISTINCT
				a."FDASystemsId",
				a."SystemAliasName" "SystemName",
				b."FDASystemObjectsId",
				b."ObjectName",
				c."FDASystemObjectFieldsId",
				c."FieldName",
				--c."FieldDataType",
				(CASE WHEN c."FieldDataType" IN ('VARCHAR','NVARCHAR','CHAR','BOOLEAN','TEXT','STRING','CHAR','CHARACTER','NCHAR','TEXT','NVARCHAR','NVARCHAR2','CHAR VARYING','NCHAR VARYING') 
						AND COALESCE(c."UserOverwriteDatatype",'STRING') = 'STRING'	THEN  'STRING'
					WHEN c."FieldDataType" IN ('NUMBER','INTEGER','DECIMAL','INT','FLOAT','NUMERIC','BIGINT','SMALLINT','TINYINT','BYTEINT','FLOAT','FLOAT4','FLOAT8','DOUBLE','DOUBLE PRECISION','REAL') 
						AND COALESCE(c."UserOverwriteDatatype",'NUMBER') = 'NUMBER'	THEN  'NUMBER'
					WHEN c."FieldDataType" IN ('DATE','DATETIME','TIME','TIMESTAMP','TIMESTAMP_LTZ','TIMESTAMP_NTZ','TIMESTAMP_TZ','DATETIME2') 
						AND COALESCE(c."UserOverwriteDatatype",'DATE') = 'DATE'  THEN  'DATE'
					ELSE c."UserOverwriteDatatype" 
				END) "FieldDataType",
				COALESCE(NULLIF(c."SegmentedBy",'null'),'') AS  "FieldSegmentName",
				COALESCE(NULLIF(b."SegmentedBy",'null'),'') AS  "ObjectSegmentName",
				COALESCE(
							(SELECT c1."FDASystemObjectFieldsId" FROM fda."FDASystemObjectFields" c1
							 WHERE c1."FieldName" = c."SegmentedBy" AND c."SegmentedBy" > ''
							 AND c1."FDASystemObjectsId" = b."FDASystemObjectsId"
							)::varchar,''
						) "FieldSegmentId",
				COALESCE((SELECT c."FDASystemObjectFieldsId"
							FROM fda."FDASystemObjectFields" c
							WHERE c."FieldName" = b."SegmentedBy"
								AND b."SegmentedBy" > ''
								AND c."FDASystemObjectsId" = b."FDASystemObjectsId"
						)::varchar,''
						) "ObjectSegmentId"
			FROM fda."FDASystems" a
			INNER JOIN fda."FDASystemObjects" b
				ON a."FDASystemsId" = b."FDASystemsId"
			LEFT JOIN fda."FDASystemObjectFields" c
				ON b."FDASystemObjectsId" = c."FDASystemObjectsId"
				WHERE a."SystemAliasName" = "InSystemName"
				AND b."ObjectName" = "InObjectName"
				AND COALESCE(c."AutoMetricsInd",'') IN ('true')
				AND COALESCE(c."ObsoleteInMetaDataInd",'NEW') != 'DELETED';
		
		RETURN NEXT $4;
	
	--ELSE
	--
	--	OPEN $4 FOR
	--
	--		SELECT DISTINCT
	--			a."FDASystemsId",
	--			a."SystemAliasName" "SystemName",
	--			b."FDASystemObjectsId",
	--			b."ObjectName",
	--			'' "FDASystemObjectFieldsId",
	--			'' "FieldName",
	--			'' "FieldDataType",
	--			'' "FieldSegmentName",
	--			'' "ObjectSegmentName",
	--			'' "FieldSegmentId",
	--			'' "ObjectSegmentId"
	--		FROM fda."FDASystems" a,
	--			fda."FDASystemObjects" b
	--		WHERE a."FDASystemsId" = b."FDASystemsId"
	--			AND a."SystemAliasName" = "InSystemName"
	--			AND b."ObjectName" = "InObjectName";
	--		
	--	RETURN NEXT $4;
	--
	--END IF;

ELSE IF "InSystemName" > '' AND "InObjectName" > '' AND "InIndType" > '' THEN

	OPEN $4 FOR
	
			/*SELECT DISTINCT
			a."FDASystemsId",
			a."SystemAliasName" "SystemName",
			a."SystemType",
			b."FDASystemObjectsId",
			b."ObjectName",
			(SELECT c."FDASystemObjectFieldsId"
			 FROM fda."FDASystemObjectFields" c
			 WHERE c."FieldName" = b."SegmentedBy"
			 	AND b."SegmentedBy" > ''
				AND c."FDASystemObjectsId" = b."FDASystemObjectsId") "SegmentByFieldId",
			COALESCE(b."SegmentedBy",'') AS  "SegmentByObjectName",
			c."FDASystemObjectFieldsId",
			c."FieldName",
			COALESCE(NULLIF(c."SegmentedBy",'null'),'') AS "SegmentByFieldName",
			b."BasicScoreInd",
			b."AdvanceScoreInd"
		FROM fda."FDASystems" a,
			fda."FDASystemObjects" b,
			fda."FDASystemObjectFields" c
		WHERE a."FDASystemsId" = b."FDASystemsId"
			AND COALESCE(a."SystemAliasName",'') = "InSystemName"
			AND b."FDASystemObjectsId" = c."FDASystemObjectsId"
			AND COALESCE(b."ObjectType",'') IN ('DATA','TABLE','VIEW')
			AND COALESCE(UPPER(a."SystemCategoryType"),'') = 'PHYSICAL'
			AND COALESCE(b."ObjectName",'') != ''
			--AND COALESCE(b."ObjectName",'') NOT LIKE 'dbo.v%'
			AND COALESCE(b."ObjectName",'') = "InObjectName"
			--AND COALESCE(a."SystemAliasName",'') != 'SAP'
			AND COALESCE(b."AutoMetricsInd",'') IS NOT NULL
			AND  COALESCE(c."AutoMetricsInd",'') IN ('true'); */
			
		SELECT DISTINCT
				a."FDASystemsId",
				a."SystemAliasName" "SystemName",
				a."SystemType",
				b."FDASystemObjectsId",
				b."ObjectName",
				(SELECT c."FDASystemObjectFieldsId"
				FROM fda."FDASystemObjectFields" c
				WHERE c."FieldName" = b."SegmentedBy"
					AND b."SegmentedBy" > ''
					AND c."FDASystemObjectsId" = b."FDASystemObjectsId") "SegmentByFieldId",
				COALESCE(b."SegmentedBy",'') AS  "SegmentByObjectName",
				c."FDASystemObjectFieldsId",
				c."FieldName",
				(CASE WHEN c."FieldDataType" IN ('VARCHAR','NVARCHAR','CHAR','BOOLEAN','TEXT','STRING','CHAR','CHARACTER','NCHAR','TEXT','NVARCHAR','NVARCHAR2','CHAR VARYING','NCHAR VARYING') 
						AND COALESCE(c."UserOverwriteDatatype",'STRING') = 'STRING'	THEN  'STRING'
					WHEN c."FieldDataType" IN ('NUMBER','INTEGER','DECIMAL','INT','FLOAT','NUMERIC','BIGINT','SMALLINT','TINYINT','BYTEINT','FLOAT','FLOAT4','FLOAT8','DOUBLE','DOUBLE PRECISION','REAL') 
						AND COALESCE(c."UserOverwriteDatatype",'NUMBER') = 'NUMBER'	THEN  'NUMBER'
					WHEN c."FieldDataType" IN ('DATE','DATETIME','TIME','TIMESTAMP','TIMESTAMP_LTZ','TIMESTAMP_NTZ','TIMESTAMP_TZ','DATETIME2') 
						AND COALESCE(c."UserOverwriteDatatype",'DATE') = 'DATE'  THEN  'DATE'
					ELSE c."UserOverwriteDatatype" 
				END) "FieldDataType",		
				(SELECT d."FDASystemObjectFieldsId"
				FROM fda."FDASystemObjectFields" d
				WHERE d."FieldName" = COALESCE(NULLIF(c."SegmentedBy",'null'),'')
					AND b."SegmentedBy" > ''
					AND d."FDASystemObjectsId" = b."FDASystemObjectsId") "FieldSegmentByFieldId",
				COALESCE(NULLIF(c."SegmentedBy",'null'),'') AS "SegmentByFieldName", 
				COALESCE(b."BasicScoreInd",'') AS "BasicScoreInd",
				COALESCE(b."AdvanceScoreInd",'') AS "AdvanceScoreInd"
		FROM fda."FDASystems" a
		INNER JOIN fda."FDASystemObjects" b
			ON a."FDASystemsId" = b."FDASystemsId"
			AND COALESCE(a."SystemAliasName",'') =  "InSystemName"
			AND COALESCE(b."ObjectType",'') IN ('DATA','TABLE','VIEW')
			AND COALESCE(UPPER(a."SystemCategoryType"),'') = 'PHYSICAL'
			AND COALESCE(b."ObjectName",'') != ''
			AND COALESCE(b."ObjectName",'') = "InObjectName"
			AND COALESCE(b."AutoMetricsInd",'') IS NOT NULL
		LEFT JOIN  fda."FDASystemObjectFields" c
			ON b."FDASystemObjectsId" = c."FDASystemObjectsId"
			AND COALESCE(c."AutoMetricsInd",'') IN ('true')
		WHERE COALESCE(c."ObsoleteInMetaDataInd",'NEW') != 'DELETED'; 
	
		/*SELECT DISTINCT
			a."FDASystemsId",
			a."SystemAliasName" "SystemName",
			a."SystemType",
			b."FDASystemObjectsId",
			b."ObjectName",
			(SELECT c."FDASystemObjectFieldsId"
			 FROM fda."FDASystemObjectFields" c
			 WHERE c."FieldName" = b."SegmentedBy"
			 	AND b."SegmentedBy" > ''
				AND c."FDASystemObjectsId" = b."FDASystemObjectsId") "SegmentByFieldId",
			COALESCE(b."SegmentedBy",'') AS  "SegmentByObjectName",
			c."FDASystemObjectFieldsId",
			c."FieldName",
			COALESCE(NULLIF(c."SegmentedBy",'null'),'') AS "SegmentByFieldName",
			b."BasicScoreInd",
			b."AdvanceScoreInd"
		FROM fda."FDASystems" a,
			fda."FDASystemObjects" b,
			fda."FDASystemObjectFields" c
		WHERE a."FDASystemsId" = b."FDASystemsId"
			AND COALESCE(a."SystemAliasName",'') = "InSystemName"
			AND b."FDASystemObjectsId" = c."FDASystemObjectsId"
			AND COALESCE(b."ObjectType",'') IN ('DATA','TABLE','VIEW')
			AND COALESCE(UPPER(a."SystemCategoryType"),'') = 'PHYSICAL'
			AND COALESCE(b."ObjectName",'') != ''
			--AND COALESCE(b."ObjectName",'') NOT LIKE 'dbo.v%'
			AND COALESCE(b."ObjectName",'') = "InObjectName"
			--AND COALESCE(a."SystemAliasName",'') != 'SAP'
			AND COALESCE(b."AutoMetricsInd",'') IS NOT NULL
			AND  COALESCE(c."AutoMetricsInd",'') IN ('true');
			*/
	
	RETURN NEXT $4;

END IF;
END IF;
END IF;
END IF;
/*
SELECT "fda"."Proc_ListFDASystemObjectFieldDetailsForScoreSyncUp"(
      'dsigma',
      'dbo.Target6',
      '',
      'ITEM_CURSOR'
      );
FETCH ALL IN "ITEM_CURSOR";

*/

END;
$BODY$;
--------------------------------------------------
