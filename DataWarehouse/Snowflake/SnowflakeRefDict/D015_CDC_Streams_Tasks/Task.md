# Task

- Executes a single DML statement or Stored Procedure call 
    
- Can NOT be triggered manually.
  
- Schedule interval set in minutes or CRON expression.
  - https://crontab.guru/

- May optionally be used with Streams.
  - Example: Check a stream for data and process it.

```sql

CREATE or replace TASK mytask_minute 
WAREHOUSE = <wh_name>
SCHEDULE = '1 MINUTE' 
AS 
INSERT INTO base_table(column_name) VALUES(CURRENT_TIMESTAMP);

```

- Task is in suspended state when it is created/cloned and need to be resumed using ALTER cmd.

```sql
-- To resume a task
ALTER TASK mytask_minute RESUME;

-- To Suspend a task
ALTER TASK mytask_minute SUSPEND;
```
