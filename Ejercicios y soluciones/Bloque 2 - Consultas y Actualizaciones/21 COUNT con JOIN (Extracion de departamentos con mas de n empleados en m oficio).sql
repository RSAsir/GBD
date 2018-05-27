-- 21. Buscar qu� departamentos tienen m�s de dos personas trabajando en la misma profesi�n.

SELECT
	emp2.Dept_No, DNombre, Oficio, COUNT(Oficio) AS Num_Emp
FROM
	Emp2 INNER JOIN Dep2 ON (emp2.Dept_No = dep2.Dept_No)
GROUP BY
	emp2.Dept_No, DNombre, Oficio
HAVING
	COUNT(Oficio) > 2

-- Solo es necesario especificar abreviacion cuando hay columnas que se repiten en ambas tablas de la JOIN.