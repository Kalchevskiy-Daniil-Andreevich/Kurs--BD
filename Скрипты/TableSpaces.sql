Create TableSpace TS_KP 
DataFile 'C:\app\Tablespaces\TS_KP.dbf'
Size 7M
Autoextend On Next 5M 
MaxSize 30M
Extent Management Local;

DROP TABLESPACE TS_KP
    INCLUDING CONTENTS AND DATAFILES;

Create TEMPORARY TableSpace TS_KP_TEMP 
TEMPFILE 'C:\app\Tablespaces\TS_KP_TEMP.dbf'
Size 5M
Autoextend On Next 3M
MaxSize 20M
EXTENT MANAGEMENT LOCAL;

DROP TABLESPACE TS_KP_TEMP
    INCLUDING CONTENTS AND DATAFILES;