Alter Session Set "_oracle_script" = TRUE;--��� ������� ��������� ��������� ����, ������� ������������ � ������������� � �������,
GRANT all PRIVILEGES TO PDB_KP_Admin;

Create TableSpace TS_KP -- �������� ���������� ������������ � ����������� ������� permanent
DataFile 'C:\app\Tablespaces\TS_KP.dbf'
Size 7M
Autoextend On Next 5M -- �������������� ����������
MaxSize 30M
Extent Management Local; --����������� �������� �������� ������

DROP TABLESPACE TS_KDA
    INCLUDING CONTENTS AND DATAFILES;
    
Create TEMPORARY TableSpace TS_KP_TEMP -- �������� ���������� ������������ � ���������� �������
TEMPFILE 'C:\app\Tablespaces\TS_KP_TEMP.dbf'
Size 5M
Autoextend On Next 3M
MaxSize 20M
EXTENT MANAGEMENT LOCAL;

DROP TABLESPACE TS_KDA_TEMP
    INCLUDING CONTENTS AND DATAFILES;

CREATE TABLE KP_CLIENT(
ID_CLIENT NUMBER,
FIO_CLIENT NVARCHAR2(50),
AGE_CLIENT NUMBER,
NUMBER_PHONE_CLIENT NVARCHAR2(13),
PASSPORT NVARCHAR2(10),
ADDRESS NUMBER,
ID_EMPLOYEE NUMBER,
CONSTRAINT KP_CLIENT_PK PRIMARY KEY(ID_CLIENT),
CONSTRAINT KP_CLIENT_FK FOREIGN KEY(ID_EMPLOYEE) REFERENCES  KP_EMPLOYEE(ID_EMPLOYEE)
);
    
CREATE TABLE KP_CLIENT_ADRESS(
ID_CLIENT NUMBER,
CITY NVARCHAR2(50),
STREET NVARCHAR2(50),
NUMBER_HOUSE NUMBER,
BUILDING NUMBER,
FLAT NUMBER,
CONSTRAINT KP_CLIENT_ADDRESS_FK FOREIGN KEY(ID_CLIENT) REFERENCES KP_CLIENT(ID_CLIENT)
);

CREATE TABLE KP_CLIENT_EXERCISES(
ID_EXERCISES NUMBER,
ID_CLIENT NUMBER,
DATA_TRAINIG DATE,
NAME_EXERCISES NVARCHAR2(50),
PULSE NUMBER,
BURN_CALORIES NUMBER,
CONSTRAINT KP_EXERCISES_CLIENT_FK FOREIGN KEY(ID_CLIENT) REFERENCES KP_CLIENT(ID_CLIENT)
);

CREATE TABLE KP_CLIENT_SERVICES(
ID_SERVICES NUMBER,
VIEW_SERVICES NVARCHAR2(50),
TIME_WORK NVARCHAR2(40),
SESSION_DURATION NUMBER,
CONSTRAINT KP_CLIENT_SERVICES_PK PRIMARY KEY(ID_SERVICES)
);

CREATE TABLE KP_CLIENT_PROVISION_SERVICES(
ID_PAYMENT NUMBER,
SERVICES NUMBER,
CLIENTS NUMBER,
TIMES NUMBER,
CONSTRAINT KP_CLIENT_PROVISION_FK FOREIGN KEY (CLIENTS)REFERENCES KP_CLIENT(ID_CLIENT),
CONSTRAINT KP_CLIENT_PROVISION_FK2 FOREIGN KEY (SERVICES)REFERENCES KP_CLIENT_SERVICES(ID_SERVICES)
);

CREATE TABLE KP_EMPLOYEE(
ID_EMPLOYEE NUMBER,
FIO_EMPLOYEE NVARCHAR2(50),
NUMBER_PHONE_EMPLOYEE NVARCHAR2(50),
POST NVARCHAR2(50),
CONSTRAINT KP_EMPLOYEE_PK PRIMARY KEY(ID_EMPLOYEE)
);

