-- 4. Hacer un join de la tabla Dep2 y la vista de los departamentos 10 y 20

SELECT
	d20.Dept_No,emp2.Emp_no, emp2.Apellido, emp2.Oficio, emp2.Salario, d20.Dnombre
FROM
	EMP2 INNER JOIN VW_Dep10_Dep20 d20 ON ( EMP2.Dept_No = d20.Dept_No)

-- Muestra todos los empleados y diferentes caracteristicas sobre ellos que trabajan en los departamentos 10 y 20.