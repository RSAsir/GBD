/* 30. Queremos saber el máximo y el mínimo y la media salarial, de cada uno de los departamentos. La salida tendrá el siguiente formato: 

												COMENTARIO		VALOR		DEPT_NO
												Máximo-->		3906.57			10
												Media-->		2278.93			10
												Media-->		1015.71			10		*/

SELECT 
	'Maximo-->' AS Comentario, MAX(Salario) AS Valor, Dept_No
FROM
	Emp2
GROUP BY
	Dept_No

/* Con esta primera select, tomamos todos los salarios maximos de los diferentes departamentos, para el resto de valores
es necesario ejecutar un UNION (La columna comentario es importante). */

UNION

SELECT 
	'Media-->' AS Comentario, AVG(Salario) AS Valor, Dept_No
FROM
	Emp2
GROUP BY
	Dept_No

UNION

SELECT 
	'Minimo-->' AS Comentario, MIN(Salario) AS Valor, Dept_No
FROM
	Emp2
GROUP BY
	Dept_No
ORDER BY Dept_No