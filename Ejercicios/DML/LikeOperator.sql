-- El operador like se puede utilizar renglones que coinicdad con un patrón llamado máscara
-- determina qué valores en la columna satisface la condición

-- la máscara para el operador like puede contener símbolos
-- se puede hacer uso del operador not

 -- Like wilcards
 -- Símbolo 	Descripción
 -- %			Coincide con una cadena de cero o más caracteres
 -- - 			Coincide con cualquier carácter
 

-- where match_expression [not] like pattern

use dbEmployees;
-- seleccionamos todos los empleados cuyo nombre coincida en sus primeros tres caracteres
-- cone el patrón MAN también el apellido empiece por 'MAN'

select * from employees
where first_name like 'Man%'   -- los primeros tres caracteres coincidad con MAN y los siguientes de puede ser lo que sea
and last_name like 'man%';

-- seleccione todos los empleados cuyo nombre empiece por 'Ma' los siguientes dos caracteres pueden ser os que sea
-- y el quinto caracter debería de ser la letra u, el mismo patrón para last_name
select * from employees
where first_name like 'ma__u%'  and last_name like 'ma__u%';

-- seleccione todos los empleados cuyo nombre termine por 'ton' 
--  el mismo patrón para last_name
select * from employees
where first_name like '%ton' and last_name like '%ton';

-- seleccione todos los empleados cuyo nombre contenga  'uan' 
--  el mismo patrón para last_name
select *from employees
where first_name like '%uan%' and last_name like '%uan%';

-- seleccione todos los empleados cuyo nombre contenga 5 caracteres solamente en el apptllido 
--  el mismo patrón para last_name
select * from employees
where first_name like '_____' and last_name like '_____';