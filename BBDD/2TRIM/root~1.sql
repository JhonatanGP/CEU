alter session set "_ORACLE_SCRIPT"=true;
create user repaso identified by a123456 
default tablespace system 
quota unlimited on system;
grant connect, create session, create table TO repaso;