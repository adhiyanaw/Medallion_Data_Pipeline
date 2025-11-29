USE ROLE ACCOUNTADMIN;
USE WAREHOUSE MEDALLION_WH;
USE DATABASE MEDALLION_DB;
USE SCHEMA MEDALLION_DB.BRONZE_LAYER;


CREATE OR REPLACE TABLE RAW_PRODUCTS (
    PRODUCT_ID NUMBER,
    PRODUCT_NAME STRING,
    CATEGORY STRING
);

----- LOAD DATA FROM FILE IN INTERNAL STAGE (PRODUCTS)
LIST @RAW_INTERNAL_STAGE/PRODUCTS;
COPY INTO RAW_PRODUCTS FROM @RAW_INTERNAL_STAGE/PRODUCTS FILE_FORMAT = MY_CSV;


CREATE OR REPLACE TABLE RAW_SALES (
    SALE_ID NUMBER,
    SALE_DATE DATE,
    CUSTOMER_ID NUMBER,
    PRODUCT_ID NUMBER,
    AMOUNT NUMBER
);

INSERT INTO RAW_SALES VALUES
(1,'2025-01-01',101,501,1200),
(2,'2025-01-02',102,503,450),
(3,'2025-01-02',101,502,300),
(4,'2025-01-03',103,501,1200),
(5,'2025-01-03',104,504,150),
(6,'2025-01-04',105,505,1800),
(7,'2025-01-04',106,507,90),
(8,'2025-01-05',107,506,350),
(9,'2025-01-05',108,508,110),
(10,'2025-01-06',109,502,300),
(11,'2025-01-06',110,503,450),
(12,'2025-01-07',111,509,60),
(13,'2025-01-07',112,510,80),
(14,'2025-01-08',113,501,1200),
(15,'2025-01-08',114,504,150),
(16,'2025-01-09',115,505,1800),
(17,'2025-01-09',116,506,350),
(18,'2025-01-10',117,507,90),
(19,'2025-01-10',118,508,110),
(20,'2025-01-11',119,509,60);


CREATE OR REPLACE TABLE RAW_CUSTOMERS (
    CUSTOMER_ID NUMBER,
    CUSTOMER_NAME STRING,
    EMAIL STRING,
    REGION STRING
);


INSERT INTO RAW_CUSTOMERS VALUES
(101,'Alice Tan','alice@example.com','APAC'),
(102,'Ben Lau','ben.lau@email.com','EU'),
(103,'Chris Wong','chris@email.com','US'),
(104,'Diana Lee','diana.lee@email.com','APAC'),
(105,'Evan Smith','evan.smith@email.com','US'),
(106,'Farah Ahmad','farah.ahmad@email.com','APAC'),
(107,'George Lim','george.lim@email.com','EU'),
(108,'Hannah Kim','hannah.kim@email.com','US'),
(109,'Ian Choo','ian.choo@email.com','APAC'),
(110,'Julia Park','julia.park@email.com','EU'),
(111,'Kevin Tan','kevin.tan@email.com','APAC'),
(112,'Lily Wong','lily.wong@email.com','US'),
(113,'Marcus Lee','marcus.lee@email.com','EU'),
(114,'Nina Koh','nina.koh@email.com','APAC'),
(115,'Oscar Tan','oscar.tan@email.com','US'),
(116,'Priya Singh','priya.singh@email.com','EU'),
(117,'Qian Wei','qian.wei@email.com','APAC'),
(118,'Ravi Patel','ravi.patel@email.com','US'),
(119,'Siti Nur','siti.nur@','APAC'),
(9999,'Tommy Chan','tommy.chan@email.com','EU');
