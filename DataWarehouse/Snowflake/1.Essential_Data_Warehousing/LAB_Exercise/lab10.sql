
//XML

//Loading a table using local file in XML format with header and without setting STRIP_OUTER_ELEMENT as TRUE

USE LIBRARY_CARD_CATALOG;


CREATE TABLE "LIBRARY_CARD_CATALOG"."PUBLIC"."AUTHOR_INGEST_XML"
(
  "RAW_AUTHOR" VARIANT
);


CREATE FILE FORMAT "LIBRARY_CARD_CATALOG"."PUBLIC".XML_FILE_FORMAT
TYPE = 'XML'
COMPRESSION = 'AUTO'
PRESERVE_SPACE = FALSE
STRIP_OUTER_ELEMENT = FALSE
DISABLE_SNOWFLAKE_DATA = FALSE
DISABLE_AUTO_CONVERT = FALSE
IGNORE_UTF8_ERRORS = FALSE;


PUT file://<file_path>/author_with_header.xml @AUTHOR_INGEST_XML/ui1620726036950

COPY INTO "LIBRARY_CARD_CATALOG"."PUBLIC"."AUTHOR_INGEST_XML"
FROM @/ui1620726036950
FILE_FORMAT = '"LIBRARY_CARD_CATALOG"."PUBLIC"."XML_FILE_FORMAT"'
ON_ERROR = 'ABORT_STATEMENT'
PURGE = TRUE;


SELECT * FROM AUTHOR_INGEST_XML

// Only 1 row


//Loading data into table from local XML file with no header

PUT file://<file_path>/author_no_header.xml @AUTHOR_INGEST_XML/ui1620726194378

COPY INTO "LIBRARY_CARD_CATALOG"."PUBLIC"."AUTHOR_INGEST_XML"
FROM @/ui1620726194378
FILE_FORMAT = '"LIBRARY_CARD_CATALOG"."PUBLIC"."XML_FILE_FORMAT"'
ON_ERROR = 'ABORT_STATEMENT'
PURGE = TRUE;


SELECT * FROM AUTHOR_INGEST_XML

//data inserted




//Changing strip outer element to true and loading again

ALTER FILE FORMAT "LIBRARY_CARD_CATALOG"."PUBLIC".XML_FILE_FORMAT
STRIP_OUTER_ELEMENT = TRUE;

PUT file://<file_path>/author_with_header.xml @AUTHOR_INGEST_XML/ui1620726194378

COPY INTO "LIBRARY_CARD_CATALOG"."PUBLIC"."AUTHOR_INGEST_XML"
FROM @/ui1620726194378
FILE_FORMAT = '"LIBRARY_CARD_CATALOG"."PUBLIC"."XML_FILE_FORMAT"'
ON_ERROR = 'ABORT_STATEMENT'
PURGE = TRUE;





//Loading table with local JSON file and setting STRIP_OUTER_ARRAY as TRUE

USE LIBRARY_CARD_CATALOG;

CREATE TABLE "LIBRARY_CARD_CATALOG"."PUBLIC"."AUTHOR_INGEST_JSON"
(
  "RAW_AUTHOR" VARIANT
);

CREATE FILE FORMAT "LIBRARY_CARD_CATALOG"."PUBLIC".JSON_FILE_FORMAT
TYPE = 'JSON'
COMPRESSION = 'AUTO'
ENABLE_OCTAL = FALSE
ALLOW_DUPLICATE = FALSE
STRIP_OUTER_ARRAY = TRUE
STRIP_NULL_VALUES = FALSE
IGNORE_UTF8_ERRORS = FALSE;


PUT file://<file_path>/author_with_header.json @AUTHOR_INGEST_JSON/ui1620727133861

COPY INTO "LIBRARY_CARD_CATALOG"."PUBLIC"."AUTHOR_INGEST_JSON"
FROM @/ui1620727133861
FILE_FORMAT = '"LIBRARY_CARD_CATALOG"."PUBLIC"."JSON_FILE_FORMAT"'
ON_ERROR = 'ABORT_STATEMENT'
PURGE = TRUE;


SELECT * FROM AUTHOR_INGEST_JSON
