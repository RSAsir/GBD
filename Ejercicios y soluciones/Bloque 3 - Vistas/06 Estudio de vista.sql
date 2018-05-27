/* 6. Create View emp_cua as
Select dept_no, sum(salario) sumasalarial from emp2
Estudiar esta vista. */

CREATE VIEW Emp_Cua AS
SELECT 
	Dept_No, SUM(salario) SumaSalarial 
FROM
	Emp2
GROUP BY
	Dept_No

-- El error de esta vista se produce, por que no se pueden sumar los numeros de departamentos.
-- Para arreglar esto, se hace un GROUP BY y sacamos la suma de cada uno.
-- Eso o eliminamos todo rastro de "Dept_No" en caso de querer el total de todos los departamentos.