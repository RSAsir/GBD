/* 28. Se desea obtener un informe matriz como el que se presenta, 
en el que la coordenada vertical hace referencia a los distintos oficios existentes en la empresa, 
y la coordenada horizontal a los distintos departamentos. Los valores de la matriz, 
indicaran la suma de salarios por oficio y departamento. La última columna indica la suma total de salarios por Oficio. */

SELECT
	DISTINCT Oficio, 
	ISNULL(SUM(CASE Dept_No WHEN 10 THEN Salario END), 0) AS Dept10, 
	ISNULL(SUM(CASE Dept_No WHEN 20 THEN Salario END), 0) AS Dept20, 
	ISNULL(SUM(CASE Dept_No WHEN 30 THEN Salario END), 0) AS Dept30, 
	ISNULL(SUM(CASE Dept_No WHEN 40 THEN Salario END), 0) AS Dept40, 
	SUM(Salario) AS Total
FROM
	Emp2
GROUP BY
	Oficio
ORDER BY
	Total DESC

-- Prestar atencion a las agrupaciones

