
-- Dynamic SQL
-- mantenimiento de procedimiento es modificar para realizar más lecturas
-- Procedimiento almacenado, se formará conforme los parametros que se vayan recibiendo, por ello dinámica
use bdPendiente;

DROP PROCEDURE IF EXISTS sqldinamic;
DELIMITER //

CREATE PROCEDURE sqldinamic(campoSeleccionado INT, valor VARCHAR(40))
BEGIN
    DECLARE paramWhere VARCHAR(100); -- variable que formará la instrucción where al final
    DECLARE campo VARCHAR(100);      -- variable que guardará el valor del campo seleccionado en parámetros
    SET paramWhere = ' WHERE';       -- se inicializa parámetro where
    SET campo = '';

    IF (campoSeleccionado = 1) THEN
        SET campo = CONCAT(" nombre = '", valor, "'");
    END IF;

    IF (campoSeleccionado = 2) THEN
        SET campo = CONCAT(" correo = '", valor, "'");
    END IF;

    IF (campoSeleccionado = 3) THEN
        SET campo = CONCAT(" telefono = '", valor, "'");
    END IF;
	
    IF (campoSeleccionado = 4) THEN
        SET campo = CONCAT(" id = '", valor, "'");
    END IF;
    
    IF (campoSeleccionado = 5) THEN
        SET campo = CONCAT(" nombre like '%", valor, "%'");
    END IF;
    
    SET @sqlsentencia = CONCAT('SELECT 
						id,nombre,correo,telefono,
                        nombre FROM personas', 
						paramWhere, campo); -- formamos una instrucción con la sintaxis mostrada que representa una cadena con toda la instrucción SQL

    -- estas tres instrucciones son necesarias para que prepare, ejecute y mande a salida los datos arrojados
    PREPARE select_invoices_statement FROM @sqlsentencia;
    EXECUTE select_invoices_statement;
    DEALLOCATE PREPARE select_invoices_statement;
END //
DELIMITER ;

CALL sqldinamic(1, 'JOSE LUIS MONTEZ QUIÑONES-');
call sqldinamic(2, 'gilberto@hotmail.com');
call sqldinamic(3, '4935405678');
call sqldinamic(4, 6);
call sqldinamic(5, 'AN');