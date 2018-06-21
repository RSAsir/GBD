/* 9. Para cada empleado se pide que salga su salario total (salario más comisión) y luego su salario fragmentado, 
es decir unidades de mil, centenas, decenas y unidades. 
(No se han contemplado valores decimales en los salarios y se presupone que todos son de 3 y 4 dígitos). 
La salida se ordenará por salario en orden ascendente y apellido en orden descendente. */

SELECT
	Apellido, Salario, Comision, (Salario + ISNULL(Comision, 0)) AS Total, 
	SUBSTRING(CAST(CAST(Salario + ISNULL(Comision, 0) AS INT) AS CHAR(4)), 1, 1) AS M,
	SUBSTRING(CAST(CAST(Salario + ISNULL(Comision, 0) AS INT) AS CHAR(4)), 2, 1) AS C,
	SUBSTRING(CAST(CAST(Salario + ISNULL(Comision, 0) AS INT) AS CHAR(4)), 3, 1) AS D,
	SUBSTRING(CAST(CAST(Salario + ISNULL(Comision, 0) AS INT) AS CHAR(4)), 4, 1) AS U
FROM
	EMP2
WHERE Salario + ISNULL(Comision, 0) >= 1000
UNION
SELECT
	Apellido, Salario, Comision, (Salario + ISNULL(Comision, 0)) AS Total, 
	0 M,
	SUBSTRING(CAST(CAST(Salario + ISNULL(Comision, 0) AS INT) AS CHAR(4)), 1, 1) AS C,
	SUBSTRING(CAST(CAST(Salario + ISNULL(Comision, 0) AS INT) AS CHAR(4)), 2, 1) AS D,
	SUBSTRING(CAST(CAST(Salario + ISNULL(Comision, 0) AS INT) AS CHAR(4)), 3, 1) AS U
FROM
	EMP2
WHERE Salario + ISNULL(Comision, 0) < 1000
-- Se hace un doble CAST por que CHAR no funciona al no tener espacio suficiente para convertir el dinero.
ORDER BY TOTAL ASC