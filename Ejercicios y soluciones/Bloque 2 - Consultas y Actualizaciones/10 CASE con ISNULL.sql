/* 10. Para cada empleado que no tenga comisi�n o cuya comisi�n sea mayor del 15% de su salario, sE pide el salario total que tiene. 
Esto es, si tiene comisi�n, su salario m�s la comisi�n, si no la tiene su salario m�s el 15% del mismo. 
La salidas se ordenar� por oficio y salario en orden descendente. */

SELECT
	Apellido, Oficio, Salario, Comision, Total=CASE ISNULL(Comision,0)
		WHEN 0 THEN Salario*1.15
		ELSE Salario + Comision
	END
FROM
	EMP2
ORDER BY Oficio, Salario DESC