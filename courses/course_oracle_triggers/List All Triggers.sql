SELECT *
FROM sys.all_triggers;

SELECT *
FROM sys.all_triggers
WHERE owner NOT IN ('XDB', 'MDSYS', 'GSMADMIN_INTERNAL', 'WMSYS', 'SYS', 'LBACSYS');