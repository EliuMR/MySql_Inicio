-- Borrando base de datos
drop database if exists bdPendiente;

create database if not exists bdPendiente default character set utf8mb4 collate utf8mb4_0900_ai_ci;
show databases;
use bdPendiente;
create table if not exists estatusPendiente(
	id int not null		auto_increment primary key,
    estatus varchar(45) not null
)engine=InnoDB;

create table if not exists personas(
	id int not null auto_increment primary key,
    nombre varchar(45) not null,
    correo varchar(45),
    telefono varchar(45)
	
)engine=InnoDB;

create table if not exists tipoIngresoEgreso(
	id int not null primary key auto_increment,
    descripcion varchar(40) not null
)engine=InnoDB;


create table if not exists grupoIngresoEgreso(
	id int primary key auto_increment not null,
    descripcion varchar(40) not null,
    observaciones varchar (50)
)engine=InnoDB;

create table if not exists pendientes(
	id int not null		auto_increment 	primary key,
    fechaCreacion datetime not null,
    fechaEntrega datetime not null,
    descripcion varchar(250),
    idEstatusPendediete int not null, -- llave foranea
    observaciones varchar(250),
    idPersonaAsignado int not null, -- llave foranea
    idPersonaQueAsigno int not null, -- llave foranea
    solucionPendiente varchar(250),
    constraint fkPendientes
    foreign key (idEstatusPendediete)
    references estatusPendiente (id)
    on update no action
    on delete no action,
    
    index fkPendientesPersona1_idx (idPersonaAsignado asc),
    constraint fkPendientesPersona1
    foreign key (idPersonaAsignado)
    references personas (id)
    on update no action
    on delete no action,
    
    index fkPendientesPersona2_idx (idPersonaQueAsigno asc),
    constraint fkPendientesPersona2
    foreign key (idPersonaQueAsigno)
    references personas (id)
    on delete no action
    on update no action
)engine=InnoDB;

create table if not exists usuarios(
	id int not null auto_increment primary key,
    nombre varchar(45) not null,
    pasword varchar(45) not null,
    idPersona int not null,
    
    index fkUsuariosPersonas_idx (idPersona asc),
    constraint fkUsuariosPersonas
    foreign key (idPersona)
    references personas(id)
    on delete no action
	on update no action
)engine=InnoDB;


create table if not exists ingresosEgresos(
	id int not null primary key auto_increment,
    descripción varchar(250) not null,
    idTipoIngresoEgreso int not null, -- llave foranea
    idGrupoIngresoEgreso int not null, -- llave foranaea
    observaciones varchar(250),
    
    index fkIngresosEgresosTipoIngresoEgreso_idx(idTipoIngresoEgreso asc),
    constraint fkIngresosEgresosTipoIngresoEgreso
    foreign key (idTipoIngresoEgreso)
    references tipoIngresoEgreso(id)
    on delete no action
	on update no action,
    
    index fkIngresosEgresosGrupoIngresoEgreso_idx (idGrupoIngresoEgreso asc),
    constraint fkIngresosEgresosGrupoIngresoEgreso
    foreign key (idGrupoIngresoEgreso)
    references grupoIngresoEgreso(id)
    on delete no action
    on update no action
)engine=InnoDB;


create table if not exists entradaSalidaDinero(
	id int auto_increment primary key not null,
    fechaEs datetime not null,
    idIngresosEgresos int not null, -- foreign key
    montoIE decimal(8,2) not null,
    idPersonaRegistro int not null, -- foreign key
    observaciones varchar(200),
    
    index fkEntradaSalidaDineroIngresosEgresos_idx (idIngresosEgresos asc),
    constraint fkEntradaSalidaDineroIngresosEgresos
    foreign key (idIngresosEgresos)
    references ingresosEgresos (id)
    on delete no action,
    
    index fkEntradaSalidaDinero_idx (idPersonaRegistro asc),
    constraint fkEntradaSalidaDinero
    foreign key (idPersonaRegistro)
    references personas (id)
    on delete no action
    on update no action
)engine=InnoDB;





