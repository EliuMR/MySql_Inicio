-- Operadores lógicos
-- and, or, not 

use bdPendiente;
-- selecciona todos los registros donde el id sea diferente de 8 y que el tel´´efono empiece con 493 y que el id sea par

select * from personas
where id!=8 and left(telefono,3)=493 and mod(id,2)=0;

-- usando or
-- lada 444 o 493
select * from personas
where left(telefono,3)=444 or left(telefono,3)=493 ;

-- selecciona todos cuyo telefono no sea 493
select * from personas
where not(left(telefono,3)=493);
-- equivalente a
select * from personas
where left(telefono,3)<>493;

select * from entradasalidadinero
where montoIE>=5000 or fechaEs='2018/12/31';

select * from entradasalidadinero
where montoIE>=5000 or not fechaEs='2018/12/31';

select count(*) from entradasalidadinero
where montoIE>=5000 or not fechaEs='2018/12/31';

-- prioridad de operadores or not and

select * from personas
where id=8 or id =10 or id =3 and id=4; -- == (id=8 or id =10) or (id =3 and id=4)

select * from personas
where not (id=8 or id =10 or id =3) and (id=4);