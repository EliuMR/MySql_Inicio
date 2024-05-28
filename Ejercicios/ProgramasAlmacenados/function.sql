-- Función almacenada: regresan un valor, en vez de los procedimientos que pueden retornar varias
-- no puede hacer las instrucciones: update, insert, deleate; ya que esta modifica la base de datpos
-- sólo retorna valores

use bdPendiente;
select * from entradasalidadinero;
select * from ingresosegresos;


-- función cuando mandemos a llamr ingresosegresos con un id y retorne el 
-- monto total asociadas a dicho id
drop function if exists montosIngresosEgresos;
SET GLOBAL log_bin_trust_function_creators = 1; -- para que me permita crear funciones

delimiter //
create function montosIngresosEgresos(idIngresoEgreso int)
returns decimal(20,2) -- sumatoria de movimientos hechos
begin 
	declare sumatoria decimal(20,2);
    select sum(montoIE)
    into sumatoria
    from entradaSalidaDinero
    where idIngresosEgresos=idIngresoEgreso;
    
    if sumatoria>0 then
		return sumatoria;
	else
		return 0; -- para que no retorne nullos
	end if;
end //
delimiter ;

select id, descripción,montosIngresosEgresos(id)  from ingresosegresos;

-- comprobación 
select sum(montoIE) from entradasalidadinero
where idIngresosEgresos=1;