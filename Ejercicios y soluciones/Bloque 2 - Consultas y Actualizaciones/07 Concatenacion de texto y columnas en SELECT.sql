/* 7. Queremos conseguir un listado de la siguiente forma:
	- El departamento de CONTABILIDAD est� en SEVILLA
	- El departamento de INVESTIGACION est� en MADRID
	- El departamento de VENTAS est� en BARCELONA
	- El departamento de PRODUCCION est� en BILBAO */

SELECT
	'El departamento de '+ DNOMBRE + ' esta en '+ LOC AS Localizaciones
FROM
	DEP2