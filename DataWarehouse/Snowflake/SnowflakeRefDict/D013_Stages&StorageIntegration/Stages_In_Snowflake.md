# Stages in Snowflake

![img_3.png](img/img_3.png)

- Stage extra columns

    ```metadata$filename, metadata$file_row_number```

    ```sql
    select
    $1, 
    $2, 
    metadata$filename, 
    metadata$file_row_number,
    to_timestamp_ntz(current_timestamp) as load_date
    from @stage_name;
    ```

_**Notes:**_

- For CSV file format you will have to use $1, $2 for columns in select statement, but for JSON and PARQUET file format you can directly use select * from @stage.

---
