-- Operadores like o regexp sirve para recuperar renglones que tengan un patrón
-- llamado máscara. La máscara determina qué valores satisfacen la condición

-- La mascara para el like puede contener simbolos especiales llamados wildcards
-- o comodines, la máscara para regexp contiene constructores y carácteres especiales. usnado ,áscara con regexp se puede decir que noes case-sensitive
 
 -- Like wilcards
 -- Símbolo 	Descripción
 -- %			Coincide con una cadena de cero o más caracteres
 -- - 			Coincide con cualquier carácter
 
 -- Regexp operatos
 -- Constructo	Descripción
 -- ^			Coincide con el patrón desde el comienzo del valor de prueba
 -- $			Coincide con el patrón al final del valor testead
 -- -			Coincide con cualquier valor
 -- [charlist]	Coincide con cualquier caracter dentro de los corchetes
 -- [char1-chae2] Coincide con cualquier carácter entre el rango dado
 -- |			separa dos patrones de cadena y coincide con uno
 
 use dbEmployees;
 select count(*) from employees;
 
 -- selecciona los empleados en donde el nombre tenga la frase SA y 
 -- el apellido tambien tenga sa 
 select * from employees
 where first_name regexp 'SA' and last_name regexp 'sa'; -- no importa el orden sino donde salga sa, es indistinguible usar mayusculas o minusculas
 
  -- selecciona los empleados en donde el nombre empiece la frase SA y 
 -- el apellido tambien empiece tenga sa 
 select * from employees
 where first_name regexp '^SA' and last_name regexp '^sa';
 
-- selecciona los empleados en donde el nombre termine la frase con NA y 
 -- el apellido tambien termine tenga na 
  select * from employees
 where first_name regexp 'nA$' and last_name regexp 'na$';
 
 -- selecciona los empleados en donde el nombre tenga la frase con rs o la frase sn y 
 -- el apellido tambien tenga rs o sn o an
  select * from employees
 where first_name regexp 'rs|sn' and last_name regexp 'rs|sn|an';
 
-- selecciona los empleados en donde el nombre tenga la letra n seguida de una i o una a 
-- el apellido tambien termine tenga una letra n seguida de una u o una e
 select *from employees
 where first_name regexp 'n[ia]' and last_name regexp 'n[ue]';
 
 -- selecciona los empleados en donde el nombre tenga la letra n seguida de un caracter como a,b,c,d,e,f
-- el apellido tambien termine tenga una letra n seguida de una f,g,h,i,j,k
select * from employees
where first_name regexp 'n[a-f]' and last_name regexp 'n[f-k]';

-- selecciona los empleados en donde el nombre tenga la frese mar seguida de una letra i o una y
-- y en seguida de esa letra que le presiga una a o una o en el campo del nombre
select * from employees
where first_name regexp 'mar[iy][ao]';

-- selecciona los empleados cuyo nombre (la parte final) contenga la siguiente combinacipon de caractéres
-- tenga una letra de la a a la z, en seguida de ese caracter tiene que seguir una vocal.alter
-- después de la vocal finaliza con una letra n
select * from employees
where first_name regexp '[a-z][aeiou]n$';

