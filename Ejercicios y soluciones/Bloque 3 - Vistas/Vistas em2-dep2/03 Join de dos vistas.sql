-- 3. Hacer un join entre las dos vistas anteriores.

CREATE VIEW VW_Join_10_20_30 AS
SELECT
	d20.Dept_No, d20.DNombre, d20.Loc
FROM
	VW_Dep10_Dep20 d20 INNER JOIN VW_Dep10_Dep30 d30 ON (d20.Dept_No = d30.Dept_No)
