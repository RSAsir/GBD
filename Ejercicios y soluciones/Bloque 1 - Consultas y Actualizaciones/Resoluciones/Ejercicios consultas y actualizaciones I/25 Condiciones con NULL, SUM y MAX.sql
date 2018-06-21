/* 25. Se desea saber para cada departamento y en cada oficio, el m�ximo salario y la suma total de los salarios, 
pero s�lo de aquellos cuya suma salarial supere o sea igual al 50% de su m�ximo salario. 
En el muestreo, s�lo se estudiaron aquellos empleados que no tengan comisi�n o la tengan menor que el 25% de su salario. 
La salida tendr� el siguiente formato:
	DEPT_NO		OFICIO		SUMA	M�XIMO */

SELECT
	Dept_No, Oficio, SUM(Salario) AS Suma, MAX(Salario) AS Maximo
FROM
	Emp2
WHERE
	Comision IS NULL OR Comision < 0.25 * Salario
GROUP BY
	Dept_No, Oficio
HAVING
	SUM(Salario) >= (MAX(Salario) / 2)
ORDER BY Dept_No
