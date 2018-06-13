/* 12. El director general desea conocer, de los departamentos que tienen director en funciones, el número de empleados, la suma de sus salarios, 
de sus comisiones y el número de hijos. */

CREATE VIEW VW_Suma_departamentos_en_funciones AS 
	SELECT
		td.Numde, DNombre AS Departamento, COUNT(NumEm) AS Numero_empleados, SUM(Salario) AS Salario, SUM(ISNULL(0,Comision)) AS Comision, SUM(NumHi) AS Numero_hijos
	FROM
		TDepto td INNER JOIN Temple t ON ( t.Numde = td.NumDe)
	WHERE
		TDir = 'F'
	GROUP BY
		td.Numde, DNombre
