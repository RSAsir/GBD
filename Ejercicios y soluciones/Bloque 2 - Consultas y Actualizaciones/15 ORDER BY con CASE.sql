/* 15. Para todos los empleados, obtener el d�a que fueron dados de alta en la empresa (Lunes, Martes,...Viernes). 
Los d�as no laborables aparecer�n como "Fin de Semana". 
La salida estar� ordenada por el d�a de la semana y deber� mostrar el apellido y oficio de cada empleado adem�s del d�a correspondiente. */

SELECT
	Apellido, Oficio, Dia_Alta=CASE DATENAME(dw, Fecha_Alt)
		WHEN 'Sabado' THEN 'Fin de Semana'
		WHEN 'Domingo' THEN 'Fin de Semana'
		ELSE DATENAME(dw, Fecha_Alt)
		END
FROM
	Emp2
ORDER BY
	CASE DATENAME(dw, Fecha_Alt) 
		WHEN 'Lunes' THEN '1'
		WHEN 'Martes' THEN '2'
		WHEN 'Miercoles' THEN '3'
		WHEN 'Jueves' THEN '4'
		WHEN 'Viernes' THEN '5'
		ELSE '6'
	END