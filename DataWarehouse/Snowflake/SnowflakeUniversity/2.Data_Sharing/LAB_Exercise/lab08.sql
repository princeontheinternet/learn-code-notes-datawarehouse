
//LAB 8 - EXERCISE 1 -----------------------------------;


//We created Inbound Share Database with help of Data Sharing using Data Marketplace
//where we clicked on Get Data using ACCOUNTADMIN role and it created a Onbound Database.

//The Provider creates a table/view then creates an Outbound share and does not add Consumers and list it in Data Marketplace
//The Consumer clicks on GET DATA using ACCOUNTADMIN role and it creates an Inbound Database.



//Eg of Stored PROCEDURE

create or replace procedure lotstockupdate_sp()
  returns string not null
  language javascript
  as
  $$
    var my_sql_command1 = "truncate table outgoing.acme_detroit.lotstockreturn;";
    var statement1 = snowflake.createStatement( {sqlText: my_sql_command1} );
    var result_set1 = statement1.execute();

    var my_sql_command2 ="insert into outgoing.acme_detroit.lotstockreturn select * from outgoing.acme_detroit.lotstockenhanced;";
    var statement2 = snowflake.createStatement( {sqlText: my_sql_command2} );
    var result_set2 = statement2.execute();

     return my_sql_command;
  $$;




//Eg of a Task

create or replace task acme_return_update
  warehouse = compute_wh
  schedule = '1 minute'
as
  call lotstockupdate_sp();

  show tasks;
  desc task acme_return_update;

  alter task acme_return_update resume;
  alter task acme_return_update suspend;


--Check back 5 mins later to make sure your task has been running
select *
from table(information_schema.task_history())
order by scheduled_time;