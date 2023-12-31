CREATE OR REPLACE PACKAGE Roles_MANAGER_PACKAGE
IS
    PROCEDURE INFO_TABLE_LIST_OF_CLIENTS;
    PROCEDURE INFO_TABLE_ABONEMENTS;
    PROCEDURE INFO_TABLE_SALE_OF_ABONEMENTS;
    PROCEDURE INFO_TABLE_COMPLEXES;
    PROCEDURE INFO_TABLE_VISIT_RECORD;
    PROCEDURE INFO_TABLE_TIME_TABLE;
    PROCEDURE INFO_TABLE_LIST_OF_SERVICES;
    PROCEDURE INFO_TABLE_TYPES_OF_TRAINING;
    PROCEDURE INFO_TABLE_LIST_OF_EMPLOYEE;
    
    PROCEDURE ADD_ROWS_TO_LIST_OF_CLIENTS(pSURNAME_CLIENT NVARCHAR2, pNAME_CLIENT NVARCHAR2, pPATRONYMIC_CLIENT NVARCHAR2, pAGE_CLIENT NUMBER, pADDRESS_CLIENT NVARCHAR2, pTELEPHONE_CLIENT NVARCHAR2, pPASSPORT_CLIENT NVARCHAR2);
    PROCEDURE ADD_ROWS_TO_ABONEMENTS(pTYPE_OF_TRAINING NVARCHAR2, pTYPE_OF_SERVICE NVARCHAR2, pPRICE NUMBER, pAMOUNT_OF_VISITS NUMBER, pAMOUNT_OF_DAYS NUMBER, pAMOUNT_OF_MONTHS NUMBER);
    PROCEDURE ADD_ROWS_TO_SALE_OF_ABONEMENTS(pIDCLIENT NUMBER, pIDABONEMENT NUMBER, pDATABEGIN DATE, pDATAEND DATE);
    PROCEDURE ADD_ROWS_TO_INFO_COMPLEXES(pNAME_COMPLEXES NVARCHAR2, pADDRESS_COMPLEXES NVARCHAR2, pCAPACITY_COMPLEXES NUMBER);
    PROCEDURE ADD_ROWS_TO_VISIT_RECORD(pID_SALE NUMBER, pNUMBER_RECORD NUMBER, pCOMPLEXES_ID NUMBER);
    PROCEDURE ADD_ROWS_TO_TIME_TABLE(pDATA_TIME_TABLE DATE, pTIME_BEGIN NVARCHAR2, pTIME_END NVARCHAR2, pID_EMPLOYEE NUMBER, pID_SERVICES NUMBER, pID_TRAINING NUMBER);
    PROCEDURE ADD_ROWS_TO_LIST_OF_SERVICES(pTYPES_OF_SERVICES NVARCHAR2);
    PROCEDURE ADD_ROWS_TO_TYPES_OF_TRAINING(pTYPES_OF_TRAINING NVARCHAR2);
    PROCEDURE ADD_ROWS_TO_LIST_OF_EMPLOYEE(pSURNAME_EMPLOYEE NVARCHAR2, pNAME_EMPLOYEE NVARCHAR2, pPATRONYMIC_EMPLOYEE NVARCHAR2, pTELEPHONE_EMPLOYEE NVARCHAR2, pADDRESS_EMPLOYEE NVARCHAR2, pSALARY_EMPLOYEE NUMBER);
    
    PROCEDURE UPDATE_LIST_OF_CLIENTS(pID_CLIENT NUMBER, pSURNAME_CLIENT NVARCHAR2, pNAME_CLIENT NVARCHAR2, pPATRONYMIC_CLIENT NVARCHAR2, pAGE_CLIENT NUMBER, pADDRESS_CLIENT NVARCHAR2, pTELEPHONE_CLIENT NVARCHAR2, pPASSPORT_CLIENT NVARCHAR2);
    PROCEDURE UPDATE_ABONEMENTS(pID_ABONEMENT NUMBER, p_TYPE_OF_TRAINING NVARCHAR2, p_TYPE_OF_SERVICE NVARCHAR2, pPRICE NUMBER, pAMOUNT_OF_VISITS NUMBER, p_AMOUNT_OF_DAYS NUMBER, p_AMOUNT_OF_MONTHS NUMBER);
    PROCEDURE UPDATE_SALE_OF_ABONEMENTS(pID_SALE NUMBER, pID_CLIENT NUMBER, pID_ABONEMENT NUMBER, pDATA_BEGIN DATE, pDATA_END DATE);
    PROCEDURE UPDATE_INFO_COMPLEXES(pID_COMPLEXES NUMBER, pNAME_COMPLEXES NVARCHAR2, pADDRESS_COMPLEXES NVARCHAR2, pCAPACITY_COMPLEXES NUMBER);
    PROCEDURE UPDATE_VISIT_RECORD(pNUMBER_OF_VISITS NUMBER, pID_SALE NUMBER, pNUMBER_RECORD NUMBER, pID_COMPLEXES NUMBER);
    PROCEDURE UPDATE_TIME_TABLE(pNUMBER_RECORD NUMBER, pDATA_TIME_TABLE DATE, pTIME_BEGIN NVARCHAR2, pTIME_END NVARCHAR2, pID_EMPLOYEE NUMBER, pID_SERVICES NUMBER, pID_TRAINING NUMBER);
    PROCEDURE UPDATE_LIST_OF_SERVICES(pID_SERVICES NUMBER, pTYPES_OF_SERVICES NVARCHAR2);
    PROCEDURE UPDATE_TYPES_OF_TRAINING(pID_TRAINING NUMBER, pTYPES_OF_TRAINING NVARCHAR2);
    PROCEDURE UPDATE_LIST_OF_EMPLOYEE(pID_EMPLOYEE NUMBER, pSURNAME_EMPLOYEE NVARCHAR2, pNAME_EMPLOYEE NVARCHAR2, pPATRONYMIC_EMPLOYEE NVARCHAR2, pTELEPHONE_EMPLOYEE NVARCHAR2, pADDRESS_EMPLOYEE NVARCHAR2, pSALARY_EMPLOYEE NUMBER);
