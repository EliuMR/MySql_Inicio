-- Inner Join con tablas de datos de otra base de datos
-- Un servidor mysql puede almacenar tablas en multiples bases de datos, conocidas como sche,es
-- para este tipo de consultas, es necesario que el usuario tenga los permisos necesarios
-- bases de datos sobre el mismo servidor

-- database_name.table_name

-- bdPendiente, bdEmployees
use dbEmployees;

select * from employees
where emp_no in(1,4);
-- para hacer cruce vamos a usar los id=1-4 de emp_no
-- la base dbEmployees no tiene esos elementos adrede para realizar el ejercicio
-- Agregamos los datos
insert into employees values (1,'1981-10-16','Juan','Perez Garcia','M','2008-02-01');
insert into employees values (4,'1982-12-20','Jose Luis','Montez Quiñonez','M','2009-02-01');
select * from employees
where emp_no in(1,4);
-- estos datos sí existen en la base de datos bdPendite en personas
select * from salaries
where emp_no in(1,4);
-- insertamos los salarios de esos dos empleados con el asistente através de un archivo csv dentro del directorio de baseDatosEmpleados

-- Juntar de dos bases de datos para una consulta completa dbEmployees y dbPendiente
select *
from bdpendiente.personas
inner join dbemployees.employees on (dbemployees.employees.emp_no=bdpendiente.personas.id);

-- con alias
select per.nombre, emp.gender, sal.salary
from bdpendiente.personas per
inner join dbemployees.employees emp on (emp.emp_no=per.id)
inner join dbemployees.salaries sal on (sal.emp_no=per.id)


