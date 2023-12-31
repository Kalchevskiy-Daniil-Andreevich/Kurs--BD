CREATE OR REPLACE PROCEDURE GET_ABONEMENTS_COUNT(P_TYPE_OF_TRAINING IN ABONEMENTS.TYPE_OF_TRAINING%TYPE, P_COUNT_ABONEMENTS OUT NUMBER)
IS
BEGIN
    SELECT COUNT(*) INTO P_COUNT_ABONEMENTS FROM ABONEMENTS WHERE TYPE_OF_TRAINING = P_TYPE_OF_TRAINING;
END;

DECLARE
    v_count NUMBER;
BEGIN
    GET_ABONEMENTS_COUNT('TRX', v_count);
    DBMS_OUTPUT.PUT_LINE('���������� ����������� TRX: ' || v_count);
END;



CREATE OR REPLACE PROCEDURE GET_CLIENT_COUNT_BY_AGE(AGE IN NUMBER, COUNT OUT NUMBER)
IS
BEGIN
    SELECT COUNT(*) INTO COUNT FROM LIST_OF_CLIENTS WHERE AGE_CLIENT = AGE;
END;

DECLARE
    client_count NUMBER;
BEGIN
    GET_CLIENT_COUNT_BY_AGE(30, client_count);
    DBMS_OUTPUT.PUT_LINE('���������� �������� � �������� 30: ' || client_count);
END;



CREATE OR REPLACE PROCEDURE COUNT_EMPLOYEES_BELOW_SALARY(p_salary_employee IN NUMBER, p_count OUT NUMBER)
IS
BEGIN
    SELECT COUNT(*) INTO p_count FROM LIST_OF_EMPLOYEE WHERE SALARY_EMPLOYEE < p_salary_employee;
END;

DECLARE
    v_counts NUMBER;
BEGIN
    COUNT_EMPLOYEES_BELOW_SALARY(2000, v_counts);
    DBMS_OUTPUT.PUT_LINE('���������� ���������� � ���������� ������ ������ 2000: ' || v_counts);
END;



CREATE OR REPLACE PROCEDURE GET_TRAINING_TYPE_BY_ID (p_id_training IN NUMBER)
IS
    v_training_type NVARCHAR2(50);
BEGIN
    SELECT TYPES_OF_TRAINING INTO v_training_type FROM TYPES_OF_TRAINING WHERE ID_TRAINING = p_id_training;
        DBMS_OUTPUT.PUT_LINE('Training type for ID ' || p_id_training || ': ' || v_training_type);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No training type found for ID ' || p_id_training);
END;

BEGIN
    GET_TRAINING_TYPE_BY_ID(3);
END;



CREATE OR REPLACE PACKAGE PACK_PROCEDURES AS
    PROCEDURE GET_ABONEMENTS_COUNT(P_TYPE_OF_TRAINING IN ABONEMENTS.TYPE_OF_TRAINING%TYPE, P_COUNT_ABONEMENTS OUT NUMBER);
    PROCEDURE GET_CLIENT_COUNT_BY_AGE(AGE IN NUMBER, COUNT OUT NUMBER);
    PROCEDURE COUNT_EMPLOYEES_BELOW_SALARY(p_salary_employee IN NUMBER, p_count OUT NUMBER);
    PROCEDURE GET_TRAINING_TYPE_BY_ID (p_id_training IN NUMBER);
END PACK_PROCEDURES;


CREATE OR REPLACE PACKAGE BODY PACK_PROCEDURES AS
    PROCEDURE GET_ABONEMENTS_COUNT(P_TYPE_OF_TRAINING IN ABONEMENTS.TYPE_OF_TRAINING%TYPE, P_COUNT_ABONEMENTS OUT NUMBER)
    IS
    BEGIN
        SELECT COUNT(*) INTO P_COUNT_ABONEMENTS FROM ABONEMENTS WHERE TYPE_OF_TRAINING = P_TYPE_OF_TRAINING;
    END;

    PROCEDURE GET_CLIENT_COUNT_BY_AGE(AGE IN NUMBER, COUNT OUT NUMBER)
    IS
    BEGIN
        SELECT COUNT(*) INTO COUNT FROM LIST_OF_CLIENTS WHERE AGE_CLIENT = AGE;
    END;

    PROCEDURE COUNT_EMPLOYEES_BELOW_SALARY(p_salary_employee IN NUMBER, p_count OUT NUMBER)
    IS
    BEGIN
        SELECT COUNT(*) INTO p_count FROM LIST_OF_EMPLOYEE WHERE SALARY_EMPLOYEE < p_salary_employee;
    END;

    PROCEDURE GET_TRAINING_TYPE_BY_ID (p_id_training IN NUMBER)
    IS
        v_training_type NVARCHAR2(50);
    BEGIN
        SELECT TYPES_OF_TRAINING INTO v_training_type FROM TYPES_OF_TRAINING WHERE ID_TRAINING = p_id_training;
        DBMS_OUTPUT.PUT_LINE('Training type for ID ' || p_id_training || ': ' || v_training_type);
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No training type found for ID ' || p_id_training);
    END;
END PACK_PROCEDURES;


DECLARE
    v_count NUMBER;
    client_count NUMBER;
    v_counts NUMBER;
BEGIN
    PACK_PROCEDURES.GET_ABONEMENTS_COUNT('TRX', v_count);
    DBMS_OUTPUT.PUT_LINE('���������� ����������� TRX: ' || v_count);
    
    PACK_PROCEDURES.GET_CLIENT_COUNT_BY_AGE(30, client_count);
    DBMS_OUTPUT.PUT_LINE('���������� �������� � �������� 30: ' || client_count);
    
    PACK_PROCEDURES.COUNT_EMPLOYEES_BELOW_SALARY(2000, v_counts);
    DBMS_OUTPUT.PUT_LINE('���������� ���������� � ���������� ������ ������ 2000: ' || v_count);
    
    PACK_PROCEDURES.GET_TRAINING_TYPE_BY_ID(3);
END;