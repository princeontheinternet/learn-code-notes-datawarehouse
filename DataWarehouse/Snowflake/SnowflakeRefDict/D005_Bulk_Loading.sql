BULK LOADING IN SNOWFLAKE USING AWS S3

// Creating Table
CREATE OR REPLACE TABLE
  {user}_CITIBIKE.PUBLIC.TRIPS (
    TRIPDURATION            INTEGER,
    STARTTIME               TIMESTAMP,
    STOPTIME                TIMESTAMP,
    START_STATION_ID        INTEGER,
    START_STATION_NAME      STRING,
    START_STATION_LATITUDE  FLOAT,
    START_STATION_LONGITUDE FLOAT,
    END_STATION_ID          INTEGER,
    END_STATION_NAME        STRING,
    END_STATION_LATITUDE    FLOAT,
    END_STATION_LONGITUDE   FLOAT,
    BIKEID                  INTEGER,
    MEMBERSHIP_TYPE         STRING,
    USERTYPE                STRING,
    BIRTH_YEAR              INTEGER,
    GENDER                  INTEGER
);



// Creating an EXTERNAL AWS S3 stage
CREATE OR REPLACE STAGE
  {user}_CITIBIKE.PUBLIC.CITIBIKE_TRIPS
  URL='s3://snowflake-workshop-lab/citibike-trips'
  --credentials=(aws_key_id='1a2b3c' aws_secret_key='4x5y6z');


// list the files in stages
LIST t1.$1, t2.$2 from @CITIBIKE_TRIPS as t;


// Creating File Format
CREATE OR REPLACE FILE FORMAT
  {user}_CITIBIKE.PUBLIC.CSV
  TYPE = 'CSV'
  FIELD_OPTIONALLY_ENCLOSED_BY = '\042'
  NULL_IF = ('NULL','null','')
  ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE;


//Creating a WH
CREATE OR REPLACE WAREHOUSE
  {user}_COMPUTE_WH
  WAREHOUSE_SIZE=XSMALL
  AUTO_SUSPEND=60
  INITIALLY_SUSPENDED=TRUE;


// Copy into table from external stage
COPY INTO
  {user}_CITIBIKE.PUBLIC.TRIPS
FROM
  @{user}_CITIBIKE.PUBLIC.CITIBIKE_TRIPS
  FILE_FORMAT={user}_CITIBIKE.PUBLIC.CSV
  ON_ERROR=CONTINUE;






// Error checking from doc

create or replace table save_copy_errors as select * from table(validate(mycsvtable, job_id=>'<query_id>'));

select * from save_copy_errors;













