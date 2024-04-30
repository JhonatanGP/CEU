set serveroutput on;

/*1.Se necesita una función llamada insertaEmpleado que reciba por parámetros todos los campos de la tabla emp (empno, ename, job, etc.).
Esta función comprobará si existe algún empno en la table emp con el que se le pasa por parámetro y, si no hay ninguno, creará un 
registro en la tabla emp con todos esos datos pasados por parámetro. Después, devolverá en una variable el mensaje "Registro insertado 
correctamente". En caso de que ese empno exista en la tabla emp, se debe devolver en una variable el mensaje "No se puede crear, ya existe".*/
create or replace function insertaEmpleado(
    vempno emp.empno%type,
    vename emp.ename%type,
    vjob emp.job%type,
    vmgr emp.mgr%type,
    vhiredate emp.hiredate%type,
    vsal emp.sal%type,
    vcomm emp.comm%type,
    vdeptno emp.deptno%type
) return varchar
is
    existe emp.empno%type;
begin
    select empno into existe from emp where empno = vempno;
    if existe = vempno then --innecesario
        return 'No se puede crear, ya existe';
    end if;
exception
    when no_data_found then
        insert into emp values (vempno,vename,vjob,vmgr,vhiredate,vsal,vcomm,vdeptno);
        return 'Registro insertado correctamente';
end;
/
 
/*2.Realiza un bloque de código anónimo que pida al usuario que meta por teclado todos los campos de la tabla emp, guárdalos en sus 
variables correspondientes, llama a la función insertaEmpleado y muestra por consola el mensaje que devuelve dicha función. Haz un ejemplo
con los siguientes datos:
- empno: 7999
- ename: STEVEN
- job: MANAGER
- mgr: 7839
- hiredate: 01/01/23
- sal: 3000
- comm: 0
- deptno: 10  */
declare
    vempno emp.empno%type := &empno;
    vename emp.ename%type := '&ename';
    vjob emp.job%type := '&job';
    vmgr emp.mgr%type := &mgr;
    vhiredate emp.hiredate%type := '&hiredate';
    vsal emp.sal%type := &sal;
    vcomm emp.comm%type := &comm;
    vdeptno emp.deptno%type := &deptno;
    mensaje varchar(200);
begin 
    mensaje := insertaEmpleado(vempno,vename,vjob,vmgr,vhiredate,vsal,vcomm,vdeptno);
    dbms_output.put_line(mensaje);
end;
/