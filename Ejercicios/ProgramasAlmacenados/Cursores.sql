-- Los cursores en MySQL son utilizados para iterar a través de un conjunto de resultados fila por fila. Son especialmente útiles en procedimientos almacenados cuando necesitas procesar resultados uno a uno. Aquí tienes una guía básica sobre cómo usar cursores en MySQL.

use bdPendiente;

drop procedure if exists cursores;
delimiter //
create procedure cursores()
begin 
	declare id_persona_var int;
    declare telefono_var varchar(30);
    declare row_not_found  tinyint default false;  -- bandera
    declare update_count int default 0 ; -- guardar las filas modificadas
    
    -- declarando el cursos
    -- aquí no hay valores a alamcenar como into, el cursor realiza esto
    declare id_persona_cursor cursor for 
    select id, telefono from personas
    where correo like '%hotmail%';
    
    -- declarando un manejador de rerrores para cuando el cursor no encuentre m´pas
    declare continue handler for not found -- manejador para cuando no haya más renglones
											-- Los cursores en MySQL son utilizados para iterar a través de un conjunto de resultados fila por fila. Son especialmente útiles en procedimientos almacenados cuando necesitas procesar resultados uno a uno. Aquí tienes una guía básica sobre cómo usar cursores en MySQL.
    set row_not_found = true;
    
    -- abrir el cursor
    open id_persona_cursor;
    while row_not_found = false do
		-- obeteniendo los valores del renglón y almacenandolos en variables
		fetch id_persona_cursor into id_persona_var,telefono_var; -- guardar en cada variable el valor que estemos ttrebajando en el cursosr
        if length(telefono_var)>0 then -- esto quiere decir que la persona spi tiene un número de telefono guardado
			update pendientes
			set observaciones=telefono_var
            where id=id_persona_var;
		else  -- número de telefono vacío
			update pendientes
			set observaciones='Favor de solicitar el número de teléfono'
            where id=id_persona_var;
            set update_count=update_count+1; -- cuántas personas hay que solicitarles el telefono
        end if;
    end while;
    -- crerrando cursos
    close id_persona_cursor;
    
    select concat(update_count, ' necesitan teléfono');
    
end//
delimiter ;

call cursores();