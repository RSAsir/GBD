-- 1. Crear una vista para los departamentos 10 y 20.

CREATE VIEW VW_Dep10_Dep20 AS
SELECT
	Dept_No, DNombre, Loc
FROM
	Dep2
WHERE
	(Dept_No = 10) OR (Dept_No = 20)