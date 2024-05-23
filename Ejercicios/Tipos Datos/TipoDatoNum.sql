-- ENUM derivado de tipo de dato String
drop table tiposDatos;
create table tiposDatos(
	tipoRopa varchar(40),
    -- enum sirve porque solo utiliza un byte para cada elemento, como un diccionario
	tamano enum('x-pequeño','pequeño','mediano','largo', 'x-largo') -- not null -- acepta hasta 65535 elemenots y solo puede almacenar un valor
) engine=InnoDB default charset=utf8mb4 collate=utf8mb4_0900_ai_ci;

delete from tiposDatos;
insert into tiposdatos (tipoRopa,tamano) values ("pantalon","mediano"),("pantalon","x-largo");
-- insert into tiposdatos (tipoRopa,tamano) values ("blusa",""); -- No se puede porque no existe "" en tamano
insert into tiposdatos (tipoRopa,tamano) values ("hat",null);  --  si no se le asigna un valor poner nuill si es permitido
-- insert into tiposdatos (tipoRopa,tamano) values ("calcetin");
select * from tiposdatos;

select * from tiposDatos where tamano="mediano"; 