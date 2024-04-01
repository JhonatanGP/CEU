alter session set "_ORACLE_SCRIPT"=true;
create user TEMA6 identified by a123456 
default tablespace system 
quota unlimited on system;
grant connect, create session, create table TO TEMA6;
grant create procedure to TEMA6;

