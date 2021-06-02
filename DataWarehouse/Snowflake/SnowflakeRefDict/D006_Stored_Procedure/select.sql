
-- USING BIND

create or replace procedure tripduration(tripduration float)
returns string
language javascript
as
$$

var sql_command = "select * from test_trip where tripduration >= ? "; -- you can also use this :1, :2, :3 in case of mltiple var
var rs = snowflake.createStatement({sqlText: sql_command, binds: [TRIPDURATION ]}).execute();
var rt

while(rs.next())
{
var col1 = rs.getColumnValue(1)
var col2 = rs.getColumnValue(2)
var col3 = rs.getColumnValue(3)
var col4 = rs.getColumnValue(4)
}


rt = col1 + col2 + col3 + col4

return rt

$$
;


call tripduration(1000000);


