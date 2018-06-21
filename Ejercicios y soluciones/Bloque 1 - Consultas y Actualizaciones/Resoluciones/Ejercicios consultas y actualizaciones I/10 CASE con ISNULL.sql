/* 10. Para cada empleado que no tenga comisión o cuya comisión sea mayor del 15% de su salario, sE pide el salario total que tiene. 
Esto es, si tiene comisión, su salario más la comisión, si no la tiene su salario más el 15% del mismo. 
La salidas se ordenará por oficio y salario en orden descendente. */

SELECT
	Apellido, Oficio, Salario, Comision, Total=CASE ISNULL(Comision,0)
		WHEN 0 THEN Salario*1.15
		ELSE Salario + Comision
	END
FROM
	EMP2
ORDER BY Oficio, Salario DESC