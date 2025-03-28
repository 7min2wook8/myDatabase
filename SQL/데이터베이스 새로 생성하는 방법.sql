ALTER SESSION SET "_ORACLE_SCRIPT"=true;

create user smartfarm identified by "1234";


grant connect, resource to smartfarm;


alter user smartfarm quota unlimited on users;