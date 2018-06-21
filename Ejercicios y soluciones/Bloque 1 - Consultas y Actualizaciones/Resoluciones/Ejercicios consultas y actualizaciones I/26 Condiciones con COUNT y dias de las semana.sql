/* 26. Se desea saber para cada oficio, dentro de cada a�o de alta distinto que existe en nuestra empresa, 
el n�mero de empleados y la media salarial que tiene. Para este estudio no se tendr� en cuenta a los empleados que no hayan 
sido dados de alta en un d�a laboral. Adem�s s�lo se desea saber estos datos, de aquellos oficios y a�os que tienen m�s de 
un empleado. La salida se obtendr� ordenada por a�o de alta y media salarial correspondiente, en orden ascendente. */

SELECT
	Oficio, YEAR(Fecha_Alt) AS A�o, COUNT(Oficio) AS NumEmpleados, AVG(Salario) AS MediaSalario
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