--After Logon
--Run on SYS account
DROP TABLE logon_audit;

CREATE TABLE logon_audit (
  username VARCHAR2(50),
  logon_date DATE
);

CREATE OR REPLACE TRIGGER sys_logon_audit
AFTER LOGON ON BEN.SCHEMA
BEGIN
  INSERT INTO logon_audit (username, logon_date)
  VALUES (USER, SYSDATE);

END;

SELECT * FROM logon_audit;

--Disconnect, then connect, then query again
