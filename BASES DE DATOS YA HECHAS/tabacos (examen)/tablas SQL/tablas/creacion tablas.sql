--creacion de tablas de tabacos

create table fabricantes (
cod_fab varchar(8),
nombre varchar(25) not null,
pais varchar(20) not null,
constraint pk_cod_fab primary key(cod_fab),
constraint uq_cod_fab unique(nombre))

-- creacion de la tabla cigarrillo
create table cigarrillo(
cod_fab varchar(8),
cod_marca varchar(8),
nombre_marca varchar(20),
constraint pk_cigarrillo primary key(cod_fab,cod_marca),
constraint uq_nombre_marca unique(nombre_marca),
constraint fk_cod_fab_cig foreign key(cod_fab) references fabricantes(cod_fab))

-- creacion de la tabla manufactura. cada marca de cigarrillos se manufactura de una única forma.

create table manufactura(
cod_fab varchar(8),
cod_marca varchar(8),
carton numeric(2) not null, -- contiene el numero de paquetes que hay en un cartón y será mayor de 0
cajetilla numeric(2) not null,-- contiene el numero de cigarrillos que hay en un paquete y será mayor de 0
constraint pk_manufactura primary key(cod_fab,cod_marca),
constraint fk_cod_fab_manu foreign key(cod_fab,cod_marca) references cigarrillo(cod_fab,cod_marca),
constraint ck_carton check(carton>0),
constraint ck_cajetilla check(cajetilla>0)
)

-- tabla tipo_cigarrillo. contiene la información de los tipos de cigarrillo que existen: con filtro o no, negro(N) o rubio(R),
--clase (light, extralight, ultralight, superlight, o normal)

create table tipo_cigarrillo(
cod_fab varchar(8),
cod_marca varchar(8),
cod_tipo varchar(8),
filtro char(1) not null, 
color char(1) not null,
clase varchar(10) not null,
mentol char(1) not null,
constraint pk_tipo_cigarrillo primary key(cod_fab,cod_marca,cod_tipo),
constraint fk_fab_marca_tipo foreign key(cod_fab,cod_marca) references cigarrillo(cod_fab,cod_marca),
constraint ck_filtro check(filtro in ('s','n')),
constraint ck_color check(color in ('n','r')),--'n' hoja negra y 'r' hoja rubia
constraint ck_clase check(clase in ('light', 'extralight', 'ultralight', 'superlight','normal')),
constraint ck_mentol check(mentol in ('s','n')))


alter table tipo_cigarrillo
add constraint uq_fab_marca_tipo unique(cod_marca,filtro,color,clase,mentol)

-- tabla cig_tipo que contendrá los valores de nicotina,alquitran,nonóxido de carbono, precios de compra y venta de
--todos los cigarrillos, y que se podría haber incluido en la tabla de arriba. hacemos los alter table.

alter table tipo_cigarrillo
add  nicotina numeric(3,1) not null

alter table tipo_cigarrillo
add alqutran numeric(3,1) not null

alter table tipo_cigarrillo
add monoxido_carbono numeric(3,1) not null

alter table tipo_cigarrillo
add  precio_compra money not null

alter table tipo_cigarrillo
add precio_venta money not null

--añadimos la restriccion de que el precido de venta será mayor o igual al de compra

alter table tipo_cigarrillo
add constraint ck_precio check(precio_compra<=precio_venta)


--tabla estanco. clave alterna la expendiduria y el cp. No hay dos expendidurias iguales en la misma ciudad.
--no sirve el nombre de la misma, puesto que las ciudades se repiten.

--cada estanco tiene asociado su nif, aunque pertenezca a la misma persona

create table estanco(
nif varchar(9),
nombre varchar(20),
expendiduria int not null,
cp numeric(5) not null,

direccion varchar(40) not null,
ciudad varchar(20) not null,
provincia varchar(20) not null,

constraint pk_nif primary key(nif),
constraint uq_exp_cp unique(expendiduria,cp)) 


-- tabla almacén contiene las unidades en existencia de los cigarrillos. el valor de unidades será >=0, si el 
--cigarrillo se vendió o no aparecerá si nunca lo hizo.

create table almacen(
nif varchar(9),
cod_fab varchar(8),
cod_marca varchar(8),
cod_tipo varchar(8),
unidades int not null,
constraint pk_almacen primary key(nif,cod_fab,cod_marca,cod_tipo),
constraint fk_almacen foreign key(cod_fab,cod_marca,cod_tipo) references tipo_cigarrillo(cod_fab,cod_marca,cod_tipo),
constraint ck_unidades check(unidades>=0),
constraint fk_nif foreign key (nif) references estanco(nif))



--tabla de compras realizadas por los estancos, interesa en el dia. la cant comprada será mayor que 0

create table compras(

nif varchar(9),
cod_fab varchar(8),
cod_marca varchar(8),
cod_tipo varchar(8),
fecha_compra date not null default getdate(),
cant_comprada int not null,
constraint pk_compras primary key(nif,cod_fab,cod_marca,cod_tipo,fecha_compra),
constraint fk_compras foreign key(cod_fab,cod_marca,cod_tipo) references tipo_cigarrillo(cod_fab,cod_marca,cod_tipo),
constraint ck_cant_comprada check(cant_comprada>=0),
constraint fk_nif_compras foreign key (nif) references estanco(nif))


--las ventas igual que el anterior

create table ventas(

nif varchar(9),
cod_fab varchar(8),
cod_marca varchar(8),
cod_tipo varchar(8),
fecha_venta date not null default getdate(),
cant_vendida int not null,
constraint pk_ventas primary key(nif,cod_fab,cod_marca,cod_tipo,fecha_venta),
constraint fk_ventas foreign key(cod_fab,cod_marca,cod_tipo) references tipo_cigarrillo(cod_fab,cod_marca,cod_tipo),
constraint ck_cant_vendida check(cant_vendida>=0),
constraint fk_nif_ventas foreign key (nif) references estanco(nif))
