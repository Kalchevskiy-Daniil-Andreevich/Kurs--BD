CREATE TABLE LIST_OF_CLIENTS
(
    ID_CLIENT NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    SURNAME_CLIENT NVARCHAR2(50) NOT NULL,
    NAME_CLIENT NVARCHAR2(50) NOT NULL,
    PATRONYMIC_CLIENT NVARCHAR2(50) NOT NULL,
    AGE_CLIENT NUMBER NOT NULL,
    ADDRESS_CLIENT NVARCHAR2(200) NOT NULL,
    TELEPHONE_CLIENT NVARCHAR2(13) NOT NULL,
    PASSPORT_CLIENT NVARCHAR2(20) NOT NULL,
    CONSTRAINT PK_LIST_OF_CLIENTS PRIMARY KEY(ID_CLIENT)
);
CREATE TABLE ABONEMENTS
(
    ID_ABONEMENT NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    TYPE_OF_TRAINING NVARCHAR2(50) NOT NULL,
    TYPE_OF_SERVICE NVARCHAR2(50) NOT NULL,
    PRICE NUMBER NOT NULL,
    AMOUNT_OF_VISITS NUMBER NOT NULL,
    AMOUNT_OF_DAYS NUMBER NOT NULL,
    AMOUNT_OF_MONTHS NUMBER NOT NULL,
    CONSTRAINT PK_ABONEMENTS PRIMARY KEY(ID_ABONEMENT)
);
CREATE TABLE SALE_OF_ABONEMENTS
(
    ID_SALE NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    ID_CLIENT NUMBER NOT NULL,
    ID_ABONEMENT NUMBER NOT NULL,
    DATA_BEGIN DATE NOT NULL,
    DATA_END DATE NOT NULL,
    CONSTRAINT PK_SALE_OF_ABONEMENTS PRIMARY KEY(ID_SALE),
    CONSTRAINT FK_SALE_OF_ABONEMENTS FOREIGN KEY(ID_CLIENT) REFERENCES LIST_OF_CLIENTS(ID_CLIENT),
    CONSTRAINT FK_SALE_OF_ABONEMENTS2 FOREIGN KEY(ID_ABONEMENT) REFERENCES ABONEMENTS(ID_ABONEMENT)
);
CREATE TABLE INFO_COMPLEXES(
    ID_COMPLEXES NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    NAME_COMPLEXES NVARCHAR2(100),
    ADDRESS_COMPLEXES NVARCHAR2(100),
    CAPACITY_COMPLEXES NUMBER,
    CONSTRAINT PK_INFO_COMPLEXES PRIMARY KEY(ID_COMPLEXES)
);
CREATE TABLE VISIT_RECORD
(
    NUMBER_OF_VISITS NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    ID_SALE NUMBER NOT NULL,
    NUMBER_RECORD NUMBER NOT NULL,
    ID_COMPLEXES NUMBER NOT NULL,
    CONSTRAINT PK_VISIT_RECORD PRIMARY KEY(NUMBER_OF_VISITS),
    CONSTRAINT FK_VISIT_RECORD FOREIGN KEY(ID_SALE) REFERENCES SALE_OF_ABONEMENTS(ID_SALE),
    CONSTRAINT FK_VISIT_RECORD2 FOREIGN KEY(NUMBER_RECORD) REFERENCES TIME_TABLE(NUMBER_RECORD),
    CONSTRAINT FK_VISIT_RECORD3 FOREIGN KEY(ID_COMPLEXES) REFERENCES INFO_COMPLEXES(ID_COMPLEXES)
);
CREATE TABLE TIME_TABLE
(
    NUMBER_RECORD NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    DATA_TIME_TABLE DATE NOT NULL,
    TIME_BEGIN NVARCHAR2(20) NOT NULL,
    TIME_END NVARCHAR2(20) NOT NULL,
    ID_EMPLOYEE NUMBER NOT NULL,
    ID_SERVICES NUMBER NOT NULL,
    ID_TRAINING NUMBER NOT NULL,
    CONSTRAINT PK_TIME_TABLE PRIMARY KEY(NUMBER_RECORD),
    CONSTRAINT FK_TIME_TABLE FOREIGN KEY(ID_EMPLOYEE) REFERENCES LIST_OF_EMPLOYEE(ID_EMPLOYEE),
    CONSTRAINT FK_TIME_TABLE2 FOREIGN KEY(ID_SERVICES) REFERENCES LIST_OF_SERVICES(ID_SERVICES),
    CONSTRAINT FK_TIME_TABLE3 FOREIGN KEY(ID_TRAINING) REFERENCES TYPES_OF_TRAINING(ID_TRAINING)
);

