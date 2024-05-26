-- Exists
-- Este operador valida que el registro que se analiza de la consulta principa tenga alguna relación verdadera con el 
-- o los registros arrojados por la subconsulta

use bdPendiente;
-- selecciona todos los registroa de la tabla personas que no tengan un usuario
-- en la tabla de usuarios
select * from personas
where not exists (select * from usuarios where personas.id=usuarios.idPersona);

-- seleciona todas las personas o todos los registros de la tabla personas
-- que no tengan ni un solo registro en la tabla pendientes
select * from personas
where not exists (select * from pendientes where personas.id=pendientes.idPersonaAsignado);

-- selecciona todas las personas de la tabla de personas que no tengan entradas o salidas
-- en la tabla entradaSalidaDinero
select * from personas
where not exists 
(select * from entradasalidadinero where personas.id=entradasalidadinero.idPersonaRegistro);