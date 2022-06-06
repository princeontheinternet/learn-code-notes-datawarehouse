# Time Travel

- Accessing historical data at any point within a defined period.
- Each typeof table has time travel period.
- You can undrop a table if it is missing within a time travel period.
- If the file is missing which is not within the time period then you can make use of fail-safe support and contact Snowflake for the same.
- If you delete a row then Clone table from a previous point in time using time travel.

![time_travel](img/time_travel.png)

---

## Time Travel SQLs

![time_travel_cmd](img/time_travel_cmd.png)

```sql

-- To check DATA_RETENTION_TIME_IN_DAYS at account level
SHOW PARAMETERS IN ACCOUNT;

-- To check DATA_RETENTION_TIME_IN_DAYS at database level
USE DATABASE <db_name>
SHOW PARAMETERS IN DATABASE;

-- To check DATA_RETENTION_TIME_IN_DAYS at schema level
SHOW PARAMETERS IN schema <schema_name>;
--OR
SHOW PARAMETERS IN schema; --set the context before running

-- To check DATA_RETENTION_TIME_IN_DAYS at table level
SHOW PARAMETERS IN TABLE <table_name>;

-- We can set the DATA_RETENTION_TIME_IN_DAYS while creating the table
CREATE TABLE <table_name> (id integer, name string) DATA_RETENTION_TIME_IN_DAYS = 1;

-- To alter the default value of DATA_RETENTION_TIME_IN_DAYS
ALTER TABLE <table_name> SET DATA_RETENTION_TIME_IN_DAYS = 7;

```


- AT | BEFORE clause uses one of the following parameters
  - TIMESTAMP
  - OFFSET (time difference in seconds from the present time)
  - STATEMENT (identifier for statement, e.g. query ID)

---

_**Note:**_

- The **default time travel** period at the account level or any object level is **1 day**.

---

## Fail Safe

- Fail safe only works on permanent tables as (transient, temporary, external) tables do not have fail safe.
  
- 7-day retention for historical data after Time Travel expiration.

- Only accessible by Snowflake Team.
