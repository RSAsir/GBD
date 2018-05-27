/* 4. Mostrar para todos los hospitales, el código de hospital, el nombre del hospital y el nombre abreviado en tres letras 
(a este campo, podemos llamarle ABR). Obtener la recuperación ordenada por ABR. */

SELECT
	Hospital_Cod, Nombre, UPPER (CAST(Nombre AS CHAR(3))) AS ABR
FROM
	Hospital
ORDER BY
	3