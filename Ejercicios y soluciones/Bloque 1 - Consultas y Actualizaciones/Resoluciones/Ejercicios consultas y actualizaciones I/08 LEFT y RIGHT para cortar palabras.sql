/* 8. Para cada empleado cuyo apellido contenga una "N", queremos que nos devuelva "nnn", pero sólo para la primera ocurrencia de "N". 
La salida estará ordenada por apellido en orden descendente. */

SELECT
	Apellido, LEFT(Apellido, CHARINDEX('n',apellido)-1) + 'nnn' + RIGHT(Apellido, LEN(Apellido) - CHARINDEX('n',apellido)), LEN(APELLIDO) AS Longitud, CHARINDEX('n',apellido) AS N, LEFT(Apellido, CHARINDEX('n',apellido)-1) AS Izquierda, RIGHT(Apellido, LEN(Apellido) - CHARINDEX('n',apellido)) AS Derecha
FROM
	Plantilla
WHERE
	Apellido LIKE '%n%'