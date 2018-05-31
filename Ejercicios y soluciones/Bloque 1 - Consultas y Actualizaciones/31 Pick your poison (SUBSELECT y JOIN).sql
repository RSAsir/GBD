/* 31. Listar, a partir de las tablas EMP2 y DEPT2, el nombre de cada empleado, su oficio, 
su número de departamento y el nombre del departamento en el que trabajan. (Obtener la salida ordenada por número de departamento). */

-- VERSION SUBSELECT
SELECT
	Apellido, Oficio, Dept_No, (SELECT DNombre FROM Dep2 d WHERE d.Dept_No = e.Dept_No) AS Departamento
FROM
	Emp2 e
ORDER BY Dept_No

-- VERSION JOIN
SELECT
	Apellido, Oficio, e.Dept_No, DNombre AS Departamento
FROM
	Emp2 e INNER JOIN Dep2 d ON (d.Dept_No = e.Dept_No)
ORDER BY e.Dept_No