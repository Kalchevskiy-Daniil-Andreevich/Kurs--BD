CREATE OR REPLACE PROCEDURE FILE_TO_CLOB(
    p_file_name IN VARCHAR2,
    p_clob OUT CLOB
)
AS
    v_file UTL_FILE.FILE_TYPE;
    v_filename VARCHAR2(100);
    v_buffer VARCHAR2(32767);
BEGIN
    v_filename := p_file_name || '.xml';
    v_file := UTL_FILE.FOPEN('DATA_XML', v_filename, 'r');
    LOOP
        UTL_FILE.GET_LINE(v_file, v_buffer);
    IF v_buffer = '</ROWSET>' THEN
        p_clob := p_clob || v_buffer;
        EXIT;
    ELSE
         p_clob := p_clob || v_buffer;
        END IF;
    END LOOP;
    UTL_FILE.FCLOSE(v_file);
END;
