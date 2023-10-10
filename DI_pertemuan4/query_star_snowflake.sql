/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     10/10/2023 15:43:02                          */
/*==============================================================*/


DROP TABLE IF EXISTS DIM_EMPLOYEE;

DROP TABLE IF EXISTS DIM_PRODUCT;

DROP TABLE IF EXISTS DIM_SALES_TYPE;

DROP TABLE IF EXISTS DIM_STORE;

DROP TABLE IF EXISTS DIM_TIME;

DROP TABLE IF EXISTS FACT_SALES;

/*==============================================================*/
/* Table: DIM_EMPLOYEE                                          */
/*==============================================================*/
CREATE TABLE DIM_EMPLOYEE
(
   EMPLOYEE_ID          INT NOT NULL,
   FIRST_NAME           VARCHAR(128),
   LAST_NAME            VARCHAR(128),
   BIRTH_YEAR           INT,
   PRIMARY KEY (EMPLOYEE_ID)
);

/*==============================================================*/
/* Table: DIM_PRODUCT                                           */
/*==============================================================*/
CREATE TABLE DIM_PRODUCT
(
   PRODUCT_ID           INT NOT NULL,
   PRODUCT_NAME         VARCHAR(256),
   PRODUCT_TYPE         VARCHAR(256),
   PRIMARY KEY (PRODUCT_ID)
);

/*==============================================================*/
/* Table: DIM_SALES_TYPE                                        */
/*==============================================================*/
CREATE TABLE DIM_SALES_TYPE
(
   SALES_TYPE_ID        INT NOT NULL,
   TYPE_NAME            VARCHAR(128),
   PRIMARY KEY (SALES_TYPE_ID)
);

/*==============================================================*/
/* Table: DIM_STORE                                             */
/*==============================================================*/
CREATE TABLE DIM_STORE
(
   STORE_ID             INT NOT NULL,
   STORE_ADDRESS        VARCHAR(256),
   CITY                 VARCHAR(128),
   REGION               VARCHAR(128),
   STATE                VARCHAR(128),
   COUNTRY              VARCHAR(128),
   PRIMARY KEY (STORE_ID)
);

/*==============================================================*/
/* Table: DIM_TIME                                              */
/*==============================================================*/
CREATE TABLE DIM_TIME
(
   TIME_ID              INT NOT NULL,
   ACTION_DATE          DATE,
   ACTION_WEEK          INT,
   ACTION_MONTH         INT,
   ACTION_YEAR          INT,
   ACTION_WEEKDAY       VARCHAR(16),
   PRIMARY KEY (TIME_ID)
);

/*==============================================================*/
/* Table: FACT_SALES                                            */
/*==============================================================*/
CREATE TABLE FACT_SALES
(
   PRODUCT_ID           INT NOT NULL,
   EMPLOYEE_ID          INT NOT NULL,
   TIME_ID              INT NOT NULL,
   STORE_ID             INT NOT NULL,
   SALES_TYPE_ID        INT NOT NULL,
   PRICE                DECIMAL(8,2),
   QUANTITY             DECIMAL(8,2),
   PRIMARY KEY (PRODUCT_ID, EMPLOYEE_ID, TIME_ID, STORE_ID, SALES_TYPE_ID)
);

ALTER TABLE FACT_SALES ADD CONSTRAINT FK_RELATIONSHIP_1 FOREIGN KEY (EMPLOYEE_ID)
      REFERENCES DIM_EMPLOYEE (EMPLOYEE_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE FACT_SALES ADD CONSTRAINT FK_RELATIONSHIP_2 FOREIGN KEY (SALES_TYPE_ID)
      REFERENCES DIM_SALES_TYPE (SALES_TYPE_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE FACT_SALES ADD CONSTRAINT FK_RELATIONSHIP_3 FOREIGN KEY (STORE_ID)
      REFERENCES DIM_STORE (STORE_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE FACT_SALES ADD CONSTRAINT FK_RELATIONSHIP_4 FOREIGN KEY (TIME_ID)
      REFERENCES DIM_TIME (TIME_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

ALTER TABLE FACT_SALES ADD CONSTRAINT FK_RELATIONSHIP_5 FOREIGN KEY (PRODUCT_ID)
      REFERENCES DIM_PRODUCT (PRODUCT_ID) ON DELETE RESTRICT ON UPDATE RESTRICT;

