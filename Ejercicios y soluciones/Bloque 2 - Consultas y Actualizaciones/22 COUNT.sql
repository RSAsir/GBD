/* 22. Se desea saber el n�mero de empleados por departamento que tienen el oficio de
"EMPLEADO", la salida se ordenar� por n�mero de departamento. */

SELECT
	dep2.Dept_No, DNombre, COUNT(Oficio) AS Num_Empleados
FROM
	Emp2 INNER JOIN Dep2 ON (emp2.Dept_No = dep2.Dept_No)
WHERE
	Oficio = 'Empleado'
GROUP BY
	dep2.Dept_No, DNombre
ORDER BY
	Dept_No