/* 7. Queremos conseguir un listado de la siguiente forma:
	- El departamento de CONTABILIDAD está en SEVILLA
	- El departamento de INVESTIGACION está en MADRID
	- El departamento de VENTAS está en BARCELONA
	- El departamento de PRODUCCION está en BILBAO */

SELECT
	'El departamento de '+ DNOMBRE + ' esta en '+ LOC AS Localizaciones
FROM
	DEP2