// EXTERNAL STAGE USING AZURE STORAGE ACCOUNT

create database my_db;
create schema my_schema;

--CREATE EMPTY TABLE
create or replace table sample_table (col1 varchar, col2 varchar,col3 varchar,col4 varchar,col5 varchar,col6 varchar);

select * from sample_table;

--CREATE FILE FORMAT 
create or replace file format my_file_format
type = CSV
skip_header=1;

--CREATE EXTERNAL STAGE WITH AZURE SAS TOKEN
create or replace stage my_stage
URL = 'azure://hashathonstorageaccount.blob.core.windows.net/hashathoncontainer/sample.csv'
credentials=(azure_sas_token='?sv=2020-08-04&ss=bfqt&srt=co&sp=rwdlacupitfx&se=2022-06-02T15:43:26Z&st=2022-06-02T07:43:26Z&spr=https&sig=zPBtrjyCW4b1%2FqOL77vFsWWwo782XiApbQbJTMfPtIc%3D')
file_format = my_file_format;


select $1
$2,
$3
$4,
$5,
$6
from @my_stage;

list @my_stage;

copy into sample_table
from @my_stage;

select * from sample_table;
