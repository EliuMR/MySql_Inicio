-- Programas almacenados (Stored programs)
-- Consiste en una o más sentencias SQL almacenadas en la base de datos para su uso posterior
-- dentro de un programa almacenado puedes escribir código procedimental el cual
-- puede controlar el flujo de ejecución. por ejemplo if, loops, error handing

-- 4 tipos de programas  almacenados en mysql:
	-- Stored Procedure: Pueden ser accedidos desde una pliación dcon acceso a la base de datos
    -- Stored funtion: Pueden ser llamdados desde una sentencias SQL
    -- Trigger: Se ejecuta en respuesta a una isntrucción Select, update or delete
			-- en una tabla de una base de datos 
	-- Event:  es ejecutada en un tiempo programado 
    
-- Sentencias SQL para controlar el flujo de ejecución
	-- if.. elseif... else
    -- case... when... else
    -- while... do.. loop
    -- repeat... until... end repeat
    -- declare cursor for					define un result set que puede ser procesado por un loop
    -- declare ... handles					define un manejador que se ejecuta cuando un programa alamcenado encuentra un error
    -- select								regresa un result set en la llamada al programa

DELIMITER //
-- Crea un procedimiento almacenado
create procedure prueba()
begin
	select  'Prueba1' as 'mensaje', -- datos fijos
			'Prueba2' as 'mensaje2',
            'Prueba3' as 'mensaje3';
end //
-- Restablece el delimitador a ;
DELIMITER ;

-- llamando al procedure prueba
call prueba();

-- eliminar procedure
drop procedure prueba;

-- procedure datos dinámicos
-- 
drop procedure prueba2;
DELIMITER //
-- Crea un procedimiento almacenado
create procedure prueba2()
begin
	-- consulta de cuántos estatus nuevo hay
	declare nuevo int; -- declaramos una variable 
    declare finalizado int;
    
	select count(*) 
	into nuevo -- todo lo de la consulta que se guarde en la variable
    from bdPendiente.pendientes
	inner join bdPendiente.estatuspendiente on estatuspendiente.id=pendientes.idEstatusPendediete
	where estatuspendiente.estatus='Nuevo';

	select count(*) 
	into finalizado -- todo lo de la consulta que se guarde en la variable
    from bdPendiente.pendientes
	inner join bdPendiente.estatuspendiente on estatuspendiente.id=pendientes.idEstatusPendediete
	where estatuspendiente.estatus='Finalizado';
    
	select  nuevo as 'Estatus Nuevos', 
			finalizado as 'Estatus Finalizados', 
            'Prueba3' as 'mensaje3';
end //
-- Restablece el delimitador a ;
DELIMITER ;

call prueba2();

