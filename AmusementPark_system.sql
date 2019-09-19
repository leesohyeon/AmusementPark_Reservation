-- USER SQL
CREATE USER AMUSEMENTPARK IDENTIFIED BY "1234"  
DEFAULT TABLESPACE "USERS"
TEMPORARY TABLESPACE "TEMP";

-- QUOTAS

-- ROLES
GRANT "DBA" TO AMUSEMENTPARK ;
GRANT "CONNECT" TO AMUSEMENTPARK ;
GRANT "RESOURCE" TO AMUSEMENTPARK ;

-- SYSTEM PRIVILEGES

