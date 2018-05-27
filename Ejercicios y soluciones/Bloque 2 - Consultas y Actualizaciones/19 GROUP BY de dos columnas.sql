/* 19. Calcular el n�mero de personas que realizan cada oficio en cada departamento. 
La salida deber� mostrar: N�mero de Dpto. Oficio y n�mero de empleados que lo desempe�an. */

SELECT
	Dept_No, Oficio, COUNT(Oficio) AS Personas
FROM
	Emp2
GROUP BY
	Dept_No, Oficio
ORDER BY
	Dept_No