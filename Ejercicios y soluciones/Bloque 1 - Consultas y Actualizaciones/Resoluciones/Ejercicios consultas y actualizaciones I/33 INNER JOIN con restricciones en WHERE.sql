/* 33. Se desea conocer el nombre y el oficio de todos aquellos empleados que trabajan en Madrid. La salida estará ordenada por el campo oficio. */

SELECT
	Apellido, Oficio
FROM
	Emp2 e INNER JOIN Dep2 d ON (e.Dept_No = d.Dept_No)
WHERE
	Loc = 'Madrid'
ORDER BY Oficio

-- Se puede hacer con una subselect, para ello, esta se realiza dentro del where poniendo la codicion, seguida de IN y luego la SELECT.