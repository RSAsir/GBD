/* 8. Los empleados de los departamentos 111 y 112, desean obtener un listado por orden alfabético de los departamentos, 
que contengan el nombre, edad en años cumplidos, y la edad que tenían cuando ingresaron en la empresa. 
Mostrar esta información tan sólo a los empleados de estos departamentos. */

CREATE VIEW VW_Listado_DEP AS
	SELECT
		NumDe,
		(SELECT DNombre FROM TDepto TDep WHERE TDep.Numde = T.Numde) AS Departamento,  -- MUY IMPORTANTE NO OLVIDAR LA WHERE, SI NO, NO FUNCIONA NADA
		Nombre, 
		(SELECT FLOOR((CAST(CONVERT(VARCHAR(8), GETDATE(), 112) AS INT) - CAST(CONVERT(VARCHAR(8), T.Fecha_Nac,112) AS INT) ) / 10000) FROM Temple T2 WHERE T2.NumEm = T.NumEm) AS Edad_Actual,
		(SELECT FLOOR((CAST(CONVERT(VARCHAR(8), Fecha_Alt, 112) AS INT) - CAST(CONVERT(VARCHAR(8), T.Fecha_Nac,112) AS INT) ) / 10000) FROM Temple T2 WHERE T2.NumEm = T.NumEm) AS Edad_Entrada
	FROM
		Temple T
	WHERE 
		NumDe IN ( 111, 112 )