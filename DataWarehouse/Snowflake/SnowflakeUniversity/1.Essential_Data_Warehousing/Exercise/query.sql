
USE DATABASE ASSINGMENT2;



CREATE TABLE assing(col1 variant);


CREATE FILE FORMAT my_json_file_format
TYPE = 'JSON'
STRIP_OUTER_ARRAY = TRUE;


//Load the table using WebUI


SELECT
COL1:id::integer as ID, 
COL1:name::string as NAME,
b.VALUE:id::integer as TOPPING_ID,
b.VALUE:type::string as TOPPING_TYPE,
a.VALUE:id::integer as BATTER_ID,
a.VALUE:type::string as BATTER_TYPE
FROM ASSIGN,
LATERAL FLATTEN(INPUT => COL1:batters:batter) as a,
LATERAL FLATTEN(INPUT => COL1:topping) as b;
