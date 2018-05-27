-- 20. Buscar qué departamentos tienen más de cuatro personas trabajando.

SELECT
	emp2.Dept_No, dep2.Dnombre, COUNT(emp2.Dept_No) AS Num_Emp
FROM
	Emp2 INNER JOIN Dep2 ON (emp2.Dept_No = dep2.Dept_No)
GROUP BY
	emp2.Dept_No, dep2.Dnombre
HAVING
	COUNT(emp2.Dept_No) > 4

-- CUANDO SE HACE UN COUNT(), SUM() o lo que sea, es necesario que todas las demas columnas aparezcan en el GROUP BY.