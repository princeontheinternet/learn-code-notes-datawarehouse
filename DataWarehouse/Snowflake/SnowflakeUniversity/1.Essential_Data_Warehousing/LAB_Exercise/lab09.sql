
//Using SEQUENCE

CREATE DATABASE LIBRARY_CARD_CATALOG COMMENT = 'Essentials Lesson 9 ';
USE DATABASE LIBRARY_CARD_CATALOG;


CREATE OR REPLACE TABLE AUTHOR (
   AUTHOR_UID NUMBER
  ,FIRST_NAME VARCHAR(50)
  ,MIDDLE_NAME VARCHAR(50)
  ,LAST_NAME VARCHAR(50)
);


INSERT INTO AUTHOR(AUTHOR_UID,FIRST_NAME,MIDDLE_NAME, LAST_NAME)
Values
(1, 'Fiona', '','Macdonald')
,(2, 'Gian','Paulo','Faleschini');


//Creating a SEQUENCE FOR AUTHOR and inserting data

CREATE SEQUENCE "LIBRARY_CARD_CATALOG"."PUBLIC".SEQ_AUTHOR_ID
START 1
INCREMENT 1
COMMENT = 'Use this to fill in AUTHOR_UID everytime you add a row ';


USE DATABASE LIBRARY_CARD_CATALOG;

CREATE OR REPLACE SEQUENCE "LIBRARY_CARD_CATALOG"."PUBLIC"."SEQ_AUTHOR_UID"
START 3
INCREMENT 1
COMMENT = 'Use this to fill in the AUTHOR_UID everytime you add a row';


INSERT INTO AUTHOR(AUTHOR_UID,FIRST_NAME,MIDDLE_NAME, LAST_NAME)
Values
(SEQ_AUTHOR_UID.nextval, 'Laura', 'K','Egendorf')
,(SEQ_AUTHOR_UID.nextval, 'Jan', '','Grover')
,(SEQ_AUTHOR_UID.nextval, 'Jennifer', '','Clapp')
,(SEQ_AUTHOR_UID.nextval, 'Kathleen', '','Petelinsek');



//Using sequence in CREATE Command using DEFAULT keyword

USE DATABASE LIBRARY_CARD_CATALOG;

CREATE OR REPLACE SEQUENCE "LIBRARY_CARD_CATALOG"."PUBLIC"."SEQ_BOOK_UID"
START 1
INCREMENT 1
COMMENT = 'Use this to fill in the BOOK_UID everytime you add a row';


CREATE OR REPLACE TABLE BOOK
( BOOK_UID NUMBER DEFAULT SEQ_BOOK_UID.nextval
 ,TITLE VARCHAR(50)
 ,YEAR_PUBLISHED NUMBER(4,0)
);


INSERT INTO BOOK(TITLE,YEAR_PUBLISHED)
VALUES
 ('Food',2001)
,('Food',2006)
,('Food',2008)
,('Food',2016)
,('Food',2015);



//Mapping author to book

USE DATABASE LIBRARY_CARD_CATALOG;

CREATE TABLE BOOK_TO_AUTHOR
(  BOOK_UID NUMBER
  ,AUTHOR_UID NUMBER
);


INSERT INTO BOOK_TO_AUTHOR(BOOK_UID,AUTHOR_UID)
VALUES
 (1,1) // This row links the 2001 book to Fiona Macdonald
,(1,2) // This row links the 2001 book to Gian Paulo Faleschini
,(2,3) // Links 2006 book to Laura K Egendorf
,(3,4) // Links 2008 book to Jan Grover
,(4,5) // Links 2016 book to Jennifer Clapp
,(5,6); // Links 2015 book to Kathleen Petelinsek

select * from  book_to_author;
