-- CASE
drop procedure totalPendientesCase;

DELIMITER //
create procedure totalPendientesCase(in varIdPersonaAsignado int, out frase varchar(50), out persona varchar(50))
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
    
    case
		when totalPendientes>=1 and totalPendientes<3 then
			set frase =concat('Está algo ocupado ',totalPendientes, ' pendientes');
		when totalPendientes>=4 then
			set frase =concat('Está ocupado ',totalPendientes, ' pendientes');
		else 
			set frase= 'No tiene pendientes'; 
    end case;
end //
DELIMITER ;

call totalpendientesCase(4,@frase,@persona);
select @frase,@persona;

select count(*)
    from pendientes
    where idPersonaAsignado=4;