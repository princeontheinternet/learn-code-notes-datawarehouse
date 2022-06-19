--CREATE EXTERNAL STAGE WITH AWS
create or replace stage my_stage
URL = 's3://bucker_name/'
credentials=(aws_key_id='' aws_secret_key = '')
file_format = my_file_format;