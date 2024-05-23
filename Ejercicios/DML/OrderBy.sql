-- ORDER BY
-- especificar cómo nuestros renglones en el set de resultados serán ordenados
-- ordenar por más de una columna de forma ascendente 'asc' o descendente 'desc'

-- order by expression [asc|desc][,expression[asc|desc]]..-

use dbEmployees;

select birth_date, first_name, last_name
from employees
order by birth_date desc; -- ordenar de manera descendente birth_date

-- ordenar los valores por más de un campo
select birth_date, first_name, last_name
from employees
order by last_name asc, birth_date desc;

-- ordeando los valores por un alias
select birth_date, concat(last_name, '',first_name) as 'nombreCompleto'
from employees
order by nombreCompleto desc;

-- ordenar los valores por una expresión o función
select birth_date, concat(last_name,' ', first_name) as 'nombreCompleto',
datediff(now(),birth_date)/365 as 'edad'
from employees
order by edad desc;


-- ordenar los valores por una expresión o función
select birth_date, concat(last_name,' ', first_name) as 'nombreCompleto',
datediff(now(),birth_date)/365 as 'edad'
from employees
order by 3 desc; -- ordenar por la tercera posición de columna, 3=edad

-- ordenando por una lista de valores:
-- 'Senior Engineer'
-- 'Staff'
-- 'Engineer'
-- 'Senior Staff'
-- 'Assistant Engineer'
-- 'Technique Leader'

select * from titles
where emp_no between 10001 and 10500
order by field(title,'Technique Leader','Senior Staff','Engineer') desc; -- ordena por una lista
