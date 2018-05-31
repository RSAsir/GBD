/* 34. Se desea conocer cuántos empleados existen en cada departamento. 
Devolviendo una salida como la que se presenta y ordenando la salida en orden decreciente de número de empleados. */

SELECT
	e.Dept_No AS Num_Dep, (SELECT d.DNombre FROM Dep2 d WHERE e.Dept_No = d.Dept_No) AS Departamento, COUNT(Oficio) AS N_Emp
FROM
	Emp2 e
GROUP BY
	Dept_No
ORDER BY COUNT(Oficio) DESC

-- Para la subselect, simplemente especificar de donde viene cada cosa al igual que con las join.