END Roles_MANAGER_PACKAGE;


CREATE OR REPLACE PACKAGE BODY Roles_MANAGER_PACKAGE
IS

PROCEDURE INFO_TABLE_LIST_OF_CLIENTS
IS
    CURSOR curs_list_of_clients IS 
    SELECT ID_CLIENT, SURNAME_CLIENT, NAME_CLIENT, PATRONYMIC_CLIENT, AGE_CLIENT, ADDRESS_CLIENT, TELEPHONE_CLIENT, PASSPORT_CLIENT
    FROM LISOFCLI;
    v_id_client LISOFCLI.ID_CLIENT%type;
    v_surname_client LISOFCLI.SURNAME_CLIENT%type;
    v_name_client LISOFCLI.NAME_CLIENT%type;
    v_patronymic_client LISOFCLI.PATRONYMIC_CLIENT%type;
    v_age_client LISOFCLI.AGE_CLIENT%type;
    v_address_client LISOFCLI.ADDRESS_CLIENT%type;
    v_telephone_client LISOFCLI.TELEPHONE_CLIENT%type;
    v_passport_client LISOFCLI.PASSPORT_CLIENT%type;
BEGIN
    OPEN curs_list_of_clients;
    DBMS_OUTPUT.PUT_LINE('ROWCOUNT = ' || curs_list_of_clients%rowcount);
    LOOP
        FETCH curs_list_of_clients INTO v_id_client, v_surname_client, v_name_client, v_patronymic_client, v_age_client, v_address_client, v_telephone_client, 
        v_passport_client;
        EXIT WHEN curs_list_of_clients%notfound;
        DBMS_OUTPUT.PUT_LINE(' '||curs_list_of_clients%rowcount|| ' ' || v_id_client || ' ' || v_surname_client || ' ' ||v_name_client || ' ' ||v_patronymic_client || ' '
        || v_age_client || ' ' || v_address_client || ' ' ||v_telephone_client || ' ' ||v_passport_client);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('ROWCOUNT = ' || curs_list_of_clients%rowcount);
    CLOSE curs_list_of_clients;
    EXCEPTION
        WHEN OTHERS
            THEN DBMS_OUTPUT.PUT_LINE('CODE ERROR: '||SQLCODE||' MESSAGE: '||SQLERRM);
END INFO_TABLE_LIST_OF_CLIENTS;


PROCEDURE INFO_TABLE_ABONEMENTS
IS
    v_id_abonement ABONM.ID_ABONEMENT%type;
    v_type_of_training ABONM.TYPE_OF_TRAINING%type;
    v_type_of_service ABONM.TYPE_OF_SERVICE%type;
    v_price ABONM.PRICE%type;
    v_amount_of_visits ABONM.AMOUNT_OF_VISITS%type;
    v_amount_of_days ABONM.AMOUNT_OF_DAYS%type;
    v_amount_of_months ABONM.AMOUNT_OF_MONTHS%type;
    CURSOR curs_abonements IS
    SELECT ID_ABONEMENT, TYPE_OF_TRAINING, TYPE_OF_SERVICE, PRICE, AMOUNT_OF_VISITS, AMOUNT_OF_DAYS, AMOUNT_OF_MONTHS FROM ABONM;
