GRANT
DEBUG CONNECT SESSION,
DEBUG ANY PROCEDURE
TO ben;

GRANT EXECUTE ON DBMS_DEBUG TO ben;

GRANT EXECUTE ON DBMS_DEBUG_JDWP TO ben;


BEGIN
 DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE
 (
 host => '10.0.0.2',
 lower_port => null,
 upper_port => null,
 ace => xs$ace_type(privilege_list => xs$name_list('jdwp'),
 principal_name => 'ben',
 principal_type => xs_acl.ptype_db)
 );
END;

GRANT CREATE PROCEDURE TO ben;