-- Dynamic SQL
-- Procedimiento almacenado, se formará conforme los parametros que se vayan recibiendo, por ello dinámica

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

    SET @sqlsentencia = CONCAT('SELECT nombre FROM personas', 
						paramWhere, campo); -- formamos una instrucción con la sintaxis mostrada que representa una cadena con toda la instrucción SQL

    -- estas tres instrucciones son necesarias para que prepare, ejecute y mande a salida los datos arrojados
    PREPARE select_invoices_statement FROM @sqlsentencia;
    EXECUTE select_invoices_statement;
    DEALLOCATE PREPARE select_invoices_statement;
END //
DELIMITER ;

CALL sqldinamic(1, 'JUAN');
call sqldinamic(2,'juan@gmail.com');
call sqldinamic(3,'4935405678');