CREATE TABLE LIST_OF_SERVICES
(
    ID_SERVICES NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    TYPES_OF_SERVICES NVARCHAR2(50) NOT NULL,
    CONSTRAINT PK_LIST_OF_SERVICES PRIMARY KEY(ID_SERVICES)
);

CREATE TABLE TYPES_OF_TRAINING
(
    ID_TRAINING NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    TYPES_OF_TRAINING NVARCHAR2(50) NOT NULL,
    CONSTRAINT PK_TYPES_OF_TRAINING PRIMARY KEY(ID_TRAINING)
);

CREATE TABLE LIST_OF_EMPLOYEE
(
    ID_EMPLOYEE NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    SURNAME_EMPLOYEE NVARCHAR2(50) NOT NULL,
    NAME_EMPLOYEE NVARCHAR2(50) NOT NULL,
    PATRONYMIC_EMPLOYEE NVARCHAR2(50) NOT NULL,
    TELEPHONE_EMPLOYEE NVARCHAR2(13) NOT NULL,
    ADDRESS_EMPLOYEE NVARCHAR2(50) NOT NULL,
    SALARY_EMPLOYEE NUMBER,
    CONSTRAINT PK_LIST_OF_EMPLOYEE PRIMARY KEY(ID_EMPLOYEE)  
);

DROP TABLE VISIT_RECORD;
DELETE FROM VISIT_RECORD;

DROP TABLE SALE_OF_ABONEMENTS;
DELETE FROM SALE_OF_ABONEMENTS;

DROP TABLE ABONEMENTS;
DELETE FROM ABONEMENTS;

DROP TABLE LIST_OF_CLIENTS;
DELETE FROM LIST_OF_CLIENTS;

DROP TABLE TIME_TABLE;
DELETE FROM TIME_TABLE;

DROP TABLE LIST_OF_SERVICES;
DELETE FROM LIST_OF_SERVICES;

DROP TABLE TYPES_OF_TRAINING;
DELETE FROM TYPES_OF_TRAINING;

DROP TABLE LIST_OF_EMPLOYEE;
DELETE FROM LIST_OF_EMPLOYEE;

DROP TABLE INFO_COMPLEXES;
DELETE FROM INFO_COMPLEXES;



CREATE TABLE LIST_OF_CLIENTS_IMPORT
(
    ID_CLIENT NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    SURNAME_CLIENT NVARCHAR2(50) NOT NULL,
    NAME_CLIENT NVARCHAR2(50) NOT NULL,
    PATRONYMIC_CLIENT NVARCHAR2(50) NOT NULL,
    AGE_CLIENT NUMBER NOT NULL,
    ADDRESS_CLIENT NVARCHAR2(200) NOT NULL,
    TELEPHONE_CLIENT NVARCHAR2(13) NOT NULL,
    PASSPORT_CLIENT NVARCHAR2(20) NOT NULL,
    CONSTRAINT PK_LIST_OF_CLIENTS1 PRIMARY KEY(ID_CLIENT)
);

CREATE TABLE ABONEMENTS_IMPORT
(
    ID_ABONEMENT NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    TYPE_OF_TRAINING NVARCHAR2(50) NOT NULL,
    TYPE_OF_SERVICE NVARCHAR2(50) NOT NULL,
    PRICE NUMBER NOT NULL,
    AMOUNT_OF_VISITS NUMBER NOT NULL,
    AMOUNT_OF_DAYS NUMBER NOT NULL,
    AMOUNT_OF_MONTHS NUMBER NOT NULL,
    CONSTRAINT PK_ABONEMENTS1 PRIMARY KEY(ID_ABONEMENT)
);

