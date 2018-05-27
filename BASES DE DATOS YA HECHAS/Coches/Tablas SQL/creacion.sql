
create table marcas(
cifm varchar(9)
	constraint pk_cifm primary key
	constraint ck1_cifm check(cifm=upper(cifm)),
nombre varchar(10),
ciudad varchar(20));

create table clientes(
dni int
	constraint pk_dni primary key,
nombre varchar(20),
apellido varchar(20),
ciudad varchar(10));


create table concesionario(
cifc varchar(9)
	constraint pk_cifc primary key
	constraint ck1_cifc check(cifc=upper(cifc)),
nombre varchar(10),
ciudad varchar(20));

create table coches(
codcoche int
	constraint pk_codcoche primary key,
nombre varchar(10),
modelo varchar(8));

create table ventas(
cifc varchar(9)
	constraint fk_cifc references concesionario(cifc),
dni int
	constraint fk_dni references clientes(dni),
codcoche int
	constraint fk_codcoche references coches(codcoche),
color varchar(8));


create table distribucion(
cifc varchar(9)
	constraint fk_cifc1 references concesionario(cifc),
codcoche int
	constraint fk_codcoche2 references coches(codcoche),
cantidad int
	constraint ck_cantidad check(cantidad > 0),
constraint pk_distribucion primary key(cifc,codcoche));



create table marco(
cifm varchar(9)
	constraint fk_cifm references marcas(cifm),
codcoche int
	constraint fk_codcoche1 references coches(codcoche),
constraint pk_marco primary key(cifm,codcoche));
