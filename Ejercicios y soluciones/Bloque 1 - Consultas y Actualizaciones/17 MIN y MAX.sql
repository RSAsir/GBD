-- 17. Encontrar el salario m�s alto y m�s bajo de la tabla empleados, as� como la diferencia entre ambos.

SELECT
	MIN(Salario) AS Minimo, MAX(Salario) AS Maximo, MAX(Salario) - MIN(Salario) AS Direferencia
FROM
	Emp2