/* 23. Se desea saber, el salario total (salario+comisión) medio anual de los vendedores de
nuestra empresa. */

SELECT
	Oficio, COUNT(Oficio) AS Numero_Empleados, 
	SUM(Salario) AS Total_Salarios, 
	SUM(Comision) AS Total_Comisiones, 
	AVG(Salario + ISNULL(Comision, 0)) AS Medio_Anual
FROM
	Emp2
WHERE
	Oficio = 'Vendedor'
GROUP BY
	Oficio