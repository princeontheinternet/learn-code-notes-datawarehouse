
//Setting a CONTEXT
USE ROLE SYSADMIN;
USE WAREHOUSE COMPUTE_WH;
USE DATABASE DEMO_DB;
USE SCHEMA PUBLIC;

//Displaying the context
SELECT
CURRENT_ROLE(),
CURRENT_WAREHOUSE(),
CURRENT_DATABASE(),
CURRENT_SCHEMA();


//Display current account & region
SELECT
CURRENT_ACCOUNT(),
CURRENT_REGION();

//Displaying all
SHOW ROLES;
SHOW WAREHOUSES;
SHOW DATABASES;
SHOW SCHEMAS;
SHOW FUNCTIONS;
SHOW PROCEDURES;
SHOW USERS;
SHOW TABLES;
SHOW FILE FORMATS;
SHOW STAGES;