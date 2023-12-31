CREATE ROLE RL_KP_OWNER;
GRANT ALL PRIVILEGES TO RL_KP_OWNER;

DROP ROLE RL_KP_OWNER;

Create Profile PF_KP_OWNER Limit
PASSWORD_LIFE_TIME 180
SESSIONS_PER_USER 3
FAILED_LOGIN_ATTEMPTS 7
PASSWORD_LOCK_TIME 1
PASSWORD_REUSE_TIME 10
PASSWORD_GRACE_TIME DEFAULT
CONNECT_TIME 180
IDLE_TIME 30

DROP PROFILE PF_KP_OWNER CASCADE;

CREATE USER KP_OWNER IDENTIFIED BY 0344533
DEFAULT TABLESPACE TS_KP 
TEMPORARY TABLESPACE TS_KP_TEMP
PROFILE PF_KP_OWNER
ACCOUNT UNLOCK
PASSWORD EXPIRE

DROP USER KP_OWNER CASCADE;

GRANT RL_KP_OWNER TO KP_OWNER;



CREATE ROLE RL_KP_CLIENT;

GRANT CREATE SESSION TO RL_KP_CLIENT;
GRANT EXECUTE ON INFO_TABLE_ABONEMENTS TO RL_KP_CLIENT;
GRANT EXECUTE ON INFO_TABLE_COMPLEXES TO RL_KP_CLIENT;
GRANT EXECUTE ON INFO_TABLE_LIST_OF_SERVICES TO RL_KP_CLIENT;
GRANT EXECUTE ON INFO_TABLE_TYPES_OF_TRAINING TO RL_KP_CLIENT;
GRANT EXECUTE ON ADD_ROWS_TO_LIST_OF_CLIENTS TO RL_KP_CLIENT;
GRANT EXECUTE ON ADD_ROWS_TO_SALE_OF_ABONEMENTS TO RL_KP_CLIENT;

DROP ROLE RL_KP_CLIENT;

Create Profile PF_KP_CLIENT Limit
PASSWORD_LIFE_TIME 180
SESSIONS_PER_USER 3
FAILED_LOGIN_ATTEMPTS 7
PASSWORD_LOCK_TIME 1
PASSWORD_REUSE_TIME 10
PASSWORD_GRACE_TIME DEFAULT
CONNECT_TIME 180
IDLE_TIME 30

DROP PROFILE PF_KP_CLIENT CASCADE;

CREATE USER KP_CLIENT IDENTIFIED BY LexaDanik510
DEFAULT TABLESPACE TS_KP QUOTA UNLIMITED ON TS_KP
TEMPORARY TABLESPACE TS_KP_TEMP
PROFILE PF_KP_OWNER
ACCOUNT UNLOCK


DROP USER KP_OWNER CASCADE;

GRANT RL_KP_CLIENT TO KP_CLIENT;



CREATE ROLE RL_KP_ANALYST;

GRANT CREATE SESSION TO RL_KP_ANALYST;
GRANT EXECUTE ON INFO_TABLE_LISOFCLI_VIEW TO RL_KP_ANALYST;
GRANT EXECUTE ON INFO_TABLE_ABONM_VIEW TO RL_KP_ANALYST;
GRANT EXECUTE ON INFO_TABLE_SALOFABONM_VIEW TO RL_KP_ANALYST;
GRANT EXECUTE ON INFO_TABLE_INFCOMPL_VIEW TO RL_KP_ANALYST;
GRANT EXECUTE ON INFO_TABLE_VISREC_VIEW TO RL_KP_ANALYST;
GRANT EXECUTE ON INFO_TABLE_TIMTAB_VIEW TO RL_KP_ANALYST;
GRANT EXECUTE ON INFO_TABLE_LISOFSERV_VIEW TO RL_KP_ANALYST;
GRANT EXECUTE ON INFO_TABLE_TYPOFTRA_VIEW TO RL_KP_ANALYST;
GRANT EXECUTE ON INFO_TABLE_LISOFEMP_VIEW TO RL_KP_ANALYST;

