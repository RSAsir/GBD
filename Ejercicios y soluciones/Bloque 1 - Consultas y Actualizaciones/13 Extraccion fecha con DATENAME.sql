/* 13. Se pide el nombre, oficio y fecha de alta del personal del departamento 20 que gana más de 1500€, mensuales. 
La salida tendrá el siguiente formato: ( VER DOCUMENTO) */

SELECT
	Apellido, Oficio, DATENAME(DW, Fecha_Alt) + ' ' + DATENAME(MM, Fecha_Alt) + ' ' + DATENAME(DD, Fecha_Alt) + ' de ' + DATENAME(YY, Fecha_Alt) + ' ' + DATENAME(HH, Fecha_Alt) + ':' + DATENAME(MI, Fecha_Alt) AS Fecha_Alta, Salario*1.0 AS Salario
FROM
	Emp2
WHERE
	(Salario > 1500) AND (Dept_No = 20)