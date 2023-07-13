CREATE OR REPLACE PROCEDURE EXPORT_LIST_OF_CLIENTS_TO_XML
IS
    l_file sys.utl_file.file_type;
    xml_data VARCHAR2(32767);
    w_repertoire VARCHAR2(64);
BEGIN
    SELECT dbms_xmlgen.getxml('SELECT * FROM LIST_OF_CLIENTS')
    AS xml INTO xml_data FROM dual;
    
    w_repertoire := 'DATA_XML';
    l_file := sys.utl_file.fopen(w_repertoire, 'LIST_OF_CLIENTS.xml', 'w');
    sys.utl_file.putf(l_file, '%s', xml_data);
    sys.utl_file.fclose(l_file);
END;

EXEC EXPORT_LIST_OF_CLIENTS_TO_XML;



CREATE OR REPLACE PROCEDURE EXPORT_ABONEMENTS_TO_XML
IS
    l_file sys.utl_file.file_type;
    xml_data VARCHAR2(32767);
    w_repertoire VARCHAR2(64);
BEGIN
    SELECT dbms_xmlgen.getxml('SELECT * FROM ABONEMENTS')
    AS xml INTO xml_data FROM dual;
    
    w_repertoire := 'DATA_XML';
    l_file := sys.utl_file.fopen(w_repertoire, 'ABONEMENTS.xml', 'w');
    sys.utl_file.putf(l_file, '%s', xml_data);
    sys.utl_file.fclose(l_file);
END;

EXEC EXPORT_ABONEMENTS_TO_XML;



CREATE OR REPLACE PROCEDURE EXPORT_SALE_OF_ABONEMENTS_XML
IS
    l_file sys.utl_file.file_type;
    xml_data VARCHAR2(32767);
    w_repertoire VARCHAR2(64);
BEGIN
    SELECT dbms_xmlgen.getxml('SELECT * FROM SALE_OF_ABONEMENTS')
    AS xml INTO xml_data FROM dual;
    
    w_repertoire := 'DATA_XML';
    l_file := sys.utl_file.fopen(w_repertoire, 'SALE_OF_ABONEMENTS.xml', 'w');
    sys.utl_file.putf(l_file, '%s', xml_data);
    sys.utl_file.fclose(l_file);
END;

EXEC EXPORT_SALE_OF_ABONEMENTS_XML;



CREATE OR REPLACE PROCEDURE EXPORT_INFO_COMPLEXES_XML
IS
    l_file sys.utl_file.file_type;
    xml_data VARCHAR2(32767);
    w_repertoire VARCHAR2(64);
BEGIN
    SELECT dbms_xmlgen.getxml('SELECT * FROM INFO_COMPLEXES')
    AS xml INTO xml_data FROM dual;
    
    w_repertoire := 'DATA_XML';
    l_file := sys.utl_file.fopen(w_repertoire, 'INFO_COMPLEXES.xml', 'w');
    sys.utl_file.putf(l_file, '%s', xml_data);
    sys.utl_file.fclose(l_file);
END;

EXEC EXPORT_INFO_COMPLEXES_XML;



CREATE OR REPLACE PROCEDURE EXPORT_TIME_TABLE_XML
IS
    l_file sys.utl_file.file_type;
    xml_data VARCHAR2(32767);
    w_repertoire VARCHAR2(64);
BEGIN
    SELECT dbms_xmlgen.getxml('SELECT * FROM TIME_TABLE')
    AS xml INTO xml_data FROM dual;
    
    w_repertoire := 'DATA_XML';
    l_file := sys.utl_file.fopen(w_repertoire, 'TIME_TABLE.xml', 'w');
    sys.utl_file.putf(l_file, '%s', xml_data);
    sys.utl_file.fclose(l_file);
END;

EXEC EXPORT_TIME_TABLE_XML;



CREATE OR REPLACE PROCEDURE EXPORT_LIST_OF_SERVICES_XML
IS
    l_file sys.utl_file.file_type;
    xml_data VARCHAR2(32767);
    w_repertoire VARCHAR2(64);
BEGIN
    SELECT dbms_xmlgen.getxml('SELECT * FROM LIST_OF_SERVICES')
    AS xml INTO xml_data FROM dual;
    
    w_repertoire := 'DATA_XML';
    l_file := sys.utl_file.fopen(w_repertoire, 'LIST_OF_SERVICES.xml', 'w');
    sys.utl_file.putf(l_file, '%s', xml_data);
    sys.utl_file.fclose(l_file);
END;

EXEC EXPORT_LIST_OF_SERVICES_XML;



CREATE OR REPLACE PROCEDURE EXPORT_TYPES_OF_TRAINING_XML
IS
    l_file sys.utl_file.file_type;
    xml_data VARCHAR2(32767);
    w_repertoire VARCHAR2(64);
BEGIN
    SELECT dbms_xmlgen.getxml('SELECT * FROM TYPES_OF_TRAINING')
    AS xml INTO xml_data FROM dual;
    
    w_repertoire := 'DATA_XML';
    l_file := sys.utl_file.fopen(w_repertoire, 'TYPES_OF_TRAINING.xml', 'w');
    sys.utl_file.putf(l_file, '%s', xml_data);
    sys.utl_file.fclose(l_file);
END;

EXEC EXPORT_TYPES_OF_TRAINING_XML;



CREATE OR REPLACE PROCEDURE EXPORT_LIST_OF_EMPLOYEE_XML
IS
    l_file sys.utl_file.file_type;
    xml_data VARCHAR2(32767);
    w_repertoire VARCHAR2(64);
BEGIN
    SELECT dbms_xmlgen.getxml('SELECT * FROM LIST_OF_EMPLOYEE')
    AS xml INTO xml_data FROM dual;
    
    w_repertoire := 'DATA_XML';
    l_file := sys.utl_file.fopen(w_repertoire, 'LIST_OF_EMPLOYEE.xml', 'w');
    sys.utl_file.putf(l_file, '%s', xml_data);
    sys.utl_file.fclose(l_file);
END;

EXEC EXPORT_LIST_OF_EMPLOYEE_XML;