CREATE TABLE SALE_OF_ABONEMENTS_IMPORT
(
    ID_SALE NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    ID_CLIENT NUMBER NOT NULL,
    ID_ABONEMENT NUMBER NOT NULL,
    DATA_BEGIN DATE NOT NULL,
    DATA_END DATE NOT NULL,
    CONSTRAINT PK_SALE_OF_ABONEMENTS1 PRIMARY KEY(ID_SALE),
    CONSTRAINT FK_SALE_OF_ABONEMENTS3 FOREIGN KEY(ID_CLIENT) REFERENCES LIST_OF_CLIENTS(ID_CLIENT),
    CONSTRAINT FK_SALE_OF_ABONEMENTS4 FOREIGN KEY(ID_ABONEMENT) REFERENCES ABONEMENTS(ID_ABONEMENT)
);

CREATE TABLE INFO_COMPLEXES_IMPORT
(
    ID_COMPLEXES NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    NAME_COMPLEXES NVARCHAR2(100),
    ADDRESS_COMPLEXES NVARCHAR2(100),
    CAPACITY_COMPLEXES NUMBER,
    CONSTRAINT PK_INFO_COMPLEXES1 PRIMARY KEY(ID_COMPLEXES)
);

CREATE TABLE TIME_TABLE_IMPORT
(
    NUMBER_RECORD NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    DATA_TIME_TABLE DATE NOT NULL,
    TIME_BEGIN NVARCHAR2(20) NOT NULL,
    TIME_END NVARCHAR2(20) NOT NULL,
    ID_EMPLOYEE NUMBER NOT NULL,
    ID_SERVICES NUMBER NOT NULL,
    ID_TRAINING NUMBER NOT NULL,
    CONSTRAINT PK_TIME_TABLE5 PRIMARY KEY(NUMBER_RECORD),
    CONSTRAINT FK_TIME_TABLE6 FOREIGN KEY(ID_EMPLOYEE) REFERENCES LIST_OF_EMPLOYEE(ID_EMPLOYEE),
    CONSTRAINT FK_TIME_TABLE7 FOREIGN KEY(ID_SERVICES) REFERENCES LIST_OF_SERVICES(ID_SERVICES),
    CONSTRAINT FK_TIME_TABLE8 FOREIGN KEY(ID_TRAINING) REFERENCES TYPES_OF_TRAINING(ID_TRAINING)
);

CREATE TABLE LIST_OF_SERVICES_IMPORT
(
    ID_SERVICES NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    TYPES_OF_SERVICES NVARCHAR2(50) NOT NULL,
    CONSTRAINT PK_LIST_OF_SERVICES10 PRIMARY KEY(ID_SERVICES)
);

CREATE TABLE TYPES_OF_TRAINING_IMPORT
(
    ID_TRAINING NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    TYPES_OF_TRAINING NVARCHAR2(50) NOT NULL,
    CONSTRAINT PK_TYPES_OF_TRAINING11 PRIMARY KEY(ID_TRAINING)
);

CREATE TABLE LIST_OF_EMPLOYEE_IMPORT
(
    ID_EMPLOYEE NUMBER GENERATED BY DEFAULT AS IDENTITY (START WITH 1 INCREMENT BY 1) NOT NULL,
    SURNAME_EMPLOYEE NVARCHAR2(50) NOT NULL,
    NAME_EMPLOYEE NVARCHAR2(50) NOT NULL,
    PATRONYMIC_EMPLOYEE NVARCHAR2(50) NOT NULL,
    TELEPHONE_EMPLOYEE NVARCHAR2(13) NOT NULL,
    ADDRESS_EMPLOYEE NVARCHAR2(50) NOT NULL,
    SALARY_EMPLOYEE NUMBER,
    CONSTRAINT PK_LIST_OF_EMPLOYEE12 PRIMARY KEY(ID_EMPLOYEE)  
);

DROP TABLE SALE_OF_ABONEMENTS_IMPORT;
DELETE FROM SALE_OF_ABONEMENTS_IMPORT;

DROP TABLE ABONEMENTS_IMPORT;
DELETE FROM SALE_OF_ABONEMENTS_IMPORT;

DROP TABLE LIST_OF_CLIENTS_IMPORT;
DELETE FROM SALE_OF_ABONEMENTS_IMPORT;

