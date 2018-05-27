/* 11. Encuentre todas las enfermera y enfermeros indicando el salario mensual de cada uno. 
(Todos los salarios que aparecen en la base de datos son anuales y no se consideran las pagas extraordinarias). */

SELECT
	Apellido, Funcion, Salario, (Salario/12) AS Salario_Mes
FROM
	Plantilla
WHERE
	Funcion LIKE 'Enfermer%'

-- Podemos aplicar un ROUND() sobre Salario/12 para redondearlo.