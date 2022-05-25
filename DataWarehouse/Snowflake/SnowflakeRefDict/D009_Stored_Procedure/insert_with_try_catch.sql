-- With try and catch block

create or replace procedure test_proc2(col_data FLOAT)
returns string
language javascript
as
$$
var sql_command = "INSERT INTO tetst_table1 VALUES (" + COL_DATA + ")";
try
    {
    snowflake.execute ({sqlText: sql_command});
    return "Succeeded.";
    }
catch (err)
    {
    return "Failed: " + err;
    }
$$
;

