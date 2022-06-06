# Types Of Tables In Snowflake

![table_types.png](img/table_types.png)

<br>

![img_30.png](img/img_30.png)

_**Note :**_
- External tables cannot be cloned
- Only way to clone external table: 
  
```sql

    SELECT
        'CREATE OR REPLACE TABLE ALPHA_POC_DB.EVENT_RAW.' || TABLE_NAME || ' AS SELECT * FROM ALPHA_DEV_DB.EVENT_RAW.'||TABLE_NAME||';' AS stmt
    FROM
        ALPHA_DEV_DB.INFORMATION_SCHEMA."TABLES"
    WHERE
        TABLE_SCHEMA = 'EVENT_RAW'
        AND TABLE_TYPE = 'EXTERNAL TABLE'
        AND TABLE_NAME NOT IN (
        SELECT
            table_name
        FROM
            INFORMATION_SCHEMA."VIEWS");    
        
```