BEGIN
    OPEN curs_abonements;
    DBMS_OUTPUT.PUT_LINE('ROWCOUNT = ' || curs_abonements%rowcount);
    LOOP
        FETCH curs_abonements INTO v_id_abonement, v_type_of_training, v_type_of_service, v_price, v_amount_of_visits, v_amount_of_days, v_amount_of_months;
        EXIT WHEN curs_abonements%notfound;
        DBMS_OUTPUT.PUT_LINE(' '||curs_abonements%rowcount|| ' ' || v_id_abonement || ' ' || v_type_of_training || ' ' ||v_type_of_service || ' ' ||v_price || ' '
        || v_amount_of_visits || ' ' || v_amount_of_days || ' ' ||v_amount_of_months);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('ROWCOUNT = ' || curs_abonements%rowcount);
    CLOSE curs_abonements;
    EXCEPTION
        WHEN OTHERS
            THEN DBMS_OUTPUT.PUT_LINE('CODE ERROR: '||SQLCODE||' MESSAGE: '||SQLERRM);
END INFO_TABLE_ABONEMENTS;


PROCEDURE INFO_TABLE_SALE_OF_ABONEMENTS
IS
    v_id_sale SALOFABONM.ID_SALE%type;
    v_id_client SALOFABONM.ID_CLIENT%type;
    v_id_abonement SALOFABONM.ID_ABONEMENT%type;
    v_data_begin SALOFABONM.DATA_BEGIN%type;
    v_data_end SALOFABONM.DATA_END%type;
    CURSOR curs_sale_of_abonements IS
    SELECT ID_SALE, ID_CLIENT, ID_ABONEMENT, DATA_BEGIN, DATA_END FROM SALOFABONM;
BEGIN
    OPEN curs_sale_of_abonements;
    DBMS_OUTPUT.PUT_LINE('ROWCOUNT = ' || curs_sale_of_abonements%rowcount);
    LOOP
        FETCH curs_sale_of_abonements INTO v_id_sale, v_id_client, v_id_abonement, v_data_begin, v_data_end;
        EXIT WHEN curs_sale_of_abonements%notfound;
        DBMS_OUTPUT.PUT_LINE(' '||curs_sale_of_abonements%rowcount|| ' ' || v_id_sale || ' ' || v_id_client || ' ' ||v_id_abonement || ' ' ||v_data_begin || ' '
        || v_data_end);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('ROWCOUNT = ' || curs_sale_of_abonements%rowcount);
    CLOSE curs_sale_of_abonements;
    EXCEPTION
        WHEN OTHERS
            THEN DBMS_OUTPUT.PUT_LINE('CODE ERROR: '||SQLCODE||' MESSAGE: '||SQLERRM);
END INFO_TABLE_SALE_OF_ABONEMENTS;


PROCEDURE INFO_TABLE_COMPLEXES
IS
    v_name_complexes INFCOMPL.NAME_COMPLEXES%type;
    v_address_complexes INFCOMPL.ADDRESS_COMPLEXES%type;
    v_capacity_complexes INFCOMPL.CAPACITY_COMPLEXES%type;
    CURSOR curs_info_complexes IS
    SELECT NAME_COMPLEXES, ADDRESS_COMPLEXES, CAPACITY_COMPLEXES FROM INFCOMPL;
BEGIN
    OPEN curs_info_complexes;
    DBMS_OUTPUT.PUT_LINE('ROWCOUNT = ' || curs_info_complexes%rowcount);
    LOOP
        FETCH curs_info_complexes INTO v_name_complexes, v_address_complexes, v_capacity_complexes;
        EXIT WHEN curs_info_complexes%notfound;
        DBMS_OUTPUT.PUT_LINE(' '||curs_info_complexes%rowcount|| ' ' || v_name_complexes || ' ' || v_address_complexes || ' ' || v_capacity_complexes);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('ROWCOUNT = ' || curs_info_complexes%rowcount);
    CLOSE curs_info_complexes;
    EXCEPTION
        WHEN OTHERS
            THEN DBMS_OUTPUT.PUT_LINE('CODE ERROR: '||SQLCODE||' MESSAGE: '||SQLERRM);
END INFO_TABLE_COMPLEXES;


PROCEDURE INFO_TABLE_VISIT_RECORD
IS
    v_id_card VISREC.ID_SALE%type;
    v_number_record VISREC.NUMBER_RECORD%type;
    v_id_complexes VISREC.ID_COMPLEXES%type;
    CURSOR curs_visit_record IS
    SELECT ID_CARD, NUMBER_RECORD, ID_COMPLEXES FROM VISREC;
