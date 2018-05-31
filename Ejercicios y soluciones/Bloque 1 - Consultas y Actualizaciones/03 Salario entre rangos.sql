-- 3. Haga un listado de las enfermeras que ganan entre 12.000 € y 15.000€.

SELECT
	Apellido, Salario
FROM
	Plantilla
WHERE
	Salario BETWEEN 12000 AND 15000;