GRANT SELECT ON LISOFCLI_VIEW TO RL_KP_ANALYST;
GRANT SELECT ON ABONM_VIEW TO RL_KP_ANALYST;
GRANT SELECT ON SALOFABONM_VIEW TO RL_KP_ANALYST;
GRANT SELECT ON INFCOMPL_VIEW TO RL_KP_ANALYST;
GRANT SELECT ON VISREC_VIEW TO RL_KP_ANALYST;
GRANT SELECT ON TIMTAB_VIEW TO RL_KP_ANALYST;
GRANT SELECT ON LISOFSERV_VIEW TO RL_KP_ANALYST;
GRANT SELECT ON TYPOFTRA_VIEW TO RL_KP_ANALYST;
GRANT SELECT ON LISOFEMP_VIEW TO RL_KP_ANALYST;

DROP ROLE RL_KP_ANALYST;

Create Profile PF_KP_ANALYST Limit
PASSWORD_LIFE_TIME 180
SESSIONS_PER_USER 3
FAILED_LOGIN_ATTEMPTS 7
PASSWORD_LOCK_TIME 1
PASSWORD_REUSE_TIME 10
PASSWORD_GRACE_TIME DEFAULT
CONNECT_TIME 180
IDLE_TIME 30

DROP PROFILE PF_KP_ANALYST CASCADE;

CREATE USER KP_ANALYST IDENTIFIED BY LexaDanik510
DEFAULT TABLESPACE TS_KP QUOTA UNLIMITED ON TS_KP
TEMPORARY TABLESPACE TS_KP_TEMP
PROFILE PF_KP_ANALYST
ACCOUNT UNLOCK

DROP USER KP_ANALYST CASCADE;

GRANT RL_KP_ANALYST TO KP_ANALYST;



CREATE ROLE RL_KP_MANAGER;

GRANT CREATE SESSION TO RL_KP_MANAGER;
GRANT EXECUTE ON INFO_TABLE_LIST_OF_CLIENTS TO RL_KP_MANAGER;
GRANT EXECUTE ON INFO_TABLE_ABONEMENTS TO RL_KP_MANAGER;
GRANT EXECUTE ON INFO_TABLE_SALE_OF_ABONEMENTS TO RL_KP_MANAGER;
GRANT EXECUTE ON INFO_TABLE_COMPLEXES TO RL_KP_MANAGER;
GRANT EXECUTE ON INFO_TABLE_VISIT_RECORD TO RL_KP_MANAGER;
GRANT EXECUTE ON INFO_TABLE_TIME_TABLE TO RL_KP_MANAGER;
GRANT EXECUTE ON INFO_TABLE_LIST_OF_SERVICES TO RL_KP_MANAGER;
GRANT EXECUTE ON INFO_TABLE_TYPES_OF_TRAINING TO RL_KP_MANAGER;
GRANT EXECUTE ON INFO_TABLE_LIST_OF_EMPLOYEE TO RL_KP_MANAGER;

GRANT EXECUTE ON ADD_ROWS_TO_LIST_OF_CLIENTS TO RL_KP_MANAGER;
GRANT EXECUTE ON ADD_ROWS_TO_ABONEMENTS TO RL_KP_MANAGER;
GRANT EXECUTE ON ADD_ROWS_TO_SALE_OF_ABONEMENTS TO RL_KP_MANAGER;
GRANT EXECUTE ON ADD_ROWS_TO_INFO_COMPLEXES TO RL_KP_MANAGER;
GRANT EXECUTE ON ADD_ROWS_TO_VISIT_RECORD TO RL_KP_MANAGER;
GRANT EXECUTE ON ADD_ROWS_TO_TIME_TABLE TO RL_KP_MANAGER;
GRANT EXECUTE ON ADD_ROWS_TO_LIST_OF_SERVICES TO RL_KP_MANAGER;
GRANT EXECUTE ON ADD_ROWS_TO_TYPES_OF_TRAINING TO RL_KP_MANAGER;
GRANT EXECUTE ON ADD_ROWS_TO_LIST_OF_EMPLOYEE TO RL_KP_MANAGER;

GRANT EXECUTE ON UPDATE_LIST_OF_CLIENTS TO RL_KP_MANAGER;
GRANT EXECUTE ON UPDATE_ABONEMENTS TO RL_KP_MANAGER;
GRANT EXECUTE ON UPDATE_SALE_OF_ABONEMENTS TO RL_KP_MANAGER;
GRANT EXECUTE ON UPDATE_VISIT_RECORD TO RL_KP_MANAGER;
GRANT EXECUTE ON UPDATE_TIME_TABLE TO RL_KP_MANAGER;
GRANT EXECUTE ON UPDATE_LIST_OF_SERVICES TO RL_KP_MANAGER;
GRANT EXECUTE ON UPDATE_TYPES_OF_TRAINING TO RL_KP_MANAGER;
GRANT EXECUTE ON UPDATE_LIST_OF_EMPLOYEE TO RL_KP_MANAGER;