BEGIN
    OPEN curs_visit_record;
    DBMS_OUTPUT.PUT_LINE('ROWCOUNT = ' || curs_visit_record%rowcount);
    LOOP
        FETCH curs_visit_record INTO v_id_card, v_number_record, v_id_complexes;
        EXIT WHEN curs_visit_record%notfound;
        DBMS_OUTPUT.PUT_LINE(' '||curs_visit_record%rowcount|| ' ' || v_id_card || ' ' || v_number_record || ' ' || v_id_complexes);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('ROWCOUNT = ' || curs_visit_record%rowcount);
    CLOSE curs_visit_record;
    EXCEPTION
        WHEN OTHERS
            THEN DBMS_OUTPUT.PUT_LINE('CODE ERROR: '||SQLCODE||' MESSAGE: '||SQLERRM);
END INFO_TABLE_VISIT_RECORD;


PROCEDURE INFO_TABLE_TIME_TABLE
IS
    v_data TIMTAB.DATA_TIME_TABLE%type;
    v_time_begin TIMTAB.TIME_BEGIN%type;
    v_time_end TIMTAB.TIME_END%type;
    v_id_employee TIMTAB.ID_EMPLOYEE%type;
    v_id_services TIMTAB.ID_SERVICES%type;
    v_id_training TIMTAB.ID_TRAINING%type;
    CURSOR curs_time_table IS
    SELECT DATA_TIME_TABLE, TIME_BEGIN, TIME_END, ID_EMPLOYEE, ID_SERVICES, ID_TRAINING FROM TIMTAB;
BEGIN
    OPEN curs_time_table;
    DBMS_OUTPUT.PUT_LINE('ROWCOUNT = ' || curs_time_table%rowcount);
    LOOP
        FETCH curs_time_table INTO v_data, v_time_begin, v_time_end, v_id_employee, v_id_services, v_id_training;
        EXIT WHEN curs_time_table%notfound;
        DBMS_OUTPUT.PUT_LINE(' '||curs_time_table%rowcount|| ' ' || v_data || ' ' || v_time_begin || ' ' || v_time_end || ' ' || v_id_employee || ' ' || v_id_services
        || ' ' || v_id_training);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('ROWCOUNT = ' || curs_time_table%rowcount);
    CLOSE curs_time_table;
    EXCEPTION
        WHEN OTHERS
            THEN DBMS_OUTPUT.PUT_LINE('CODE ERROR: '||SQLCODE||' MESSAGE: '||SQLERRM);
END INFO_TABLE_TIME_TABLE;


PROCEDURE INFO_TABLE_LIST_OF_SERVICES
IS
    v_name_services LISOFSERV.TYPES_OF_SERVICES%type;
    CURSOR curs_list_of_services IS
    SELECT TYPES_OF_SERVICES FROM LISOFSERV;
BEGIN
    OPEN curs_list_of_services;
    DBMS_OUTPUT.PUT_LINE('ROWCOUNT = ' || curs_list_of_services%rowcount);
    LOOP
        FETCH curs_list_of_services INTO v_name_services;
        EXIT WHEN curs_list_of_services%notfound;
        DBMS_OUTPUT.PUT_LINE(' '||curs_list_of_services%rowcount|| ' ' || v_name_services);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('ROWCOUNT = ' || curs_list_of_services%rowcount);
    CLOSE curs_list_of_services;
    EXCEPTION
        WHEN OTHERS
            THEN DBMS_OUTPUT.PUT_LINE('CODE ERROR: '||SQLCODE||' MESSAGE: '||SQLERRM);
END INFO_TABLE_LIST_OF_SERVICES;


PROCEDURE INFO_TABLE_TYPES_OF_TRAINING
IS
    v_types_of_training TYPOFTRA.TYPES_OF_TRAINING%type;
    CURSOR curs_types_of_training IS
    SELECT TYPES_OF_TRAINING FROM TYPOFTRA;
BEGIN
    OPEN curs_types_of_training;
    DBMS_OUTPUT.PUT_LINE('ROWCOUNT = ' || curs_types_of_training%rowcount);
    LOOP
        FETCH curs_types_of_training INTO v_types_of_training;
        EXIT WHEN curs_types_of_training%notfound;
        DBMS_OUTPUT.PUT_LINE(' '||curs_types_of_training%rowcount|| ' ' || v_types_of_training);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('ROWCOUNT = ' || curs_types_of_training%rowcount);
    CLOSE curs_types_of_training;
    EXCEPTION
        WHEN OTHERS
            THEN DBMS_OUTPUT.PUT_LINE('CODE ERROR: '||SQLCODE||' MESSAGE: '||SQLERRM);
END INFO_TABLE_TYPES_OF_TRAINING;


