CREATE OR REPLACE TRIGGER PREVENT_CLIENT_DELETION
BEFORE DELETE ON LIST_OF_CLIENTS
FOR EACH ROW
DECLARE
    active_abonnements NUMBER;
BEGIN
    SELECT COUNT(*)
    INTO active_abonnements
    FROM SALE_OF_ABONEMENTS
    WHERE ID_CLIENT = :OLD.ID_CLIENT
    AND DATA_END > SYSDATE;
    
    IF active_abonnements > 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Cannot delete client with active abonnement');
    END IF;
END;

--чтобы нельзя было удалить клиента у которого имеется активный абонимент