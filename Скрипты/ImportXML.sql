CREATE OR REPLACE PROCEDURE IMPORT_LIST_OF_CLIENTS_XML(
    p_file IN VARCHAR2
)
AS
    v_xml XMLTYPE := XMLTYPE(p_file);
BEGIN
    FOR item IN (SELECT extractvalue(value(r), '/ROW/ID_CLIENT')AS ID_CLIENT,
                        extractvalue(value(r), '/ROW/SURNAME_CLIENT')AS SURNAME_CLIENT,
                        extractvalue(value(r), '/ROW/NAME_CLIENT')AS NAME_CLIENT,
                        extractvalue(value(r), '/ROW/PATRONYMIC_CLIENT')AS PATRONYMIC_CLIENT,
                        extractvalue(value(r), '/ROW/AGE_CLIENT')AS AGE_CLIENT,
                        extractvalue(value(r), '/ROW/ADDRESS_CLIENT')AS ADDRESS_CLIENT,
                        extractvalue(value(r), '/ROW/TELEPHONE_CLIENT')AS TELEPHONE_CLIENT,
                        extractvalue(value(r), '/ROW/PASSPORT_CLIENT')AS PASSPORT_CLIENT FROM TABLE (XMLSEQUENCE(EXTRACT(v_xml, '/ROWSET/ROW')))r
                        )
                        LOOP
                            INSERT INTO LIST_OF_CLIENTS_IMPORT VALUES(
                            TO_NUMBER(item.ID_CLIENT),
                            item.SURNAME_CLIENT,
                            item.NAME_CLIENT,
                            item.PATRONYMIC_CLIENT,
                            TO_NUMBER(item.AGE_CLIENT),
                            item.ADDRESS_CLIENT,
                            item.TELEPHONE_CLIENT,
                            item.PASSPORT_CLIENT
                            );
                        END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' ||SQLERRM);

END;

DECLARE
    v_clob CLOB;
BEGIN
    FILE_TO_CLOB('LIST_OF_CLIENTS', v_clob);
    IMPORT_LIST_OF_CLIENTS_XML(v_clob);
    COMMIT;
END;



CREATE OR REPLACE PROCEDURE IMPORT_ABONEMENTS_XML(
    p_file IN VARCHAR2
)
AS
    v_xml XMLTYPE := XMLTYPE(p_file);
BEGIN
    FOR item IN (SELECT extractvalue(value(r), '/ROW/ID_ABONEMENT')AS ID_ABONEMENT,
                        extractvalue(value(r), '/ROW/TYPE_OF_TRAINING')AS TYPE_OF_TRAINING,
                        extractvalue(value(r), '/ROW/TYPE_OF_SERVICE')AS TYPE_OF_SERVICE,
                        extractvalue(value(r), '/ROW/PRICE')AS PRICE,
                        extractvalue(value(r), '/ROW/AMOUNT_OF_VISITS')AS AMOUNT_OF_VISITS,
                        extractvalue(value(r), '/ROW/AMOUNT_OF_DAYS')AS AMOUNT_OF_DAYS,
                        extractvalue(value(r), '/ROW/AMOUNT_OF_MONTHS')AS AMOUNT_OF_MONTHS FROM TABLE (XMLSEQUENCE(EXTRACT(v_xml, '/ROWSET/ROW')))r
                        )
                        LOOP
                            INSERT INTO ABONEMENTS_IMPORT VALUES(
                            TO_NUMBER(item.ID_ABONEMENT),
                            item.TYPE_OF_TRAINING,
                            item.TYPE_OF_SERVICE,
                            TO_NUMBER(item.PRICE),
                            TO_NUMBER(item.AMOUNT_OF_VISITS),
                            TO_NUMBER(item.AMOUNT_OF_DAYS),
                            TO_NUMBER(item.AMOUNT_OF_MONTHS)                            
                            );
                        END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' ||SQLERRM);

END;

DECLARE
    v_clob CLOB;
BEGIN
    FILE_TO_CLOB('ABONEMENTS', v_clob);
    IMPORT_ABONEMENTS_XML(v_clob);
    COMMIT;
END;



CREATE OR REPLACE PROCEDURE IMPORT_SALE_OF_ABONEMENTS_XML(
    p_file IN VARCHAR2
)
AS
    v_xml XMLTYPE := XMLTYPE(p_file);
