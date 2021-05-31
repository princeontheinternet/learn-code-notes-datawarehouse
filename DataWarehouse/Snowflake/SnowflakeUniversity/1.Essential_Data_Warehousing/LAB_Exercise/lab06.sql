
//Transforming data

SELECT * FROM FD_GROUP_INGEST;


Create table "USDA_NUTRIENT_STDREF"."PUBLIC"."FD_GROUP"
(
  fdgrp_cd varchar(4)
 ,fdgrp_desc varchar(60)
);


INSERT INTO "USDA_NUTRIENT_STDREF"."PUBLIC"."FD_GROUP"
SELECT
REPLACE(fdgrp_cd,'~','') as fdgrp_cd,
REPLACE(fdgrp_desc,'~','') as fdgrp_desc
FROM "USDA_NUTRIENT_STDREF"."PUBLIC"."FD_GROUP_INGEST";


SELECT * FROM FD_GROUP;
