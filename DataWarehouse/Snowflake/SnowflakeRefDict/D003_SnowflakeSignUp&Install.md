# SignUp & Install

### Signup for free trial

- Website: https://signup.snowflake.com/
- 30-day trial.
- Get $400 worth of free usage when you test drive Snowflake.

### Install Snowflake in CLI LINUX - SnowSQL 

1. Download from Web UI using help & download tab -  
    snowflake-snowsql-1.2.10-1.x86_64.rpm
   
2. Run commands
    - `sudo apt-get install alien dpkg-dev debhelper build-essential`
    - `sudo alien snowflake-snowsql-1.2.10-1.x86_64.rpm`
    - `sudo dpkg -i snowflake-snowsql_1.2.10-2_amd64.deb`

3. `$ snowsql -a <account_name> -u <user_name>`


4. set config file:

        [connections.myconnection]
        Can be used in SnowSql as #connect example
        
        accountname = fm31261.ap-south-1.aws
        username = ********
        password = "*******"
        
        
log_file = ~/.snowsql/snowsql_rt.log

5. Ctrl + D to exit.