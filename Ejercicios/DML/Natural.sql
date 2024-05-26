-- Using, para mas sencilla el join
-- ambas tablas tengan  el mismo nombre en la columna

use dbmployees;

select count(*) from employees
inner join titles on employees.emp_no=titles.emp_no
inner join salaries on salaries.emp_no=employees.emp_no;

-- using
select count(*) from employees
inner join titles using(emp_no)
inner join salaries using(emp_no);

-- Natural simplifica más
-- los campos deben llamarse igual para que funcione correctamente
select count(*) from employees
natural join titles
inner join salaries using(emp_no);