BEGIN
    FOR item IN (SELECT extractvalue(value(r), '/ROW/ID_SALE')AS ID_SALE,
                        extractvalue(value(r), '/ROW/ID_CLIENT')AS ID_CLIENT,
                        extractvalue(value(r), '/ROW/ID_ABONEMENT')AS ID_ABONEMENT,
                        extractvalue(value(r), '/ROW/DATA_BEGIN')AS DATA_BEGIN,
                        extractvalue(value(r), '/ROW/DATA_END')AS DATA_END FROM TABLE (XMLSEQUENCE(EXTRACT(v_xml, '/ROWSET/ROW')))r
                        )
                        LOOP
                            INSERT INTO SALE_OF_ABONEMENTS_IMPORT VALUES(
                            TO_NUMBER(item.ID_SALE),
                            TO_NUMBER(item.ID_CLIENT),
                            TO_NUMBER(item.ID_ABONEMENT),
                            TO_DATE(item.DATA_BEGIN),
                            TO_DATE(item.DATA_END)                            
                            );
                        END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' ||SQLERRM);

END;

DECLARE
    v_clob CLOB;
BEGIN
    FILE_TO_CLOB('SALE_OF_ABONEMENTS', v_clob);
    IMPORT_SALE_OF_ABONEMENTS_XML(v_clob);
    COMMIT;
END;



CREATE OR REPLACE PROCEDURE IMPORT_INFO_COMPLEXES_XML(
    p_file IN VARCHAR2
)
AS
    v_xml XMLTYPE := XMLTYPE(p_file);
BEGIN
    FOR item IN (SELECT extractvalue(value(r), '/ROW/ID_COMPLEXES')AS ID_COMPLEXES,
                        extractvalue(value(r), '/ROW/NAME_COMPLEXES')AS NAME_COMPLEXES,
                        extractvalue(value(r), '/ROW/ADDRESS_COMPLEXES')AS ADDRESS_COMPLEXES,
                        extractvalue(value(r), '/ROW/CAPACITY_COMPLEXES')AS CAPACITY_COMPLEXES FROM TABLE (XMLSEQUENCE(EXTRACT(v_xml, '/ROWSET/ROW')))r
                        )
                        LOOP
                            INSERT INTO INFO_COMPLEXES_IMPORT VALUES(
                            TO_NUMBER(item.ID_COMPLEXES),
                            item.NAME_COMPLEXES,
                            item.ADDRESS_COMPLEXES,
                            TO_NUMBER(item.CAPACITY_COMPLEXES)                            
                            );
                        END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' ||SQLERRM);

END;

DECLARE
    v_clob CLOB;
BEGIN
    FILE_TO_CLOB('INFO_COMPLEXES', v_clob);
    IMPORT_INFO_COMPLEXES_XML(v_clob);
    COMMIT;
END;



CREATE OR REPLACE PROCEDURE IMPORT_TIME_TABLE_XML(
    p_file IN VARCHAR2
)
AS
    v_xml XMLTYPE := XMLTYPE(p_file);
BEGIN
    FOR item IN (SELECT extractvalue(value(r), '/ROW/NUMBER_RECORD')AS NUMBER_RECORD,
                        extractvalue(value(r), '/ROW/DATA_TIME_TABLE')AS DATA_TIME_TABLE,
                        extractvalue(value(r), '/ROW/TIME_BEGIN')AS TIME_BEGIN,
                        extractvalue(value(r), '/ROW/TIME_END')AS TIME_END,
                        extractvalue(value(r), '/ROW/ID_EMPLOYEE')AS ID_EMPLOYEE,
                        extractvalue(value(r), '/ROW/ID_SERVICES')AS ID_SERVICES,
                        extractvalue(value(r), '/ROW/ID_TRAINING')AS ID_TRAINING FROM TABLE (XMLSEQUENCE(EXTRACT(v_xml, '/ROWSET/ROW')))r
                        )
                        LOOP
                            INSERT INTO TIME_TABLE_IMPORT VALUES(
                            TO_NUMBER(item.NUMBER_RECORD),
                            TO_DATE(item.DATA_TIME_TABLE),
                            item.TIME_BEGIN,
                            item.TIME_END,
                            TO_NUMBER(item.ID_EMPLOYEE), 
                            TO_NUMBER(item.ID_SERVICES),  
                            TO_NUMBER(item.ID_TRAINING)
                            );
                        END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' ||SQLERRM);

END;

DECLARE
    v_clob CLOB;
