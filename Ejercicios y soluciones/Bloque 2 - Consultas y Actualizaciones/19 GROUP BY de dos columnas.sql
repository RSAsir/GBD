/* 19. Calcular el número de personas que realizan cada oficio en cada departamento. 
La salida deberá mostrar: Número de Dpto. Oficio y número de empleados que lo desempeñan. */

SELECT
	Dept_No, Oficio, COUNT(Oficio) AS Personas
FROM
	Emp2
GROUP BY
	Dept_No, Oficio
ORDER BY
	Dept_No