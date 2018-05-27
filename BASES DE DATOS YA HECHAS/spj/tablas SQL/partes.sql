--DROP TABLE P;
create table p
(p# char(2) constraint pk_p# primary key,
 nomp varchar(15) constraint nn_nomb not null,
 color varchar(10),
 peso int,
 ciudad varchar(10));

INSERT INTO P VALUES ('P1','Tuerca','Rojo',12,'Londres');
INSERT INTO P VALUES ('P2','Perno','Verde',17,'Paris');
INSERT INTO P VALUES ('P3','Tornillo','Azul',17,'Roma');
INSERT INTO P VALUES ('P4','Tornillo','Rojo',14,'Londres');
INSERT INTO P VALUES ('P5','Leva','Azul',12,'Paris');
INSERT INTO P VALUES ('P6','Rueda','Rojo',19,'Londres');
