-- Procedure

select count(*)
from pendientes
where idPersonaAsignado=3;

drop procedure totalpendientes;

DELIMITER //
create procedure totalpendientes(in varIdPersonaAsignado int, out frase varchar(50), out persona varchar(50))
begin
	declare totalPendientes int;
    
    select count(*)
    into totalPendientes
    from pendientes
    where idPersonaAsignado=varIdPersonaAsignado;
    
    select nombre
    into persona
    from personas 
    where id=varIdPersonaAsignado;
    
    if totalPendientes=0 then 
		set frase= 'No tiene pendientes'; -- asignar a frase 
    elseif totalPendientes>1 and totalPendientes<3 then
		set frase =concat('Está algo ocupado ',totalPendientes, ' pendientes');
	elseif totalPendientes>4 then
		set frase =concat('Está ocupado ',totalPendientes, ' pendientes');
	end if;
end //
DELIMITER ;

call totalpendientes(3,@frase,@persona);
select @frase,@persona;