PROCEDURE INFO_TABLE_LIST_OF_EMPLOYEE
IS
    v_surname_employee LISOFEMP.SURNAME_EMPLOYEE%type;
    v_name_employee LISOFEMP.NAME_EMPLOYEE%type;
    v_patronymic_employee LISOFEMP.PATRONYMIC_EMPLOYEE%type;
    v_telephone_employee LISOFEMP.TELEPHONE_EMPLOYEE%type;
    v_address_employee LISOFEMP.ADDRESS_EMPLOYEE%type;
    v_salary_employee LISOFEMP.SALARY_EMPLOYEE%type;
    CURSOR curs_list_of_employee IS
    SELECT SURNAME_EMPLOYEE, NAME_EMPLOYEE, PATRONYMIC_EMPLOYEE, TELEPHONE_EMPLOYEE, ADDRESS_EMPLOYEE, SALARY_EMPLOYEE FROM LISOFEMP;
BEGIN
    OPEN curs_list_of_employee;
    DBMS_OUTPUT.PUT_LINE('ROWCOUNT = ' || curs_list_of_employee%rowcount);
    LOOP
        FETCH curs_list_of_employee INTO v_surname_employee, v_name_employee, v_patronymic_employee, v_telephone_employee, v_address_employee, v_salary_employee;
        EXIT WHEN curs_list_of_employee%notfound;
        DBMS_OUTPUT.PUT_LINE(' '||curs_list_of_employee%rowcount|| ' ' || v_surname_employee || ' ' || v_name_employee || ' ' || v_patronymic_employee || ' ' ||
        v_telephone_employee || ' ' || v_address_employee|| ' ' || v_salary_employee);
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('ROWCOUNT = ' || curs_list_of_employee%rowcount);
    CLOSE curs_list_of_employee;
    EXCEPTION
        WHEN OTHERS
            THEN DBMS_OUTPUT.PUT_LINE('CODE ERROR: '||SQLCODE||' MESSAGE: '||SQLERRM);
END INFO_TABLE_LIST_OF_EMPLOYEE;



PROCEDURE ADD_ROWS_TO_LIST_OF_CLIENTS(pSURNAME_CLIENT NVARCHAR2, pNAME_CLIENT NVARCHAR2, pPATRONYMIC_CLIENT NVARCHAR2, pAGE_CLIENT NUMBER, pADDRESS_CLIENT NVARCHAR2, pTELEPHONE_CLIENT NVARCHAR2, pPASSPORT_CLIENT NVARCHAR2)
IS
BEGIN
        INSERT INTO LISOFCLI(SURNAME_CLIENT, NAME_CLIENT, PATRONYMIC_CLIENT, AGE_CLIENT, ADDRESS_CLIENT, TELEPHONE_CLIENT, PASSPORT_CLIENT)
        VALUES(pSURNAME_CLIENT, pNAME_CLIENT, pPATRONYMIC_CLIENT, pAGE_CLIENT, pADDRESS_CLIENT, pTELEPHONE_CLIENT, pPASSPORT_CLIENT);
        EXCEPTION
            WHEN OTHERS
                THEN DBMS_OUTPUT.PUT_LINE('CODE ERROR: '||SQLCODE||' MESSAGE: '||SQLERRM);
END ADD_ROWS_TO_LIST_OF_CLIENTS;


PROCEDURE ADD_ROWS_TO_ABONEMENTS(pTYPE_OF_TRAINING NVARCHAR2, pTYPE_OF_SERVICE NVARCHAR2, pPRICE NUMBER, pAMOUNT_OF_VISITS NUMBER, pAMOUNT_OF_DAYS NUMBER, pAMOUNT_OF_MONTHS NUMBER)
IS
BEGIN
        INSERT INTO ABONM(TYPE_OF_TRAINING, TYPE_OF_SERVICE, PRICE, AMOUNT_OF_VISITS, AMOUNT_OF_DAYS, AMOUNT_OF_MONTHS)
        VALUES(pTYPE_OF_TRAINING, pTYPE_OF_SERVICE, pPRICE, pAMOUNT_OF_VISITS, pAMOUNT_OF_DAYS, pAMOUNT_OF_MONTHS);
END ADD_ROWS_TO_ABONEMENTS;


PROCEDURE ADD_ROWS_TO_SALE_OF_ABONEMENTS(pIDCLIENT NUMBER, pIDABONEMENT NUMBER, pDATABEGIN DATE, pDATAEND DATE)
IS
BEGIN
    INSERT INTO SALOFABONM(ID_CLIENT, ID_ABONEMENT, DATA_BEGIN, DATA_END)
    VALUES (pIDCLIENT, pIDABONEMENT, pDATABEGIN, pDATAEND);
END ADD_ROWS_TO_SALE_OF_ABONEMENTS;


