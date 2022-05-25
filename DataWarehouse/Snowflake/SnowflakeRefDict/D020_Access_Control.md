
### Access Control


![img_2.png](img/img_2.png)

1. ACCOUNTADMIN
- This is the super root user.
- This is the most powerful account level and should be assigned to at-least 2 users.
- Do not use ACCOUNTADMIN to create objects as you will have to then give grants from this a/c & is not recommended.

2. SECURITYADMIN
- It globally manages grants.

3. SYSADMIN
- This is the default role whenever you login.
- Creates all objects like wh, schemas, table, views, etc

4. USERADMIN 
- Creates user and manages roles.

---