BEGIN
    FILE_TO_CLOB('TIME_TABLE', v_clob);
    IMPORT_TIME_TABLE_XML(v_clob);
    COMMIT;
END;



CREATE OR REPLACE PROCEDURE IMPORT_LIST_OF_SERVICES_XML(
    p_file IN VARCHAR2
)
AS
    v_xml XMLTYPE := XMLTYPE(p_file);
BEGIN
    FOR item IN (SELECT extractvalue(value(r), '/ROW/ID_SERVICES')AS ID_SERVICES,
                        extractvalue(value(r), '/ROW/TYPES_OF_SERVICES')AS TYPES_OF_SERVICES FROM TABLE (XMLSEQUENCE(EXTRACT(v_xml, '/ROWSET/ROW')))r
                        )
                        LOOP
                            INSERT INTO LIST_OF_SERVICES_IMPORT VALUES(
                            TO_NUMBER(item.ID_SERVICES),
                            item.TYPES_OF_SERVICES
                            );
                        END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' ||SQLERRM);

END;

DECLARE
    v_clob CLOB;
BEGIN
    FILE_TO_CLOB('LIST_OF_SERVICES', v_clob);
    IMPORT_LIST_OF_SERVICES_XML(v_clob);
    COMMIT;
END;



CREATE OR REPLACE PROCEDURE IMPORT_TYPES_OF_TRAINING_XML(
    p_file IN VARCHAR2
)
AS
    v_xml XMLTYPE := XMLTYPE(p_file);
BEGIN
    FOR item IN (SELECT extractvalue(value(r), '/ROW/ID_TRAINING')AS ID_TRAINING,
                        extractvalue(value(r), '/ROW/TYPES_OF_TRAINING')AS TYPES_OF_TRAINING FROM TABLE (XMLSEQUENCE(EXTRACT(v_xml, '/ROWSET/ROW')))r
                        )
                        LOOP
                            INSERT INTO TYPES_OF_TRAINING_IMPORT VALUES(
                            TO_NUMBER(item.ID_TRAINING),
                            item.TYPES_OF_TRAINING
                            );
                        END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' ||SQLERRM);

END;

DECLARE
    v_clob CLOB;
BEGIN
    FILE_TO_CLOB('TYPES_OF_TRAINING', v_clob);
    IMPORT_TYPES_OF_TRAINING_XML(v_clob);
    COMMIT;
END;



CREATE OR REPLACE PROCEDURE IMPORT_LIST_OF_EMPLOYEE_XML(
    p_file IN VARCHAR2
)
AS
    v_xml XMLTYPE := XMLTYPE(p_file);
BEGIN
    FOR item IN (SELECT extractvalue(value(r), '/ROW/ID_EMPLOYEE')AS ID_EMPLOYEE,
                        extractvalue(value(r), '/ROW/SURNAME_EMPLOYEE')AS SURNAME_EMPLOYEE,
                        extractvalue(value(r), '/ROW/NAME_EMPLOYEE')AS NAME_EMPLOYEE,
                        extractvalue(value(r), '/ROW/PATRONYMIC_EMPLOYEE')AS PATRONYMIC_EMPLOYEE,
                        extractvalue(value(r), '/ROW/TELEPHONE_EMPLOYEE')AS TELEPHONE_EMPLOYEE,
                        extractvalue(value(r), '/ROW/ADDRESS_EMPLOYEE')AS ADDRESS_EMPLOYEE,
                        extractvalue(value(r), '/ROW/SALARY_EMPLOYEE')AS SALARY_EMPLOYEE FROM TABLE (XMLSEQUENCE(EXTRACT(v_xml, '/ROWSET/ROW')))r
                        )
                        LOOP
                            INSERT INTO LIST_OF_EMPLOYEE_IMPORT VALUES(
                            TO_NUMBER(item.ID_EMPLOYEE),
                            item.SURNAME_EMPLOYEE,
                            item.NAME_EMPLOYEE,
                            item.PATRONYMIC_EMPLOYEE,
                            item.TELEPHONE_EMPLOYEE, 
                            item.ADDRESS_EMPLOYEE,  
                            TO_NUMBER(item.SALARY_EMPLOYEE)
                            );
                        END LOOP;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error occurred: ' ||SQLERRM);

END;

DECLARE
    v_clob CLOB;
BEGIN
    FILE_TO_CLOB('LIST_OF_EMPLOYEE', v_clob);
    IMPORT_LIST_OF_EMPLOYEE_XML(v_clob);
    COMMIT;
END;