/* 26. Se desea saber para cada oficio, dentro de cada año de alta distinto que existe en nuestra empresa, 
el número de empleados y la media salarial que tiene. Para este estudio no se tendrá en cuenta a los empleados que no hayan 
sido dados de alta en un día laboral. Además sólo se desea saber estos datos, de aquellos oficios y años que tienen más de 
un empleado. La salida se obtendrá ordenada por año de alta y media salarial correspondiente, en orden ascendente. */

SELECT
	Oficio, YEAR(Fecha_Alt) AS Año, COUNT(Oficio) AS NumEmpleados, AVG(Salario) AS MediaSalario
FROM
	Emp2
WHERE
	DATENAME(dw, Fecha_Alt) NOT IN ('Sabado', 'Domingo')
GROUP BY
	Oficio, YEAR(Fecha_Alt)
HAVING
	COUNT(OFICIO) > 1
ORDER BY
	YEAR(Fecha_Alt), AVG(Salario) ASC