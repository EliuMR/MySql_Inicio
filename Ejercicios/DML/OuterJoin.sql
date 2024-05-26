-- Outer Join
-- un outer join regresa todos los renglones que cumplan la condición join, 
-- más las filas sin coincidencias de la izquierdad o derecha
-- Cuando no hay coincidencias retorna un valor nulo
-- outer es opcional tipicamente omitida

select * from bdpendiente.personas;

select * from dbemployees.employees;

-- hacemos un left outer join tulizado como tabla izquierda la tabla de personas, est
-- con el fin de qyecada persona de la tabla de personas vallamos y buscamos un empleado 
-- en la tabla de employees de la base de datos de bdEmployees

-- trae todos los datos de employees ponlos a la izquierda y con lo concordantes de
-- lo de dbPendiente de employees
select* from personas 
left outer join dbemployees.employees on dbemployees.employees.emp_no=bdpendiente.personas.id;

select* from personas 
right outer join dbemployees.employees on dbemployees.employees.emp_no=bdpendiente.personas.id;