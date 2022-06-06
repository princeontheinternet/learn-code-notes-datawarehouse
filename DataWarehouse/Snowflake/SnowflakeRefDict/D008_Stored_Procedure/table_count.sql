--Stored Procedure

//Table Count

create or replace procedure test_proc(table_name string)
returns string
language javascript
as
$$
var sql_command = "select count(*) from " + TABLE_NAME;       -- UPPER CASE FOR PARAMETER as JAVASCRIPT IS CASE SENSITIVE
var stmt = snowflake.createStatement({sqlText: sql_command});
var result = stmt.execute();
result.next();
row_count = result.getColumnValue(1);
return row_count
$$
;


call test_proc('trips');
