-- 2. Crear una vista para los departamentos 10 y 30

CREATE VIEW VW_Dep10_Dep30 AS
SELECT
	Dept_No, DNombre, Loc
FROM
	Dep2
WHERE
	(Dept_No = 10) OR (Dept_No = 30)