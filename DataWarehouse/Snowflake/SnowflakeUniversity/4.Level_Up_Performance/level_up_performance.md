# Questions Based On Level Up Performance

Q. When does WH is not required?

- Create table doesn't require WH
- Select count(*) doesn't require WH as the o/p comes from Metadata Cache.
![img.png](img.png)
  
- Below case will not use WH but is valid for only 24 hours as result comes from Result Cache
![img_2.png](img_2.png)

---
<br>

Q. History area in WebUI

![img_1.png](img_1.png)

- For History prior to 14 days:
![img_4.png](img_4.png)

---
<br>

Q. Meaning of different contexts.

![img_3.png](img_3.png)

---
<br>

Q. Snowflake CACHES

    It has 3 caches
        1. Metadata Cache
        2. Result Cache
        3. Warehouse Cache

![img_5.png](img_5.png)

![img_6.png](img_6.png)

![img_7.png](img_7.png)


