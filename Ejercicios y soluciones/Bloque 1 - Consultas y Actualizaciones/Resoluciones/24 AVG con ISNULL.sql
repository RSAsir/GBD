/* 24. Se desea saber el salario total (salario+comisi�n) medio anual, tanto de los empleados
como de los vendedores de nuestra empresa. La salida tendr� el siguiente formato: (VER DOCUMENTO) */

SELECT
	Oficio, AVG(Salario + ISNULL(Comision,0)) AS 'Salario medio anual'
FROM
	Emp2
WHERE
	Oficio = 'Empleado' OR Oficio = 'Vendedor'
GROUP BY
	Oficio