DROP TABLE TIME_TABLE_IMPORT;
DELETE FROM SALE_OF_ABONEMENTS_IMPORT;

DROP TABLE LIST_OF_SERVICES_IMPORT;
DELETE FROM SALE_OF_ABONEMENTS_IMPORT;

DROP TABLE TYPES_OF_TRAINING_IMPORT;
DELETE FROM SALE_OF_ABONEMENTS_IMPORT;

DROP TABLE LIST_OF_EMPLOYEE_IMPORT;
DELETE FROM SALE_OF_ABONEMENTS_IMPORT;

DROP TABLE INFO_COMPLEXES_IMPORT;
DELETE FROM SALE_OF_ABONEMENTS_IMPORT;



CREATE VIEW LISOFCLI_VIEW AS SELECT * FROM LIST_OF_CLIENTS;
SELECT * FROM ALL_VIEWS WHERE VIEW_NAME = 'LISOFCLI_VIEW';

CREATE VIEW ABONM_VIEW AS SELECT * FROM ABONEMENTS;
SELECT * FROM ALL_VIEWS WHERE VIEW_NAME = 'ABONM_VIEW';

CREATE VIEW SALOFABONM_VIEW AS SELECT * FROM SALE_OF_ABONEMENTS;
SELECT * FROM ALL_VIEWS WHERE VIEW_NAME = 'SALOFABONM_VIEW';

CREATE VIEW INFCOMPL_VIEW AS SELECT * FROM INFO_COMPLEXES;
SELECT * FROM ALL_VIEWS WHERE VIEW_NAME = 'INFCOMPL_VIEW';

CREATE VIEW VISREC_VIEW AS SELECT * FROM VISIT_RECORD;
SELECT * FROM ALL_VIEWS WHERE VIEW_NAME = 'VISREC_VIEW';

CREATE VIEW TIMTAB_VIEW AS SELECT * FROM TIME_TABLE;
SELECT * FROM ALL_VIEWS WHERE VIEW_NAME = 'TIMTAB_VIEW';

CREATE VIEW LISOFSERV_VIEW AS SELECT * FROM LIST_OF_SERVICES;
SELECT * FROM ALL_VIEWS WHERE VIEW_NAME = 'LISOFSERV_VIEW';

CREATE VIEW TYPOFTRA_VIEW AS SELECT * FROM TYPES_OF_TRAINING;
SELECT * FROM ALL_VIEWS WHERE VIEW_NAME = 'TYPOFTRA_VIEW';

CREATE VIEW LISOFEMP_VIEW AS SELECT * FROM LIST_OF_EMPLOYEE;
SELECT * FROM ALL_VIEWS WHERE VIEW_NAME = 'LISOFEMP_VIEW';

DROP VIEW LISOFCLI_VIEW;
DROP VIEW ABONM_VIEW;
DROP VIEW SALOFABONM_VIEW;
DROP VIEW INFCOMPL_VIEW;
DROP VIEW VISREC_VIEW;
DROP VIEW TIMTAB_VIEW;
DROP VIEW LISOFSERV_VIEW;
DROP VIEW TYPOFTRA_VIEW;
DROP VIEW LISOFEMP_VIEW;



CREATE MATERIALIZED VIEW MATER_VIEW_LIST_OF_SERVICES
BUILD IMMEDIATE 
REFRESH ON DEMAND
ENABLE QUERY REWRITE 
AS SELECT * FROM LIST_OF_SERVICES;

SELECT * FROM ALL_MVIEWS WHERE MVIEW_NAME = 'MATER_VIEW_LIST_OF_SERVICES';

CREATE MATERIALIZED VIEW MATER_VIEW_TYPES_TRAINING
BUILD IMMEDIATE 
REFRESH ON DEMAND
ENABLE QUERY REWRITE 
AS SELECT * FROM TYPES_OF_TRAINING;

SELECT * FROM ALL_MVIEWS WHERE MVIEW_NAME = 'MATER_VIEW_TYPES_TRAINING';

DROP MATERIALIZED VIEW MATER_VIEW_LIST_OF_SERVICES;
DROP MATERIALIZED VIEW MATER_VIEW_TYPES_TRAINING;