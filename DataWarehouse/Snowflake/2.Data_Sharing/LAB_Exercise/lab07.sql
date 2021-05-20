
//LAB 7 - EXERCISE 1 -----------------------------------;

// ***** PREP & CHECK ******* //

-- **** 1. ACCOUNT DETAILS ******

//Final Account Details --------------;

//Trial Account Details

--Trial_Account - op08192
--Trial_Username - Noob
--Trial_Password - *****

//Reader Admin Account Details

--Reader_Account - OZ53000
--Reader_A/C_Admin_UserName - OSIRIS
--Reader_A/C_Admin_Password - ****


//Reader Public Role User Account Details

--Reader_Account - OZ53000
--Reader_A/C_Public_Role_UserName - LOTTIE
--Reader_A/C_Public_Role_Password - abc123
--Reader_A/C_Public_Role_Password_forced_changed - ****






-- **** 2. OBJECTS ******

//TRIAL ACCOUNT
--Database - INTL
--Tables - COUNTRY_CODE_TO_CURRENCY_CODE, CURRENCIES, INT_STDS_ORG_3661
--Views - NATIONS_SAMPLE_PLUS_ISO, SIMPLE_CURRENCY


-- **** 3. SHARES ******

//TRIAL ACCOUNT
--Outbound Share - INTL_SHARE (3 tables & 1 view in it)












//LAB 7 - EXERCISE 2 -----------------------------------;


--DESIGNING



//LAB 7 - EXERCISE 3 -----------------------------------;


--USE TRIAL ACCOUNT

--Set Worksheet Context
USE DATABASE INTL_DB;
USE WAREHOUSE INTL_WH;
USE SCHEMA PUBLIC;


--Create a table to hold the security mapping
CREATE OR REPLACE TABLE CUSTOMER_COUNTRY_SECURITY_MAPPING
(
 CTY_CODE VARCHAR(3)
,CUSTOMER_ACCOUNT VARCHAR(10)
);


--Load the security mapping table with some rows for your Trial
--and some rows for your Reader Account
INSERT INTO CUSTOMER_COUNTRY_SECURITY_MAPPING
Values
('CAN','OZ53000'), --change FU12106 to YOUR Reader Account
('USA','OZ53000'),
('DZA','OP08192'), --change AS78317 to YOUR Trial Account
('BEL','OP08192');


SELECT * FROM CUSTOMER_COUNTRY_SECURITY_MAPPING;


--Remind yourself what the Simple Currency view data looks like
SELECT cty_code, cur_code
FROM "INTL_DB"."PUBLIC"."SIMPLE_CURRENCY";



--The view with a WHERE clause that restricts data to
--only the rows Lottie and ACME want to see from OSIRIS
SELECT cty_code, cur_code
FROM "INTL_DB"."PUBLIC"."SIMPLE_CURRENCY"
WHERE cty_code in ('CAN','USA');


-- Join the Simple Currency View with your new mapping table
-- the join restricts the data to just those that appear in
-- the mapping table
SELECT sc.cty_code, cur_code, customer_account
FROM "INTL_DB"."PUBLIC"."SIMPLE_CURRENCY" sc
JOIN "INTL_DB"."PUBLIC"."CUSTOMER_COUNTRY_SECURITY_MAPPING" sm
ON sc.cty_code = sm.cty_code;


--A statement that uses both a join and a where clause
--be sure to change FU12106 so that it uses YOUR reader account
SELECT sc.cty_code, cur_code, customer_account
FROM "INTL_DB"."PUBLIC"."SIMPLE_CURRENCY" sc
JOIN "INTL_DB"."PUBLIC"."CUSTOMER_COUNTRY_SECURITY_MAPPING" sm
ON sc.cty_code = sm.cty_code
WHERE customer_account='OZ53000';





//LAB 7 - EXERCISE 4 --------------------------------------------------------------


--USE TRIAL ACCOUNT

-- Create a new schema for the new standard listing
CREATE SCHEMA INTL_DB.STD;


-- Use an ALTER statement to move the ISO table from the
-- Public schema to our new STD schema
ALTER TABLE "INTL_DB"."PUBLIC"."INT_STDS_ORG_3661"
RENAME TO "INTL_DB"."STD"."INT_STDS_ORG_3661";


--Create another new schema for the new personalized listing
CREATE SCHEMA INTL_DB.PRZLD;


USE SCHEMA INTL_DB.PRZLD;


-- Create the secure view that you'll use
-- when you create an outbound share
-- for WDE's Personalized Listing
CREATE SECURE VIEW PRZLD.CUSTOMER_CURRENCY
AS
SELECT sc.cty_code, cur_code, customer_account
FROM "INTL_DB"."PUBLIC"."SIMPLE_CURRENCY" sc
JOIN "INTL_DB"."PUBLIC"."CUSTOMER_COUNTRY_SECURITY_MAPPING" sm
ON sc.cty_code = sm.cty_code
WHERE customer_account=CURRENT_ACCOUNT();






//LAB 7 - EXERCISE 5 --------------------------------------------------------------


--USE TRIAL ACCOUNT


--Create an Outbound Share
CREATE SHARE "WDE_STD" COMMENT='Contains ISO code.';
GRANT USAGE ON DATABASE "INTL_DB" TO SHARE "WDE_STD";
GRANT USAGE ON SCHEMA "INTL_DB"."STD" TO SHARE "WDE_STD";
GRANT SELECT ON VIEW "INTL_DB"."STD"."INT_STDS_ORG_3661" TO SHARE "WDE_STD";

DESC SHARE WDE_STD;


--Add consumers
ALTER SHARE "WDE_STD" ADD ACCOUNTS = OZ53000;


--Create another Outbound Share
CREATE SHARE "WDE_PRZLD" COMMENT='Contains curr_code, country_code & account_name.';
GRANT USAGE ON DATABASE "INTL_DB" TO SHARE "WDE_PRZLD";
GRANT USAGE ON SCHEMA "INTL_DB"."PRZLD" TO SHARE "WDE_PRZLD";
GRANT SELECT ON VIEW "INTL_DB"."PRZLD"."CUSTOMER_CURRENCY" TO SHARE "WDE_PRZLD";

DESC SHARE WDE_PRZLD;


--Add consumers
ALTER SHARE "WDE_PRZLD" ADD ACCOUNTS = OZ53000;








//LAB 7 - EXERCISE 6 --------------------------------------------------------------

--USE Reader Admin ACCOUNT

--Create Inbound Share for WDE_STD
CREATE DATABASE "WDE_ISO" FROM SHARE OP08192."WDE_STD";
GRANT IMPORTED PRIVILEGES ON DATABASE "WDE_ISO" TO ROLE "PUBLIC";


--Create Inbound Share for WDE_PRZLD
CREATE DATABASE "WDE_CURRENCY" FROM SHARE OP08192."WDE_PRZLD";
GRANT IMPORTED PRIVILEGES ON DATABASE "WDE_CURRENCY" TO ROLE "PUBLIC";


--Create warehouse
CREATE WAREHOUSE MY_WH
WITH WAREHOUSE_SIZE = 'XSMALL'
WAREHOUSE_TYPE = 'STANDARD'
AUTO_SUSPEND = 300
AUTO_RESUME = TRUE;


select * from customer_currency


