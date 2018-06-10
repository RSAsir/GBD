/* 29. Se desea saber para cada departamento y oficio, la suma total de comisiones, 
teniendo en cuenta que para los empleados que no tienen comisión, se les asignará:

o El 10% de su salario si son del departamento 10.
o El 15% de su salario si son del departamento 20.
o El 17% de su salario si son del departamento 30.
o De cualquier otro departamento se le asignará el 5% de su salario.
No se tendrán en cuenta a los empleados que hayan sido dados de alta después de 1981, ni al que abstente el cargo de "PRESIDENTE".
En la salida se mostrarán los siguientes datos: DEP_NO, OFICIO, SUMA DE COMISIONES. */

SELECT
	DNombre, d.Dept_No, Oficio, ISNULL(CASE d.Dept_No
	WHEN 10 THEN SUM(ISNULL(Comision, Salario*0.1))
	WHEN 20 THEN SUM(ISNULL(Comision, Salario*0.15))
	WHEN 30 THEN SUM(ISNULL(Comision, Salario*0.17))
	ELSE SUM(ISNULL(Comision, Salario*0.05))
	END, 0) Suma_Comisiones
FROM
	Emp2 e INNER JOIN Dep2 d ON (d.Dept_No = e.Dept_No)
WHERE
	Oficio != 'Presidente' AND YEAR(Fecha_Alt) <= 1981
GROUP BY
	DNombre, Oficio, d.Dept_No
ORDER BY
	d.Dept_No

/* Para resolver problemas como este, es necesario pensarlo todo al principio de modo simplificado, es decir, sacar una version
que aunque pueda no funcionar correctamente, vaya aproximandose a lo que queremos (En el problema inicial del case, al pensarlo sin el ISNULL,
es mas simple, y luego al ver que existen fallos, podemos trabajar en corregirlos).