PROCEDURE ADD_ROWS_TO_INFO_COMPLEXES(pNAME_COMPLEXES NVARCHAR2, pADDRESS_COMPLEXES NVARCHAR2, pCAPACITY_COMPLEXES NUMBER)
IS
BEGIN
    INSERT INTO INFCOMPL(NAME_COMPLEXES, ADDRESS_COMPLEXES, CAPACITY_COMPLEXES)
    VALUES(pNAME_COMPLEXES, pADDRESS_COMPLEXES, pCAPACITY_COMPLEXES);
END ADD_ROWS_TO_INFO_COMPLEXES;


PROCEDURE ADD_ROWS_TO_VISIT_RECORD(pID_SALE NUMBER, pNUMBER_RECORD NUMBER, pCOMPLEXES_ID NUMBER)
IS
BEGIN
    INSERT INTO VISREC(ID_SALE, NUMBER_RECORD, ID_COMPLEXES)
    VALUES (pID_SALE, pNUMBER_RECORD, pCOMPLEXES_ID);
END ADD_ROWS_TO_VISIT_RECORD;


PROCEDURE ADD_ROWS_TO_TIME_TABLE(pDATA_TIME_TABLE DATE, pTIME_BEGIN NVARCHAR2, pTIME_END NVARCHAR2, pID_EMPLOYEE NUMBER, pID_SERVICES NUMBER, pID_TRAINING NUMBER)
IS
BEGIN
    INSERT INTO TIMTAB(DATA_TIME_TABLE, TIME_BEGIN, TIME_END, ID_EMPLOYEE, ID_SERVICES, ID_TRAINING)
    VALUES (pDATA_TIME_TABLE, pTIME_BEGIN, pTIME_END, pID_EMPLOYEE, pID_SERVICES, pID_TRAINING);
END ADD_ROWS_TO_TIME_TABLE;


PROCEDURE ADD_ROWS_TO_LIST_OF_SERVICES(pTYPES_OF_SERVICES NVARCHAR2)
IS
BEGIN
    INSERT INTO LISOFSERV(TYPES_OF_SERVICES)
    VALUES(pTYPES_OF_SERVICES);
END ADD_ROWS_TO_LIST_OF_SERVICES;


PROCEDURE ADD_ROWS_TO_TYPES_OF_TRAINING(pTYPES_OF_TRAINING NVARCHAR2)
IS
BEGIN
    INSERT INTO TYPOFTRA(TYPES_OF_TRAINING)
    VALUES(pTYPES_OF_TRAINING);
END ADD_ROWS_TO_TYPES_OF_TRAINING;


PROCEDURE ADD_ROWS_TO_LIST_OF_EMPLOYEE(pSURNAME_EMPLOYEE NVARCHAR2, pNAME_EMPLOYEE NVARCHAR2, pPATRONYMIC_EMPLOYEE NVARCHAR2, pTELEPHONE_EMPLOYEE NVARCHAR2, pADDRESS_EMPLOYEE NVARCHAR2, pSALARY_EMPLOYEE NUMBER)
IS
BEGIN
    INSERT INTO LISOFEMP(SURNAME_EMPLOYEE, NAME_EMPLOYEE, PATRONYMIC_EMPLOYEE, TELEPHONE_EMPLOYEE, ADDRESS_EMPLOYEE, SALARY_EMPLOYEE)
    VALUES(pSURNAME_EMPLOYEE, pNAME_EMPLOYEE, pPATRONYMIC_EMPLOYEE, pTELEPHONE_EMPLOYEE, pADDRESS_EMPLOYEE, pSALARY_EMPLOYEE);
END ADD_ROWS_TO_LIST_OF_EMPLOYEE;



PROCEDURE UPDATE_LIST_OF_CLIENTS(pID_CLIENT NUMBER, pSURNAME_CLIENT NVARCHAR2, pNAME_CLIENT NVARCHAR2, pPATRONYMIC_CLIENT NVARCHAR2, pAGE_CLIENT NUMBER, pADDRESS_CLIENT NVARCHAR2, pTELEPHONE_CLIENT NVARCHAR2, pPASSPORT_CLIENT NVARCHAR2)
IS
BEGIN
    UPDATE LIST_OF_CLIENTS
    SET SURNAME_CLIENT = pSURNAME_CLIENT,
    NAME_CLIENT = pNAME_CLIENT,
    PATRONYMIC_CLIENT = pPATRONYMIC_CLIENT,
    AGE_CLIENT = pAGE_CLIENT,
    ADDRESS_CLIENT = pADDRESS_CLIENT,
    TELEPHONE_CLIENT = pTELEPHONE_CLIENT,
    PASSPORT_CLIENT = pPASSPORT_CLIENT
    WHERE ID_CLIENT = pID_CLIENT;
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('Error updating LIST_OF_CLIENTS: ' || SQLERRM);
END UPDATE_LIST_OF_CLIENTS;


