CREATE OR REPLACE FUNCTION COUNT_LIST_OF_CLIENTS
RETURN NUMBER
IS
    count_clients NUMBER;
BEGIN
    SELECT COUNT(*) INTO count_clients FROM LIST_OF_CLIENTS;
    RETURN count_clients;
END;

DECLARE
     count_clients NUMBER;
BEGIN
    count_clients := COUNT_LIST_OF_CLIENTS;
    DBMS_OUTPUT.PUT_LINE('Number of Clients: ' || ' ' || count_clients);
END; 



CREATE OR REPLACE FUNCTION NUMBER_OF_AVAILABLE_VISITS (abonement_id IN ABONEMENTS.ID_ABONEMENT%TYPE)
RETURN NUMBER
IS
    v_amount_of_visits ABONEMENTS.AMOUNT_OF_VISITS%TYPE;
BEGIN
    SELECT AMOUNT_OF_VISITS INTO v_amount_of_visits FROM ABONEMENTS WHERE ID_ABONEMENT = abonement_id;
    RETURN v_amount_of_visits;
EXCEPTION
    WHEN NO_DATA_FOUND 
        THEN
            RETURN NULL;
END;

DECLARE
    v_amount_of_visits NUMBER;
BEGIN
    v_amount_of_visits := NUMBER_OF_AVAILABLE_VISITS(107);
     DBMS_OUTPUT.PUT_LINE(' оличество доступных посещений:'|| ' ' || v_amount_of_visits);
END;



CREATE OR REPLACE FUNCTION LIST_TRAINING_OF_TYPES
RETURN SYS_REFCURSOR 
IS
  training_types SYS_REFCURSOR;
BEGIN
  OPEN training_types FOR SELECT TYPES_OF_TRAINING FROM TYPES_OF_TRAINING;
  RETURN training_types;
END;

DECLARE
  training_types SYS_REFCURSOR;
  type_name TYPES_OF_TRAINING.TYPES_OF_TRAINING%TYPE;
BEGIN
  training_types := LIST_TRAINING_OF_TYPES();
  LOOP
    FETCH training_types INTO type_name;
    EXIT WHEN training_types%NOTFOUND;
    DBMS_OUTPUT.PUT_LINE(type_name);
  END LOOP;
  CLOSE training_types;
END;



CREATE OR REPLACE FUNCTION NUMBER_OF_CLIENTS_OVER_AGE(age_threshold IN NUMBER)
RETURN NUMBER
IS
    num_clients NUMBER;
BEGIN
    SELECT COUNT(*) INTO num_clients FROM LIST_OF_CLIENTS WHERE AGE_CLIENT > age_threshold;
    RETURN num_clients;
END;

DECLARE
    num_clients NUMBER;
BEGIN
    num_clients:= get_number_of_clients_over_age(50);
    DBMS_OUTPUT.PUT_LINE(' оличество клиентов чей возраст бодьше заданного'|| ' ' || num_clients);
END;



CREATE OR REPLACE PACKAGE PACK_FUNCTIONS AS
    FUNCTION COUNT_LIST_OF_CLIENTS
    RETURN NUMBER;

    FUNCTION NUMBER_OF_AVAILABLE_VISITS (abonement_id IN ABONEMENTS.ID_ABONEMENT%TYPE)
    RETURN NUMBER;

    FUNCTION LIST_TRAINING_OF_TYPES
    RETURN SYS_REFCURSOR;

    FUNCTION NUMBER_OF_CLIENTS_OVER_AGE(age_threshold IN NUMBER)
    RETURN NUMBER;
END PACK_FUNCTIONS;


CREATE OR REPLACE PACKAGE BODY PACK_FUNCTIONS AS
    FUNCTION COUNT_LIST_OF_CLIENTS
    RETURN NUMBER
    IS
        count_clients NUMBER;
    BEGIN
        SELECT COUNT(*) INTO count_clients FROM LIST_OF_CLIENTS;
        RETURN count_clients;
    END;

    FUNCTION NUMBER_OF_AVAILABLE_VISITS (abonement_id IN ABONEMENTS.ID_ABONEMENT%TYPE)
    RETURN NUMBER
    IS
        v_amount_of_visits ABONEMENTS.AMOUNT_OF_VISITS%TYPE;
    BEGIN
        SELECT AMOUNT_OF_VISITS INTO v_amount_of_visits FROM ABONEMENTS WHERE ID_ABONEMENT = abonement_id;
        RETURN v_amount_of_visits;
    EXCEPTION
        WHEN NO_DATA_FOUND 
            THEN
                RETURN NULL;
    END;

    FUNCTION LIST_TRAINING_OF_TYPES
    RETURN SYS_REFCURSOR 
    IS
        training_types SYS_REFCURSOR;
    BEGIN
        OPEN training_types FOR SELECT TYPES_OF_TRAINING FROM TYPES_OF_TRAINING;
        RETURN training_types;
    END;

    FUNCTION NUMBER_OF_CLIENTS_OVER_AGE(age_threshold IN NUMBER)
    RETURN NUMBER
    IS
        num_clients NUMBER;
    BEGIN
        SELECT COUNT(*) INTO num_clients FROM LIST_OF_CLIENTS WHERE AGE_CLIENT > age_threshold;
        RETURN num_clients;
    END;
END PACK_FUNCTIONS;


DECLARE
    count_clients NUMBER;
    v_amount_of_visits NUMBER;
    training_types SYS_REFCURSOR;
    type_name TYPES_OF_TRAINING.TYPES_OF_TRAINING%TYPE;
    num_clients NUMBER;
BEGIN
    count_clients := COUNT_LIST_OF_CLIENTS;
    DBMS_OUTPUT.PUT_LINE('Number of Clients: ' || ' ' || count_clients);
    v_amount_of_visits := NUMBER_OF_AVAILABLE_VISITS(107);
    DBMS_OUTPUT.PUT_LINE(' оличество доступных посещений:'|| ' ' || v_amount_of_visits);
     training_types := LIST_TRAINING_OF_TYPES();
    LOOP
        FETCH training_types INTO type_name;
        EXIT WHEN training_types%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE(type_name);
    END LOOP;
    CLOSE training_types;
    num_clients:= get_number_of_clients_over_age(50);
    DBMS_OUTPUT.PUT_LINE(' оличество клиентов чей возраст бодьше заданного'|| ' ' || num_clients);
END;
