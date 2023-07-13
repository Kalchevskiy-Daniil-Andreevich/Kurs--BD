CREATE OR REPLACE PROCEDURE INFO_TABLE_LIST_OF_CLIENTS
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
END;

BEGIN
    INFO_TABLE_LIST_OF_CLIENTS();
END;

CREATE OR REPLACE PROCEDURE INFO_TABLE_LISOFCLI_VIEW
IS
    CURSOR curs_list_of_clients IS 
    SELECT ID_CLIENT, SURNAME_CLIENT, NAME_CLIENT, PATRONYMIC_CLIENT, AGE_CLIENT, ADDRESS_CLIENT, TELEPHONE_CLIENT, PASSPORT_CLIENT
    FROM LISOFCLI_VIEW;
    v_id_client LISOFCLI_VIEW.ID_CLIENT%type;
    v_surname_client LISOFCLI_VIEW.SURNAME_CLIENT%type;
    v_name_client LISOFCLI_VIEW.NAME_CLIENT%type;
    v_patronymic_client LISOFCLI_VIEW.PATRONYMIC_CLIENT%type;
    v_age_client LISOFCLI_VIEW.AGE_CLIENT%type;
    v_address_client LISOFCLI_VIEW.ADDRESS_CLIENT%type;
    v_telephone_client LISOFCLI_VIEW.TELEPHONE_CLIENT%type;
    v_passport_client LISOFCLI_VIEW.PASSPORT_CLIENT%type;
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
END;

BEGIN
    INFO_TABLE_LISOFCLI_VIEW();
END;



CREATE OR REPLACE PROCEDURE INFO_TABLE_ABONEMENTS
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
END;
    
BEGIN
    INFO_TABLE_ABONEMENTS();
END;

CREATE OR REPLACE PROCEDURE INFO_TABLE_ABONM_VIEW
IS
    v_id_abonement ABONM_VIEW.ID_ABONEMENT%type;
    v_type_of_training ABONM_VIEW.TYPE_OF_TRAINING%type;
    v_type_of_service ABONM_VIEW.TYPE_OF_SERVICE%type;
    v_price ABONM_VIEW.PRICE%type;
    v_amount_of_visits ABONM_VIEW.AMOUNT_OF_VISITS%type;
    v_amount_of_days ABONM_VIEW.AMOUNT_OF_DAYS%type;
    v_amount_of_months ABONM_VIEW.AMOUNT_OF_MONTHS%type;
    CURSOR curs_abonements IS
    SELECT ID_ABONEMENT, TYPE_OF_TRAINING, TYPE_OF_SERVICE, PRICE, AMOUNT_OF_VISITS, AMOUNT_OF_DAYS, AMOUNT_OF_MONTHS FROM ABONM_VIEW;
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
END;
    
BEGIN
    INFO_TABLE_ABONM_VIEW();
END;



CREATE OR REPLACE PROCEDURE INFO_TABLE_SALE_OF_ABONEMENTS
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
END;
    
BEGIN
    INFO_TABLE_SALE_OF_ABONEMENTS();
END;

CREATE OR REPLACE PROCEDURE INFO_TABLE_SALOFABONM_VIEW
IS
    v_id_sale SALOFABONM_VIEW.ID_SALE%type;
    v_id_client SALOFABONM_VIEW.ID_CLIENT%type;
    v_id_abonement SALOFABONM_VIEW.ID_ABONEMENT%type;
    v_data_begin SALOFABONM_VIEW.DATA_BEGIN%type;
    v_data_end SALOFABONM_VIEW.DATA_END%type;
    CURSOR curs_sale_of_abonements IS
    SELECT ID_SALE, ID_CLIENT, ID_ABONEMENT, DATA_BEGIN, DATA_END FROM SALOFABONM_VIEW;
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
END;
    
BEGIN
    INFO_TABLE_SALOFABONM_VIEW();
END;



CREATE OR REPLACE PROCEDURE INFO_TABLE_COMPLEXES
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
END;

BEGIN
    INFO_TABLE_COMPLEXES();
END;

CREATE OR REPLACE PROCEDURE INFO_TABLE_INFCOMPL_VIEW
IS
    v_name_complexes INFCOMPL_VIEW.NAME_COMPLEXES%type;
    v_address_complexes INFCOMPL_VIEW.ADDRESS_COMPLEXES%type;
    v_capacity_complexes INFCOMPL_VIEW.CAPACITY_COMPLEXES%type;
    CURSOR curs_info_complexes IS
    SELECT NAME_COMPLEXES, ADDRESS_COMPLEXES, CAPACITY_COMPLEXES FROM INFCOMPL_VIEW;
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
END;

