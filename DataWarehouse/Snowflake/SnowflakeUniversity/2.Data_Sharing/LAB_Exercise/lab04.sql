
//Creating Reader a/c and setting up Outubound Share


--Account Details
--Trial_Account - op08192
--Trial_Username - Noob
--Trial_Password - *****


//LAB 4 - EXERCISE 1 -----------------------------------;

--Create a Reader A/C

CREATE MANAGED ACCOUNT ACME
admin_name='OSIRIS',
admin_password='Prince@1997',
type=reader,
COMMENT='Lottie\'s team will use';



--Account Details
--Reader_Account - OZ53000
--Reader_A/C_Admin_UserName - OSIRIS
--Reader_A/C_Admin_Password - ****








//LAB 4 - EXERCISE 2 -----------------------------------;

--Go to Reader Account and login as Admin

use role ACCOUNTADMIN;

--create a public user
create user LOTTIE password='abc123' default_role = PUBLIC must_change_password = true;


--Account Details
--Reader_A/C_Public_Role_UserName - LOTTIE
--Reader_A/C_Public_Role_Passwrod - abc123






//LAB 4 - EXERCISE 3 -----------------------------------;


--Add Consumer for Outbound Share in Trial A/C

ALTER SHARE "INTL_SHARE"
ADD ACCOUNTS = OZ53000;







//LAB 4 - EXERCISE 4 -----------------------------------;

--Creating Inbound Share Database in Reader A/C

CREATE DATABASE "WDE_INTL" FROM SHARE OP08192."INTL_SHARE";
GRANT IMPORTED PRIVILEGES ON DATABASE "WDE_INTL" TO ROLE "PUBLIC";


--Changing Reader A/C Public role Password while logging in i.e. forced to changed the password

--Account Details
--Reader_A/C_Public_Role_UserName - LOTTIE
--Reader_A/C_Public_Role_Password - abc123
--Reader_A/C_Public_Role_Password_forced_changed - ****


select current_role(); --run this on Reader's A/C after signing in as LOTTIE.







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
