insert into employees
values(1,'1981-10-16','Juan','Tinajero','M','2008-02-01');

insert into employees
values(4,'1982-12-20','Jose Luis','De la Rosa','M','2009-02-01');

select * from employees
inner join bdpendientes.personas   on bdpendientes.personas.id=emp_no   
-- where emp_no=1