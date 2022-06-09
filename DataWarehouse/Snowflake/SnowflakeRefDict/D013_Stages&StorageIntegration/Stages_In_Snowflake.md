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

---
