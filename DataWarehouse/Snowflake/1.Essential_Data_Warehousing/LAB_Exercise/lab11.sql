
//Loading data in table using JSON local file

USE DATABASE LIBRARY_CARD_CATALOG;


CREATE OR REPLACE TABLE "LIBRARY_CARD_CATALOG"."PUBLIC"."NESTED_INGEST_JSON"
(
  "RAW_NESTED_BOOK" VARIANT
);



PUT file://<file_path>/json_book_author_nested.txt @NESTED_INGEST_JSON/ui1620727589081

COPY INTO "LIBRARY_CARD_CATALOG"."PUBLIC"."NESTED_INGEST_JSON"
FROM @/ui1620727589081
FILE_FORMAT = '"LIBRARY_CARD_CATALOG"."PUBLIC"."JSON_FILE_FORMAT"'
ON_ERROR = 'ABORT_STATEMENT'
PURGE = TRUE;



//Loading a table with local JSON file

CREATE DATABASE SOCIAL_MEDIA_FLOODGATES
COMMENT = 'There\'s so much data from social media - flood warning';

USE DATABASE SOCIAL_MEDIA_FLOODGATES;


CREATE TABLE "SOCIAL_MEDIA_FLOODGATES"."PUBLIC"."TWEET_INGEST"
("RAW_STATUS" VARIANT)
COMMENT = 'Bring in tweets, one row per tweet or status entity';


CREATE FILE FORMAT "SOCIAL_MEDIA_FLOODGATES"."PUBLIC".JSON_FILE_FORMAT
TYPE = 'JSON'
COMPRESSION = 'AUTO'
ENABLE_OCTAL = FALSE
ALLOW_DUPLICATE = FALSE
STRIP_OUTER_ARRAY = TRUE
STRIP_NULL_VALUES = FALSE
IGNORE_UTF8_ERRORS = FALSE;


PUT file://<file_path>/nutrition_tweets.json @TWEET_INGEST/ui1620727799671

COPY INTO "SOCIAL_MEDIA_FLOODGATES"."PUBLIC"."TWEET_INGEST"
FROM @/ui1620727799671
FILE_FORMAT = '"SOCIAL_MEDIA_FLOODGATES"."PUBLIC"."JSON_FILE_FORMAT"'
ON_ERROR = 'ABORT_STATEMENT'
PURGE = TRUE;



//CREATING VIEW

CREATE VIEW "SOCIAL_MEDIA_FLOODGATES"."PUBLIC".HASHTAGS_NORMALIZED COMMENT = 'Hashtag text with Tweet ID and User ID'
AS
SELECT RAW_STATUS:user:id AS USER_ID
,RAW_STATUS:id AS TWEET_ID
,value:text::VARCHAR AS HASHTAG_TEXT
FROM TWEET_INGEST
,LATERAL FLATTEN
(input => RAW_STATUS:entities:hashtags);


SELECT * FROM HASHTAGS_NORMALIZED;
