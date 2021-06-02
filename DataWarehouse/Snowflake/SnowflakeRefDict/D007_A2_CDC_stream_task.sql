--ASSIGNMENT 2 - Change Data Capture, Streams, Task, Loading.


--Set context

USE role sysadmin;
USE warehouse test_wh;
USE DATABASE assignment2;
USE SCHEMA public;


--create a base table

CREATE TABLE
  assignment2.public.base_table (
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


-- Create a external AWS s3 stage

CREATE OR REPLACE STAGE
  assignment2.public.base_table_stage
  URL='s3://snowflake-workshop-lab/citibike-trips/trips_2013_2_5_0.csv.gz';


--Create a file format

CREATE OR REPLACE FILE FORMAT
  assignment2.public.base_table_file_format
  TYPE = 'CSV'
  FIELD_OPTIONALLY_ENCLOSED_BY = '\042'
  NULL_IF = ('NULL','null','')
  ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE;



-- Load into base table using copy into

COPY INTO
assignment2.public.base_table
FROM
  @assignment2.public.base_table_stage
  FILE_FORMAT=assignment2.public.base_table_file_format
  ON_ERROR=CONTINUE;



-- Create Stream on base table

create or replace stream base_table_stream on table base_table;



--Creating a summary table

Create table summary_table like base_table



-- Create a task to insert data from stream to summary

create task summary_task
warehouse = TEST_WH
schedule = '1 minute'
when
SYSTEM$STREAM_HAS_DATA('base_table_stream')
as
insert into summary_table(TRIPDURATION,STARTTIME,STOPTIME,START_STATION_ID,START_STATION_NAME,START_STATION_LATITUDE,START_STATION_LONGITUDE,END_STATION_ID,END_STATION_NAME,END_STATION_LATITUDE,END_STATION_LONGITUDE,BIKEID,MEMBERSHIP_TYPE,USERTYPE,BIRTH_YEAR,GENDER)
select (TRIPDURATION,STARTTIME,STOPTIME,START_STATION_ID,START_STATION_NAME,START_STATION_LATITUDE,START_STATION_LONGITUDE,END_STATION_ID,END_STATION_NAME,END_STATION_LATITUDE,END_STATION_LONGITUDE,BIKEID,MEMBERSHIP_TYPE,USERTYPE,BIRTH_YEAR,GENDER) from base_table_stream where METADATA$ACTION = 'INSERT';



-- describing the task

desc task summary_task



-- Give priviliges

use role accountadmin;
grant execute task on account to role sysadmin;



--checking whether scheduled or not

select * from table(information_schema.task_history())



--Resume task

alter task summary_task resume;