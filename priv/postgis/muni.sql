SET CLIENT_ENCODING TO UTF8;
SET STANDARD_CONFORMING_STRINGS TO ON;
SELECT DropGeometryColumn('','loc_municipalpoints_ocio','geom');
DROP TABLE IF EXISTS "loc_municipalpoints_ocio";
BEGIN;
CREATE TABLE "loc_municipalpoints_ocio" (gid serial,
"objectid" int2,
"feature_id" numeric,
"feature_na" varchar(16),
"feature_cl" varchar(15),
"state_alph" varchar(2),
"state_nume" numeric,
"county_nam" varchar(12),
"county_num" numeric,
"primary_la" varchar(7),
"prim_long_" varchar(8),
"prim_lat_d" numeric,
"prim_lon_1" numeric,
"source_lat" varchar(1),
"source_lon" varchar(1),
"source_l_1" numeric,
"source_l_2" numeric,
"elev_in_m" numeric,
"elev_in_ft" numeric,
"map_name" varchar(23),
"date_creat" date,
"date_edite" date,
"classfp" varchar(2),
"countyseat" varchar(3));
ALTER TABLE "loc_municipalpoints_ocio" ADD PRIMARY KEY (gid);
SELECT AddGeometryColumn('','loc_municipalpoints_ocio','geom','4326','POINT',2);
INSERT INTO "loc_municipalpoints_ocio" ("objectid","feature_id","feature_na","feature_cl","state_alph","state_nume","county_nam","county_num","primary_la","prim_long_","prim_lat_d","prim_lon_1","source_lat","source_lon","source_l_1","source_l_2","elev_in_m","elev_in_ft","map_name","date_creat","date_edite","classfp","countyseat",geom) VALUES ('1','826891.000000000000000','Abie','Populated Place','NE','31.000000000000000','Butler','23.000000000000000','412003N','0965656W','41.334175600000002','-96.948921100000007',NULL,NULL,NULL,NULL,'446.000000000000000','1463.000000000000000','Bruno','19790309','20190701','C1','no','0101000000211FF410AE9564C100D578891F4F5341');
INSERT INTO "loc_municipalpoints_ocio" ("objectid","feature_id","feature_na","feature_cl","state_alph","state_nume","county_nam","county_num","primary_la","prim_long_","prim_lat_d","prim_lon_1","source_lat","source_lon","source_l_1","source_l_2","elev_in_m","elev_in_ft","map_name","date_creat","date_edite","classfp","countyseat",geom) VALUES ('2','826897.000000000000000','Adams','Populated Place','NE','31.000000000000000','Gage','67.000000000000000','402734N','0963036W','40.459444099999999','-96.510017099999999',NULL,NULL,NULL,NULL,'382.000000000000000','1253.000000000000000','Adams','19790309','20080320','C1','no','0101000000A323B9BED27D64C12063EE7251D15241');
INSERT INTO "loc_municipalpoints_ocio" ("objectid","feature_id","feature_na","feature_cl","state_alph","state_nume","county_nam","county_num","primary_la","prim_long_","prim_lat_d","prim_lon_1","source_lat","source_lon","source_l_1","source_l_2","elev_in_m","elev_in_ft","map_name","date_creat","date_edite","classfp","countyseat",geom) VALUES ('3','826919.000000000000000','Ainsworth','Populated Place','NE','31.000000000000000','Brown','17.000000000000000','423300N','0995145W','42.549999300000003','-99.862623600000006',NULL,NULL,NULL,NULL,'768.000000000000000','2520.000000000000000','Ainsworth','19790309','20190813','C5','yes','0101000000986E120D0E3465C100000084D3005441');
INSERT INTO "loc_municipalpoints_ocio" ("objectid","feature_id","feature_na","feature_cl","state_alph","state_nume","county_nam","county_num","primary_la","prim_long_","prim_lat_d","prim_lon_1","source_lat","source_lon","source_l_1","source_l_2","elev_in_m","elev_in_ft","map_name","date_creat","date_edite","classfp","countyseat",geom) VALUES ('579',NULL,'Woodland Hills',NULL,'NE','31.000000000000000','Otoe','131.000000000000000',NULL,NULL,'40.751150690000003','-96.420999949999995',NULL,NULL,NULL,NULL,'385.000000000000000','1263.000000000000000','Woodland Hills','20200103','20200103','U1','no','0101000000A301BC13FC7864C180E2C75C16FB5241');
INSERT INTO "loc_municipalpoints_ocio" ("objectid","feature_id","feature_na","feature_cl","state_alph","state_nume","county_nam","county_num","primary_la","prim_long_","prim_lat_d","prim_lon_1","source_lat","source_lon","source_l_1","source_l_2","elev_in_m","elev_in_ft","map_name","date_creat","date_edite","classfp","countyseat",geom) VALUES ('580',NULL,'Woodland Park',NULL,'NE','31.000000000000000','Stanton','167.000000000000000',NULL,NULL,'42.054247670000002','-97.345197319999997',NULL,NULL,NULL,NULL,'450.000000000000000','1476.000000000000000','Woodland Park','20200103','20200103','U1','no','01010000004A7B833938AB64C138F8C23CF5B75341');
COMMIT;
ANALYZE "loc_municipalpoints_ocio";
