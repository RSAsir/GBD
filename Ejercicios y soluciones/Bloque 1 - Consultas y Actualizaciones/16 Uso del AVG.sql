-- 16. Encontrar el salario medio de los analistas.

SELECT
	Oficio, AVG(Salario) Salario_Medio
FROM
	Emp2
WHERE Oficio LIKE 'Analista'
GROUP BY
	Oficio