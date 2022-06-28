# Identity Vs Sequence

## Identity

- You can create a col with autoincrement identity.

```sql
create table table_name (
col1 number autoincrement start 1 increment 1,
col2 varchar(20)
);
```

## Sequence

```sql
create sequence seq_01 start = 1 increment = 1;
 
create table table_name(
col1 number default seq_01.nextval,
col2 varchar(20)
);
```