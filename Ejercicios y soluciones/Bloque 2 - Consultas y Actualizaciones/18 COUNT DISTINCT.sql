-- 18. Calcular el número de oficios diferentes que hay, en total, en los departamentos 10 y 20 de la empresa.

SELECT
	COUNT (DISTINCT Oficio) AS Oficios
FROM
	Emp2
WHERE
	Dept_No = 10  OR Dept_No = 20