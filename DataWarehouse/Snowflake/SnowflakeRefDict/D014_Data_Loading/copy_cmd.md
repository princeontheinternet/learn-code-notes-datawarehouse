# Copy Command

- Copy command is used to transfer data to table from either a stage or directly from cloud and vice-versa(unloading).

```sql
--Directly from AWS cloud
copy into table_name 
from s3://snowflake-assignments-mc/gettingstarted/customers.csv
file_format = (TYPE = CSV 
               field_delimiter = ',' 
               SKIP_HEADER =1 );

--From a stage
copy into table_name
from @stage
file_format = (type = CSV, field_delimeter = ',' skip_header = 1);

```

---

### Copy Options

- **FILE**
  
  - Using "file" keyword to load specific file from stage.
  
    ```sql
    copy into table_name
    from @stage
    file_format = (type = CSV, field_delimeter = ',' skip_header = 1)
    files = ('filename.csv');
    ```

---

- **PATTERN**
  
  - Using "pattern" keyword you can search for a file.

    ```sql
    --Loading any file that has csv in it
    copy into table_name
    from @stage
    file_format = (type = CSV, field_delimeter = ',' skip_header = 1)
    pattern = '.*csv';
    ```

---

- **Transforming**
  
  - "Transforming" data from stage and then load it to the table.

    ```sql
    copy into table_name
    from (select s.$1, s.$2, s.$3, substring(s.$5, 1, 5) from @stage s)
    file_format =  (type = CSV, field_delimeter = ',' skip_header = 1)
    files = ('filename.csv');
    ```

---

- Copying into **specific col**

    ```sql
    copy into table_name (col1, col3)
    from (select s.$1, s.$3 from @stage s)
    file_format =  (type = CSV, field_delimeter = ',' skip_header = 1)
    files = ('filename.csv');
    ```

---

- **ON_ERROR**

  - Continues loading the file even if there's error

    ```ON_ERROR = 'CONTINUE'```

  - Aborts the load in case of any error (**by default**)

    ```ON_ERROR = 'ABORT_STATEMENT'```

  - Skips the file that has error
  
    ```ON_ERROR = 'SKIP_FILE'```

  - Skip the file if it has at least 2 error

    ```ON_ERROR = 'SKIP_FILE_2'```

  - Skip if the file if it has at least 2% of rows having error

    ```ON_ERROR = 'SKIP_FILE_2%'```

---

- **VALIDATION_MODE**

  - Validates & returns errors or specified no of rows.
  - This will not load the data into the table.

    - *RETURN_ERRORS*

    ```sql
    copy into table_name
    from @stage
    file_format = file_format_name
    pattern = '.*csv*'
    validation_mode = RETURN_ERRORS
    ```

    - RETURN_N_ROWS

    ```sql
    copy into table_name
    from @stage
    file_format = file_format_name
    pattern = '.*csv*'
    validation_mode = RETURN_5_ROWS
    ```

---

- **SIZE_LIMIT**

  - specify the max size (bytes) of data to be loaded.

  - At least one file will be loaded and if the second file is exceeding the size then copy cmd will stop.

  - **Q**: We have 3 files in our external stage with 20 000 000 bytes each.
    How many files will be loaded if we set SIZE_LIMIT = 30 000 000 ?

    - Ans: 2

---

- Checking **errors** while doing copy into **using on_error = continue**

  - ```sql
    copy into table_name
    from @stage
    file_format = file_format_name
    on_error = 'CONTINUE';

    --Checking the errors

    select rejected_record, * from table(validate(table_name, job_id => '_last'));
    ```

---

- **load history**

  - You can check the load history using the below tables.

    ```sql
        -- within the last 14 days
    select * from information_schema.load_history;

    -- within the last 365 days
    select * from snowflake.account_usage.load_history; 
    ```

---
