/* 6. Hacer un listado del nombre de los pacientes y la posición de la primera "a" que aparezca en el apellido, 
tomando como referencia la primera letra del mismo. */

SELECT
	Apellido, CHARINDEX('a', Apellido) AS CONTEO
FROM
	Enfermo

