
//Final lab Project

// ******** 1. GET DATA from Standard listing Data Marketplace ********

// ******** 2. Send two Request for Personalized listing ********

// ******** 3. Create a Provider Profile ********

// ******** 4. Create Standard Listing ********

// ******** 5. Create Personalized Listing ********

// ******** 6. Deny a Request sent for your Personalized Listing ********


---------------------------------------------------------------------------------------------------------

// ******** 1. GET DATA from Standard listing Data Marketplace ********

--Go to Data Marketplace and click on any Standard Listing & click on GET DATA using ACCOUNTADMIN.
--This data was created as a Outbound Share by a Provider & you are acting as a Consumer by getting this data
    -- in your database which is stored as Inbound Share

-------------------------------------------------------------------------------------------------------------

// ******** 2. Send two Request for Personalized listing ********

--Click any Personalized listing on Data Marketplace & click on Request data.
--Fill out the form.

-------------------------------------------------------------------------------------------------------------


// ******** 3. Create a Provider Profile ********

--Go to Manage option in Data Marketplace and set up a profile as Provider.
--Fill out the form.

----------------------------------------------------------------------------------------------------------------

// ******** 4. Create Standard Listing ********

--Create Database & schema
CREATE DATABASE SMEW_PROJECT;
CREATE SCHEMA OUTGOING;
DROP SCHEMA PUBLIC;

--Setting the context
USE DATABASE SMEW_PROJECT;
USE SCHEMA OUTGOING;
USE WAREHOUSE INTL_WH;

--Creating a table
CREATE TABLE festivals(Date varchar(100), Day varchar(100), Name varchar(100) );


--Inserting data into table
INSERT INTO FESTIVALS VALUES ('13 Jan', 'Wednesday', 'Lohri');
INSERT INTO FESTIVALS VALUES ('14 Jan', 'Thursday', 'Pongal');
INSERT INTO FESTIVALS VALUES ('14 Jan', 'Thursday', 'Makar Sankranti');
INSERT INTO FESTIVALS VALUES ('20 Jan', 'Wednesday', 'Guru Govind Singh Jayanti');
INSERT INTO FESTIVALS VALUES ('26 Jan', 'Tuesday', 'Republic Day');
INSERT INTO FESTIVALS VALUES ('16 Feb', 'Tuesday', 'Vasant Panchami');
INSERT INTO FESTIVALS VALUES ('19 Feb', 'Friday', 'Shivaji Jayanti');
INSERT INTO FESTIVALS VALUES ('28 Mar', 'Sunday', 'Holika Dahana');
INSERT INTO FESTIVALS VALUES ('29 Mar', 'Monday', 'Holi');
INSERT INTO FESTIVALS VALUES ('2 Apr', 'Friday', 'Good Friday');
INSERT INTO FESTIVALS VALUES ('4 Apr', 'Sunday', 'Easter Day');
INSERT INTO FESTIVALS VALUES ('13 Apr', 'Tuesday', 'Ugadi');
INSERT INTO FESTIVALS VALUES ('13 Apr', 'Tuesday', 'Gudi Padwa');
INSERT INTO FESTIVALS VALUES ('14 Apr', 'Wednesday', 'Vaisakhi');
INSERT INTO FESTIVALS VALUES ('21 Apr', 'Wednesday', 'Rama Navami');
INSERT INTO FESTIVALS VALUES ('14 May', 'Friday', 'Ramzan Id/Eid-ul-Fitar');
INSERT INTO FESTIVALS VALUES ('14 May', 'Friday', 'Ramzan Id/Eid-ul-Fitar');
INSERT INTO FESTIVALS VALUES ('26 May', 'Wednesday', 'Buddha Purnima/Vesak');
INSERT INTO FESTIVALS VALUES ('12 Jul', 'Monday', 'Rath Yatra');
INSERT INTO FESTIVALS VALUES ('24 Jul', 'Saturday', 'Guru Purnima');
INSERT INTO FESTIVALS VALUES ('15 Aug', 'Sunday', 'Independence Day');
INSERT INTO FESTIVALS VALUES ('21 Aug', 'Saturday', 'Onam');
INSERT INTO FESTIVALS VALUES ('22 Aug', 'Sunday', 'Raksha Bandhan (Rakhi)');
INSERT INTO FESTIVALS VALUES ('30 Aug', 'Monday', 'Janmashtami');
INSERT INTO FESTIVALS VALUES ('10 Sep', 'Friday', 'Ganesh Chaturthi/Vinayaka Chaturthi');
INSERT INTO FESTIVALS VALUES ('02 Oct', 'Saturday', 'Gandhi Jayanti');
INSERT INTO FESTIVALS VALUES ('13 Oct', 'Wednesday', 'Maha Ashtami');
INSERT INTO FESTIVALS VALUES ('14 Oct', 'Thursday', 'Maha Navami');
INSERT INTO FESTIVALS VALUES ('15 Oct', 'Friday', 'Dussehra');
INSERT INTO FESTIVALS VALUES ('4 Nov', 'Thursday', 'Naraka Chaturdasi');
INSERT INTO FESTIVALS VALUES ('4 Nov', 'Thursday', 'Diwali/Deepavali');
INSERT INTO FESTIVALS VALUES ('5 Nov', 'Friday', 'Govardhan Puja');
INSERT INTO FESTIVALS VALUES ('6 Nov', 'Saturday', 'Bhai Duj');
INSERT INTO FESTIVALS VALUES ('10 Nov', 'Wednesday', 'Chhat Puja (Pratihar Sashthi/Surya Sashthi)');
INSERT INTO FESTIVALS VALUES ('19 Nov', 'Friday', 'Guru Nanak Jayanti');
INSERT INTO FESTIVALS VALUES ('25 Dec', 'Saturday', 'Christmas');



--Creating usage examples

--WHEN IS HOLI FESTIVAL
SELECT DATE, DAY, NAME FROM FESTIVALS
WHERE NAME = 'Holi';

--HOW MANY FESTIVAL EACH DAY OF THE WEEK
SELECT DISTINCT DAY, COUNT(NAME) FROM FESTIVALS
GROUP BY DAY
ORDER BY DAY DESC;



--Creating Outbound Share and not adding Consumers
CREATE SHARE "PRINCE_RATHOR" COMMENT='FESTIVAL TABLE IN OUTGOING SCHEMA.';
GRANT USAGE ON DATABASE "SMEW_PROJECT" TO SHARE "PRINCE_RATHOR";
GRANT USAGE ON SCHEMA "SMEW_PROJECT"."OUTGOING" TO SHARE "PRINCE_RATHOR";
GRANT SELECT ON VIEW "SMEW_PROJECT"."OUTGOING"."FESTIVALS" TO SHARE "PRINCE_RATHOR";


//Go to https://app.snowflake.com/canada-central.azure/YOUR_ACCOUNT_HERRE/data/manage/provider/SMEW/
// and add a Standard Listing & fill out the details & publish it.

//Check your listing https://app.snowflake.com/canada-central.azure/op08192/data/manage/SMEW/listings/any

---------------------------------------------------------------------------------------------------------


// ******** 5. Create Personalized Listing ********

---------------------------------------------------------------------------------------------------------


// ******** 6. Deny a Request sent for your Personalized Listing ********


//Check using
--https://app.snowflake.com/canada-central.azure/op08192/data/manage/SMEW/requests

-----------------------------------------------------------------------------------------------------------