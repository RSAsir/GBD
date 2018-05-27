/* 14. Se pide el nombre, oficio y d�a de la semana en que han sido dados de alta los empleados de la empresa, 
peso s�lo aquellos cuyo d�a de alta haya sido entre martes y jueves. Ordenar la salida por el campo oficio. 
(Cuidado con el gestor, en Espa�a el primer d�a de la semana es el lunes, pero en Inglaterra es el Domingo, 
en nuestro caso el formato es el espa�ol). */

SELECT
	Apellido, Oficio, DATENAME(dw, Fecha_Alt)
FROM
	Emp2
WHERE
	DATENAME(dw, Fecha_Alt) IN (SELECT 
									DATENAME(dw, Fecha_Alt) 
								FROM Emp2 
								WHERE 
									DATENAME(dw, Fecha_Alt) = 'Martes' OR 
									DATENAME(dw, Fecha_Alt) = 'Miercoles' OR 
									DATENAME(dw, Fecha_Alt) = 'Jueves')
ORDER BY
	Oficio