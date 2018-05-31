/* 32. Seleccionar los nombres, profesiones y localidades de los departamentos donde trabajan los analistas. */

SELECT
	Apellido, Oficio, (SELECT Loc FROM DEP2 d WHERE d.Dept_No = e.Dept_No AND Oficio = 'Analista') AS Localidad
FROM
	EMP2 e
WHERE
	Oficio = 'Analista'