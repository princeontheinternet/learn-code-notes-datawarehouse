 # Questions Based On Leve Up First Concepts

<br>

Q.  Which cloud providers are supported on Snowflake Data Platform?

    ● AWS (Amazon Web Services) (S3 bucket)
    ● Azure (Microsoft Azure) (Blob)
    ● GCP (Google Cloud Platform) (GCP Bucket)

---
<br>

Q. What are the four layers of Snowflake Architecture?

    ● Centralized Storage
    ● Multi-Cluster Compute 
    ● Cloud Services
    ● Cloud Agnostic Layer

---
<br>

Q. What are the names of Snowflake's founders?

    ● Thierry &
    ● Benoit

`They were initially trying to "Re-Architect data storage, in the cloud, from scratch".`

---
<br>

Q. According to founders, Snowflake architecture supports?

`MCQ`
![img.png](img/img.png)

---
<br>
<br>
<br>

## Q. Architecture of Snowflake.

![img_1.png](img/img_1.png)

    3. Layer 3:
        ● Cloud Service Layer
        ● Service Layer
        ● Query Planning
        ● Query Optimization
        ● Query Compilation
        ● Metadata Management
        ● User Authentication
        ● Metadata Storage
        ● Data Security

    2. Layer 2: 
        ● Compute Layer
        ● Virtual Warehouse Layer
        ● Query Processing Layer

    1. Layer 1:
        ● Data Layer
        ● Storage Layer
        ● Centralizeed Data Storage

![img_3.png](img/img_3.png)

![img_2.png](img/img_2.png)

---
<br>
<br>
<br>

## Q. KEY Concepts of Snowflake.

    ● Snowflake is a true SaaS(Software as a Service) solution as it requires:
        ◉ No hardware to purchase or configure.
        ◉ No maintenance upgrades or patches to install.
        ◉ Transparent releases don't require user intervention.

    ● Installment options of Snowflake
        Snowflake-Hosted Accounts (on Amazon cloud infrastructure)
        Snowflake-Hosted Accounts (on Azure cloud infrastructure)



![img_4.png](img/img_4.png)

![img_5.png](img/img_5.png)

![img_6.png](img/img_6.png)

![img_7.png](img/img_7.png)

![img_8.png](img/img_8.png)

![img_9.png](img/img_9.png)

![img_10.png](img/img_10.png)


---
<br>
<br>

## Q. Snowflake Ecosystem.

![img_11.png](img/img_11.png)

![img_12.png](img/img_12.png)

![img_13.png](img/img_13.png)

![img_14.png](img/img_14.png)

![img_15.png](img/img_15.png)

![img_16.png](img/img_16.png)

![img_17.png](img/img_17.png)

![img_18.png](img/img_18.png)

![img_19.png](img/img_19.png)

![img_20.png](img/img_20.png)

![img_21.png](img/img_21.png)

![img_22.png](img/img_22.png)

---
<br>

## Accounts & Assurances

Q. Snowflake Industry Compliance Award

![img_23.png](img/img_23.png)

---
<br>

Q. Snowflake Editions

    ● Standard Edition
    ● Enterprise Edition
    ● Business Critical Edition
    ● Virtual Private Snowflake (VPS)

---
<br>

Q. When setting up a Snowflake Account

![img_24.png](img/img_24.png)

![img_25.png](img/img_25.png)

![img_26.png](img/img_26.png)

![img_27.png](img/img_27.png)

---
<br>

## Container Hierarchy

Q. Storage Hierarchy 

![img_28.png](img/img_28.png)

---
<br>

Q. Schema Objects

![img_29.png](img/img_29.png)

---
<br>

Q. Table Types

![img_30.png](img/img_30.png)

![img_31.png](img/img_31.png)

---
<br>

Q. View Types

![img_32.png](img/img_32.png)

---
<br>

Q. Stage Types

![img_33.png](img/img_33.png)

---
<br>

Q. Shared Databases

![img_34.png](img/img_34.png)

---
<br>
<br>

## Backup and Recovery

Q. What is Time Travel?

    ● Accessing historical data at any point within a defined period.
    ● Each typeof table has time travel period.
    ● You can undrop a table if it is missing within a time travel period.
    ● If the file is missing which is not within the time period then you can make use of fail-safe support and contact Snowflake for the same.
    ● If you delete a row then Clone table from a previous point in time using time travel.

![img_35.png](img/img_35.png)
