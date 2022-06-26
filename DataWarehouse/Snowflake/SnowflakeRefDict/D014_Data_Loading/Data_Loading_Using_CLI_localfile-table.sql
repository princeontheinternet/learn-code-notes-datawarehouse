--DATA LOADING USING SNOWSQL FROM A LOCAL FILE TO TABLE

#snowsql -a <account_name> -u <user_name>


// Creating Database
create or replace database sf_tuts;


use database sf_tuts;


// Creating a table
create or replace table emp_basic (
  first_name string ,
  last_name string ,
  email string ,
  streetaddress string ,
  city string ,
  start_date date
  );


// Creating a Warehouse
create or replace warehouse sf_tuts_wh with
  warehouse_size='X-SMALL'
  auto_suspend = 180
  auto_resume = true
  initially_suspended=true;


use warehouse sf_tuts_wh;


//Staging Files in table stage as % is used

-- ******************* PUT/GET Commands do not run from the UI and only run through CLI. **********************************************

put file:///tmp/employees0*.csv @sf_tuts.public.%emp_basic;



//Listing stage files
list @sf_tuts.public.%emp_basic;


//copy from stage to table
copy into emp_basic
  from @%emp_basic
  file_format = (type = csv field_optionally_enclosed_by='"')
  pattern = '.*employees0[1-5].csv.gz'
  on_error = 'skip_file';



select * from emp_basic;