PROCEDURE UPDATE_ABONEMENTS(pID_ABONEMENT NUMBER, p_TYPE_OF_TRAINING NVARCHAR2, p_TYPE_OF_SERVICE NVARCHAR2, pPRICE NUMBER, pAMOUNT_OF_VISITS NUMBER, p_AMOUNT_OF_DAYS NUMBER, p_AMOUNT_OF_MONTHS NUMBER)
IS
BEGIN
    UPDATE ABONEMENTS
    SET TYPE_OF_TRAINING = p_TYPE_OF_TRAINING,
    TYPE_OF_SERVICE = p_TYPE_OF_SERVICE,
    PRICE = pPRICE,
    AMOUNT_OF_VISITS = pAMOUNT_OF_VISITS,
    AMOUNT_OF_DAYS = p_AMOUNT_OF_DAYS,
    AMOUNT_OF_MONTHS = p_AMOUNT_OF_MONTHS
    WHERE ID_ABONEMENT = pID_ABONEMENT;
    COMMIT;
       EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('Error updating ABONEMENTS: ' || SQLERRM);
END UPDATE_ABONEMENTS;


PROCEDURE UPDATE_SALE_OF_ABONEMENTS(pID_SALE NUMBER, pID_CLIENT NUMBER, pID_ABONEMENT NUMBER, pDATA_BEGIN DATE, pDATA_END DATE)
IS
BEGIN
    UPDATE SALE_OF_ABONEMENTS
    SET ID_CLIENT = pID_CLIENT,
    ID_ABONEMENT = pID_ABONEMENT,
    DATA_BEGIN = pDATA_BEGIN,
    DATA_END = pDATA_END
    WHERE ID_SALE = pID_SALE;
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('Error updating SALE_OF_ABONEMENTS: ' || SQLERRM);
END UPDATE_SALE_OF_ABONEMENTS;


PROCEDURE UPDATE_INFO_COMPLEXES(pID_COMPLEXES NUMBER, pNAME_COMPLEXES NVARCHAR2, pADDRESS_COMPLEXES NVARCHAR2, pCAPACITY_COMPLEXES NUMBER)
IS
BEGIN
    UPDATE INFO_COMPLEXES
    SET NAME_COMPLEXES = pNAME_COMPLEXES,
    ADDRESS_COMPLEXES = pADDRESS_COMPLEXES,
    CAPACITY_COMPLEXES = pCAPACITY_COMPLEXES
    WHERE ID_COMPLEXES = pID_COMPLEXES;
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('Error updating INFO_COMPLEXES: ' || SQLERRM);
END UPDATE_INFO_COMPLEXES;


PROCEDURE UPDATE_VISIT_RECORD(pNUMBER_OF_VISITS NUMBER, pID_SALE NUMBER, pNUMBER_RECORD NUMBER, pID_COMPLEXES NUMBER)
IS
BEGIN
    UPDATE VISIT_RECORD
    SET ID_SALE = pID_SALE,
    NUMBER_RECORD = pNUMBER_RECORD,
    ID_COMPLEXES = pID_COMPLEXES
    WHERE NUMBER_OF_VISITS = pNUMBER_OF_VISITS;
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('Error updating VISIT_RECORD: ' || SQLERRM);
END UPDATE_VISIT_RECORD;


PROCEDURE UPDATE_TIME_TABLE(pNUMBER_RECORD NUMBER, pDATA_TIME_TABLE DATE, pTIME_BEGIN NVARCHAR2, pTIME_END NVARCHAR2, pID_EMPLOYEE NUMBER, pID_SERVICES NUMBER, pID_TRAINING NUMBER)
IS
BEGIN
    UPDATE TIME_TABLE
    SET DATA_TIME_TABLE = pDATA_TIME_TABLE,
    TIME_BEGIN = pTIME_BEGIN,
    TIME_END = pTIME_END,
    ID_EMPLOYEE = pID_EMPLOYEE,
    ID_SERVICES = pID_SERVICES,
    ID_TRAINING = pID_TRAINING
    WHERE NUMBER_RECORD = pNUMBER_RECORD;
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('Error updating TIME_TABLE: ' || SQLERRM);
END UPDATE_TIME_TABLE;


PROCEDURE UPDATE_LIST_OF_SERVICES(pID_SERVICES NUMBER, pTYPES_OF_SERVICES NVARCHAR2)
IS
BEGIN
    UPDATE LIST_OF_SERVICES
    SET ID_SERVICES = pID_SERVICES,
    TYPES_OF_SERVICES = pTYPES_OF_SERVICES
    WHERE ID_SERVICES = pID_SERVICES;
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('Error updating LIST_OF_SERVICES: ' || SQLERRM);
END UPDATE_LIST_OF_SERVICES;