BEGIN
    INFO_TABLE_INFCOMPL_VIEW();
END;



CREATE OR REPLACE PROCEDURE INFO_TABLE_VISIT_RECORD
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
END;

BEGIN
    INFO_TABLE_VISIT_RECORD();
END;

CREATE OR REPLACE PROCEDURE INFO_TABLE_VISREC_VIEW
IS
    v_id_card VISREC_VIEW.ID_SALE%type;
    v_number_record VISREC_VIEW.NUMBER_RECORD%type;
    v_id_complexes VISREC_VIEW.ID_COMPLEXES%type;
    CURSOR curs_visit_record IS
    SELECT ID_CARD, NUMBER_RECORD, ID_COMPLEXES FROM VISREC_VIEW;
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
END;

BEGIN
    INFO_TABLE_VISREC_VIEW();
END;



CREATE OR REPLACE PROCEDURE INFO_TABLE_TIME_TABLE
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
END;

BEGIN
    INFO_TABLE_TIME_TABLE();
END;

CREATE OR REPLACE PROCEDURE INFO_TABLE_TIMTAB_VIEW
IS
    v_data TIMTAB_VIEW.DATA_TIME_TABLE%type;
    v_time_begin TIMTAB_VIEW.TIME_BEGIN%type;
    v_time_end TIMTAB_VIEW.TIME_END%type;
    v_id_employee TIMTAB_VIEW.ID_EMPLOYEE%type;
    v_id_services TIMTAB_VIEW.ID_SERVICES%type;
    v_id_training TIMTAB_VIEW.ID_TRAINING%type;
    CURSOR curs_time_table IS
    SELECT DATA_TIME_TABLE, TIME_BEGIN, TIME_END, ID_EMPLOYEE, ID_SERVICES, ID_TRAINING FROM TIMTAB_VIEW;
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
END;

BEGIN
    INFO_TABLE_TIMTAB_VIEW();
END;



CREATE OR REPLACE PROCEDURE INFO_TABLE_LIST_OF_SERVICES
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
END;

BEGIN
    INFO_TABLE_LIST_OF_SERVICES();
END;

CREATE OR REPLACE PROCEDURE INFO_TABLE_LISOFSERV_VIEW
IS
    v_name_services LISOFSERV_VIEW.TYPES_OF_SERVICES%type;
    CURSOR curs_list_of_services IS
    SELECT TYPES_OF_SERVICES FROM LISOFSERV_VIEW;
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
END;

BEGIN
    INFO_TABLE_LISOFSERV_VIEW();
END;



CREATE OR REPLACE PROCEDURE INFO_TABLE_TYPES_OF_TRAINING
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
END;

BEGIN
    INFO_TABLE_TYPES_OF_TRAINING();
END;

CREATE OR REPLACE PROCEDURE INFO_TABLE_TYPOFTRA_VIEW
IS
    v_types_of_training TYPOFTRA_VIEW.TYPES_OF_TRAINING%type;
    CURSOR curs_types_of_training IS
    SELECT TYPES_OF_TRAINING FROM TYPOFTRA_VIEW;
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
END;

BEGIN
    INFO_TABLE_TYPOFTRA_VIEW();
END;



CREATE OR REPLACE PROCEDURE INFO_TABLE_LIST_OF_EMPLOYEE
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
END;

BEGIN
    INFO_TABLE_LIST_OF_EMPLOYEE();
END;

CREATE OR REPLACE PROCEDURE INFO_TABLE_LISOFEMP_VIEW
IS
    v_surname_employee LISOFEMP_VIEW.SURNAME_EMPLOYEE%type;
    v_name_employee LISOFEMP_VIEW.NAME_EMPLOYEE%type;
    v_patronymic_employee LISOFEMP_VIEW.PATRONYMIC_EMPLOYEE%type;
    v_telephone_employee LISOFEMP_VIEW.TELEPHONE_EMPLOYEE%type;
    v_address_employee LISOFEMP_VIEW.ADDRESS_EMPLOYEE%type;
    v_salary_employee LISOFEMP_VIEW.SALARY_EMPLOYEE%type;
    CURSOR curs_list_of_employee IS
    SELECT SURNAME_EMPLOYEE, NAME_EMPLOYEE, PATRONYMIC_EMPLOYEE, TELEPHONE_EMPLOYEE, ADDRESS_EMPLOYEE, SALARY_EMPLOYEE FROM LISOFEMP_VIEW;
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
END;

BEGIN
    INFO_TABLE_LISOFEMP_VIEW();
END;