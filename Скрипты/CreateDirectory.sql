CREATE OR REPLACE DIRECTORY DATA_XML AS 'C:\app\xml_data';
GRANT READ, WRITE ON DIRECTORY DATA_XML TO KP_OWNER;  
ALTER SESSION SET CONTAINER = pdb_kp;
ALTER SESSION SET CONTAINER = cdb$root;
