-- Las sentencias DDL se utilizan para describir una base de datos, para definir su estructura, para crear sus objetos y para crear los subobjetos de la tabla.

-- Creando una base de datos llamada bdTemporal
create database bdTemporal;

-- Creando una base de datos llamada bdTemporal  si no existe 
create database if not exists bdTemporal1;

-- Borrando base de datos
drop database bdTemporal1;

-- Borrando base de datos si existe
drop database if exists bdTemporal1;

-- Seleccionar base de datos deseada
use bdTemporal;
