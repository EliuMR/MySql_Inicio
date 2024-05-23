-- CONCAT concatenar cadenas
-- concat (string1[,string2]...) string1 puede ser una cadena fija un campo, o una función propia de lla base de datos

-- Vamos a trabajar con la base de dato de bdPendiente
use bdPendiente;
-- Realiza un ejemplo con la tabla de perosnas en la cualconcatenas tres campos y una función propoa de mysql
-- además de utiliza los apostrofes dentro de la cadena para ver como se utiliza

select *, concat(nombre," con correo: ",correo) as "CampoConcatenado" from personas;

-- con una función
select *, concat(nombre," con correo: ",correo, " con fecha :",now()) as "CampoConcatenado" from personas;

-- apostrofe, campos, función y literal
select *, concat(nombre," ''con correo: ",correo, " con fecha :",now()) as "CampoConcatenado" from personas;
