-- 17. Encontrar el salario más alto y más bajo de la tabla empleados, así como la diferencia entre ambos.

SELECT
	MIN(Salario) AS Minimo, MAX(Salario) AS Maximo, MAX(Salario) - MIN(Salario) AS Direferencia
FROM
	Emp2