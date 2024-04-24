alter session set "_ORACLE_SCRIPT"=true;
create user PROG identified by a123456 
default tablespace system 
quota unlimited on system;
grant connect, create session, create table TO PROG;
grant create procedure to PROG;

