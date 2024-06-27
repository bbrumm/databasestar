/*
Run these as a SYS user
*/

GRANT DEBUG CONNECT SESSION TO hr;
GRANT DEBUG ANY PROCEDURE TO hr;
GRANT EXECUTE ON DBMS_DEBUG_JDWP To hr;

CALL DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE
   (host=>'10.0.73.4',
     ace=> SYS.XS$ACE_TYPE(privilege_list=>SYS.XS$NAME_LIST('JDWP'),
               principal_name=>'HR',
               principal_type=>SYS.XS_ACL.PTYPE_DB) 
   );


SELECT * FROM dba_network_acls;