PROCEDURE UPDATE_TYPES_OF_TRAINING(pID_TRAINING NUMBER, pTYPES_OF_TRAINING NVARCHAR2)
IS
BEGIN
    UPDATE TYPES_OF_TRAINING
    SET TYPES_OF_TRAINING = pTYPES_OF_TRAINING
    WHERE ID_TRAINING = pID_TRAINING;
    COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('Error updating TYPES_OF_TRAINING: ' || SQLERRM);
END UPDATE_TYPES_OF_TRAINING;


PROCEDURE UPDATE_LIST_OF_EMPLOYEE(pID_EMPLOYEE NUMBER, pSURNAME_EMPLOYEE NVARCHAR2, pNAME_EMPLOYEE NVARCHAR2, pPATRONYMIC_EMPLOYEE NVARCHAR2,
pTELEPHONE_EMPLOYEE NVARCHAR2, pADDRESS_EMPLOYEE NVARCHAR2, pSALARY_EMPLOYEE NUMBER)
IS
BEGIN
    UPDATE LIST_OF_EMPLOYEE
    SET SURNAME_EMPLOYEE = pSURNAME_EMPLOYEE,
    NAME_EMPLOYEE = pNAME_EMPLOYEE,
    PATRONYMIC_EMPLOYEE = pPATRONYMIC_EMPLOYEE,
    TELEPHONE_EMPLOYEE = pTELEPHONE_EMPLOYEE,
    ADDRESS_EMPLOYEE = pADDRESS_EMPLOYEE,
    SALARY_EMPLOYEE = pSALARY_EMPLOYEE
    WHERE ID_EMPLOYEE = pID_EMPLOYEE;
    COMMIT;
     EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
                DBMS_OUTPUT.PUT_LINE('Error updating LIST_OF_EMPLOYEE: ' || SQLERRM);
END UPDATE_LIST_OF_EMPLOYEE;

END Roles_MANAGER_PACKAGE;



BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.INFO_TABLE_LIST_OF_CLIENTS();
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.INFO_TABLE_ABONEMENTS();
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.INFO_TABLE_SALE_OF_ABONEMENTS();
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.INFO_TABLE_COMPLEXES();
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.INFO_TABLE_VISIT_RECORD();
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.INFO_TABLE_TIME_TABLE();
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.INFO_TABLE_LIST_OF_SERVICES();
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.INFO_TABLE_TYPES_OF_TRAINING();
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.INFO_TABLE_LIST_OF_EMPLOYEE();
END;



BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.ADD_ROWS_TO_LIST_OF_CLIENTS('��������', '����������', '������������', 21, '�. �������, �������� 45', '375175465633', 'AM303590');
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.ADD_ROWS_TO_ABONEMENTS('��������', '������', 2100, 19, 20, 4);
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.ADD_ROWS_TO_SALE_OF_ABONEMENTS(5180, 13653, '08.05.23', '16.09.23');
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.ADD_ROWS_TO_INFO_COMPLEXES('���� �� ���', '�. �������, ����������� 25', 35);
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.ADD_ROWS_TO_VISIT_RECORD(4900, 100, 55);
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.ADD_ROWS_TO_TIME_TABLE('26.06.23', '10:00', '12:00', 30, 95, 75);
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.ADD_ROWS_TO_LIST_OF_SERVICES('��� ���');
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.ADD_ROWS_TO_TYPES_OF_TRAINING('Poles Dance');
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.ADD_ROWS_TO_LIST_OF_EMPLOYEE('�����������', '������', '����������', '+375296704783', '�. ����, ������� 25-2', 2400);
END;



BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.UPDATE_LIST_OF_CLIENTS('��������', '����������', '������������', 21, '�. �������, �������� 45', '375175465633', 'AM303590');
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.UPDATE_ABONEMENTS(114, '��������', '������', 2100, 19, 20, 4);
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.UPDATE_SALE_OF_ABONEMENTS(220, 5180, 13653, '08.05.23', '16.09.23');
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.UPDATE_INFO_COMPLEXES(84, '���� �� ���', '�. �������, ����������� 25', 35);
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.UPDATE_VISIT_RECORD(401, 4900, 100, 55);
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.UPDATE_TIME_TABLE(1, '26.06.23', '10:00', '12:00', 30, 95, 75);
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.UPDATE_LIST_OF_SERVICES(3, '��� ���');
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.UPDATE_TYPES_OF_TRAINING(5, 'Poles Dance');
END;

BEGIN
    KP_OWNER.Roles_MANAGER_PACKAGE.UPDATE_LIST_OF_EMPLOYEE(60, '�����������', '������', '����������', '+375296704783', '�. ����, ������� 25-2', 2400);
END;