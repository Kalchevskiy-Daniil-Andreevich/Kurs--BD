CREATE OR REPLACE PACKAGE Roles_CLIENTS_PACKAGE
IS
    PROCEDURE INFO_TABLE_ABONEMENTS;
    PROCEDURE INFO_TABLE_COMPLEXES;
    PROCEDURE INFO_TABLE_LIST_OF_SERVICES;
    PROCEDURE INFO_TABLE_TYPES_OF_TRAINING;
    PROCEDURE ADD_ROWS_TO_LIST_OF_CLIENTS(pSURNAME_CLIENT NVARCHAR2, pNAME_CLIENT NVARCHAR2, pPATRONYMIC_CLIENT NVARCHAR2, pAGE_CLIENT NUMBER, pADDRESS_CLIENT NVARCHAR2, pTELEPHONE_CLIENT NVARCHAR2, pPASSPORT_CLIENT NVARCHAR2);
    PROCEDURE ADD_ROWS_TO_SALE_OF_ABONEMENTS(pIDCLIENT NUMBER, pIDABONEMENT NUMBER, pDATABEGIN DATE, pDATAEND DATE);
END Roles_CLIENTS_PACKAGE;


CREATE OR REPLACE PACKAGE BODY Roles_CLIENTS_PACKAGE
IS
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

PROCEDURE ADD_ROWS_TO_LIST_OF_CLIENTS(pSURNAME_CLIENT NVARCHAR2, pNAME_CLIENT NVARCHAR2, pPATRONYMIC_CLIENT NVARCHAR2, pAGE_CLIENT NUMBER, pADDRESS_CLIENT NVARCHAR2, pTELEPHONE_CLIENT NVARCHAR2, pPASSPORT_CLIENT NVARCHAR2)
IS
BEGIN
        INSERT INTO LISOFCLI(SURNAME_CLIENT, NAME_CLIENT, PATRONYMIC_CLIENT, AGE_CLIENT, ADDRESS_CLIENT, TELEPHONE_CLIENT, PASSPORT_CLIENT)
        VALUES(pSURNAME_CLIENT, pNAME_CLIENT, pPATRONYMIC_CLIENT, pAGE_CLIENT, pADDRESS_CLIENT, pTELEPHONE_CLIENT, pPASSPORT_CLIENT);
END ADD_ROWS_TO_LIST_OF_CLIENTS;

PROCEDURE ADD_ROWS_TO_SALE_OF_ABONEMENTS(pIDCLIENT NUMBER, pIDABONEMENT NUMBER, pDATABEGIN DATE, pDATAEND DATE)
IS
BEGIN
    INSERT INTO SALOFABONM(ID_CLIENT, ID_ABONEMENT, DATA_BEGIN, DATA_END)
    VALUES (pIDCLIENT, pIDABONEMENT, pDATABEGIN, pDATAEND);
END ADD_ROWS_TO_SALE_OF_ABONEMENTS;

END Roles_CLIENTS_PACKAGE;


BEGIN
    KP_OWNER.Roles_CLIENTS_PACKAGE.INFO_TABLE_ABONEMENTS();
END;

BEGIN
    KP_OWNER.Roles_CLIENTS_PACKAGE.INFO_TABLE_COMPLEXES();
END;

BEGIN
    KP_OWNER.Roles_CLIENTS_PACKAGE.INFO_TABLE_LIST_OF_SERVICES();
END;

BEGIN
    KP_OWNER.Roles_CLIENTS_PACKAGE.INFO_TABLE_TYPES_OF_TRAINING();
END;

BEGIN
    KP_OWNER.Roles_CLIENTS_PACKAGE.ADD_ROWS_TO_LIST_OF_CLIENTS('Гуськов', 'Александр', 'Владимирович', 19, 'г. Витебск, Ольховая 45', '375175465633', 'AM303590');
END;

BEGIN
    KP_OWNER.Roles_CLIENTS_PACKAGE.ADD_ROWS_TO_SALE_OF_ABONEMENTS(34, 7, '22.05.23', '27.09.23');
END;