GRANT EXECUTE ON Roles_MANAGER_PACKAGE TO KP_MANAGER;

DROP ROLE RL_KP_MANAGER;

Create Profile PF_KP_MANAGER Limit
PASSWORD_LIFE_TIME 180
SESSIONS_PER_USER 3
FAILED_LOGIN_ATTEMPTS 7
PASSWORD_LOCK_TIME 1
PASSWORD_REUSE_TIME 10
PASSWORD_GRACE_TIME DEFAULT
CONNECT_TIME 180
IDLE_TIME 30

DROP PROFILE PF_KP_MANAGER CASCADE;

CREATE USER KP_MANAGER IDENTIFIED BY LexaDanik510
DEFAULT TABLESPACE TS_KP QUOTA UNLIMITED ON TS_KP
TEMPORARY TABLESPACE TS_KP_TEMP
PROFILE PF_KP_MANAGER
ACCOUNT UNLOCK

DROP USER KP_MANAGER CASCADE;

GRANT RL_KP_MANAGER TO KP_MANAGER;



CREATE ROLE RL_KP_ADMINISTRATOR;

GRANT CREATE SESSION TO RL_KP_ADMINISTRATOR;
GRANT ALTER ON LIST_OF_CLIENTS TO RL_KP_ADMINISTRATOR;
GRANT ALTER ON ABONEMENTS TO RL_KP_ADMINISTRATOR;
GRANT ALTER ON SALE_OF_ABONEMENTS TO RL_KP_ADMINISTRATOR;
GRANT ALTER ON INFO_COMPLEXES TO RL_KP_ADMINISTRATOR;
GRANT ALTER ON VISIT_RECORD TO RL_KP_ADMINISTRATOR;
GRANT ALTER ON TIME_TABLE TO RL_KP_ADMINISTRATOR;
GRANT ALTER ON LIST_OF_SERVICES TO RL_KP_ADMINISTRATOR;
GRANT ALTER ON TYPES_OF_TRAINING TO RL_KP_ADMINISTRATOR;
GRANT ALTER ON LIST_OF_EMPLOYEE TO RL_KP_ADMINISTRATOR;

GRANT EXECUTE ON INFO_TABLE_ABONEMENTS TO RL_KP_ADMINISTRATOR;
GRANT EXECUTE ON INFO_TABLE_COMPLEXES TO RL_KP_ADMINISTRATOR;
GRANT EXECUTE ON INFO_TABLE_LIST_OF_SERVICES TO RL_KP_ADMINISTRATOR;
GRANT EXECUTE ON INFO_TABLE_TYPES_OF_TRAINING TO RL_KP_ADMINISTRATOR;
GRANT EXECUTE ON ADD_ROWS_TO_LIST_OF_CLIENTS TO RL_KP_ADMINISTRATOR;
GRANT EXECUTE ON ADD_ROWS_TO_SALE_OF_ABONEMENTS TO RL_KP_ADMINISTRATOR;

GRANT EXECUTE ON Roles_MANAGER_PACKAGE TO KP_ADMINISTRATOR;


DROP ROLE RL_KP_ADMINISTRATOR;

Create Profile PF_KP_ADMINISTRATOR Limit
PASSWORD_LIFE_TIME 180
SESSIONS_PER_USER 3
FAILED_LOGIN_ATTEMPTS 7
PASSWORD_LOCK_TIME 1
PASSWORD_REUSE_TIME 10
PASSWORD_GRACE_TIME DEFAULT
CONNECT_TIME 180
IDLE_TIME 30

DROP PROFILE PF_KP_ADMINISTRATOR CASCADE;

CREATE USER KP_ADMINISTRATOR IDENTIFIED BY LexaDanik510
DEFAULT TABLESPACE TS_KP QUOTA UNLIMITED ON TS_KP
TEMPORARY TABLESPACE TS_KP_TEMP
PROFILE PF_KP_ADMINISTRATOR
ACCOUNT UNLOCK

DROP USER KP_ADMINISTRATOR CASCADE;

GRANT RL_KP_ADMINISTRATOR TO KP_ADMINISTRATOR;