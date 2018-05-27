--DROP TABLE S;
create table s
(s# char(2) constraint pk_s# primary key,
 noms varchar(10) constraint nn_noms not null,
 estado int,
 ciudad varchar(10));

INSERT INTO S VALUES ('S1','Jaramillo',10,'Paris');
INSERT INTO S VALUES ('S2','Salazar',20,'Londres');
INSERT INTO S VALUES ('S3','Bernal',30,'Paris');
INSERT INTO S VALUES ('S4','Caicedo',20,'Londres');
INSERT INTO S VALUES ('S5','Aldana',30,'Atenas');
