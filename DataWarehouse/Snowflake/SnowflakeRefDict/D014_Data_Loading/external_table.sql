// EXTERNAL TABLE

create or replace stage external_stage_for_external_table
URL = 'azure://hashathonstorageaccount.blob.core.windows.net/hashathoncontainer/ext/'
credentials=(azure_sas_token='?sv=2020-08-04&ss=bfqt&srt=sco&sp=rwdlacupitfx&se=2022-06-02T15:47:11Z&st=2022-06-02T07:47:11Z&spr=https&sig=cYIOLe4ZLeLbYrt70WjaMsyA2GvApdUkmMN8PXIKb9E%3D');

list @external_stage_for_external_table;


select METADATA$FILENAME, $1, $2 from @external_stage_for_external_table;

create or replace external table my_ext_table
(col1 varchar as (value:c1::varchar),
col2 varchar as (value:c2::varchar))
with location = @external_stage_for_external_table
auto_refresh = false
file_format = my_file_format;

select * from my_ext_table;

alter external table my_ext_table refresh;
