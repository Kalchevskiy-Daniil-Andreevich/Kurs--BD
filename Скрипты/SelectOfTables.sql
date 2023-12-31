SELECT /*+MONITOR*/ * FROM LISOFCLI;

select * from table(dbms_xplan.display_cursor(sql_id=>'7dn5dyj9cw7pw', format=>'ALLSTATS LAST'));

SELECT /*+MONITOR*/ COUNT(*) FROM LISOFCLI;

SELECT /*+MONITOR*/ * FROM ABONM;

select * from table(dbms_xplan.display_cursor(sql_id=>'7dn5dyj9cw7pw', format=>'ALLSTATS LAST'));

SELECT /*+MONITOR*/ COUNT(*) FROM ABONM;

SELECT /*+MONITOR*/ * FROM SALOFABONM;

select * from table(dbms_xplan.display_cursor(sql_id=>'avvmh715pf827', format=>'ALLSTATS LAST'));

SELECT /*+MONITOR*/ COUNT(*) FROM SALOFABONM;

SELECT /*+MONITOR*/ * FROM INFCOMPL;

select * from table(dbms_xplan.display_cursor(sql_id=>'37ba6nwgkpx93', format=>'ALLSTATS LAST'));

SELECT /*+MONITOR*/ COUNT(*) FROM INFCOMPL;

SELECT /*+MONITOR*/ * FROM VISREC;

select * from table(dbms_xplan.display_cursor(sql_id=>'gn05zjkwnsuq2', format=>'ALLSTATS LAST'));

SELECT /*+MONITOR*/ COUNT(*) FROM VISREC;

SELECT /*+MONITOR*/ * FROM TIMTAB;

select * from table(dbms_xplan.display_cursor(sql_id=>'7s4h986jj0s2j', format=>'ALLSTATS LAST'));

SELECT /*+MONITOR*/ COUNT(*) FROM TIMTAB;

SELECT /*+MONITOR*/ * FROM LISOFSERV;

select * from table(dbms_xplan.display_cursor(sql_id=>'fmjwnduvykvn5', format=>'ALLSTATS LAST'));

SELECT /*+MONITOR*/ COUNT(*) FROM LISOFSERV;

SELECT /*+MONITOR*/ * FROM TYPOFTRA;

select * from table(dbms_xplan.display_cursor(sql_id=>'6qtxbm9k6ckqz', format=>'ALLSTATS LAST'));

SELECT /*+MONITOR*/ COUNT(*) FROM TYPOFTRA;

SELECT /*+MONITOR*/ * FROM LISOFEMP;

select * from table(dbms_xplan.display_cursor(sql_id=>'0csmcx7abybnc', format=>'ALLSTATS LAST'));

SELECT /*+MONITOR*/ COUNT(*) FROM LISOFEMP;



SELECT /*+MONITOR*/ * FROM LIST_OF_CLIENTS_IMPORT;
DELETE FROM LIST_OF_CLIENTS_IMPORT;

SELECT /*+MONITOR*/ * FROM ABONEMENTS_IMPORT;
DELETE FROM ABONEMENTS_IMPORT;

SELECT /*+MONITOR*/ * FROM SALE_OF_ABONEMENTS_IMPORT;
DELETE FROM SALE_OF_ABONEMENTS_IMPORT;

SELECT /*+MONITOR*/ * FROM INFO_COMPLEXES_IMPORT;
DELETE FROM INFO_COMPLEXES_IMPORT;

SELECT /*+MONITOR*/ * FROM TIME_TABLE_IMPORT;
DELETE FROM TIME_TABLE_IMPORT;

SELECT /*+MONITOR*/ * FROM LIST_OF_SERVICES_IMPORT;
DELETE FROM LIST_OF_SERVICES_IMPORT;

SELECT /*+MONITOR*/ * FROM TYPES_OF_TRAINING_IMPORT;
DELETE FROM TYPES_OF_TRAINING_IMPORT;

SELECT /*+MONITOR*/ * FROM LIST_OF_EMPLOYEE_IMPORT;
DELETE FROM LIST_OF_EMPLOYEE_IMPORT;



SELECT * FROM KP_OWNER.LISOFCLI_VIEW;
SELECT * FROM KP_OWNER.ABONM_VIEW;
SELECT * FROM KP_OWNER.SALOFABONM_VIEW;
SELECT * FROM KP_OWNER.INFCOMPL_VIEW;
SELECT * FROM KP_OWNER.VISREC_VIEW;
SELECT * FROM KP_OWNER.TIMTAB_VIEW;
SELECT * FROM KP_OWNER.LISOFSERV_VIEW;
SELECT * FROM KP_OWNER.TYPOFTRA_VIEW;
SELECT * FROM KP_OWNER.LISOFEMP_VIEW;
