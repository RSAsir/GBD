/* 9. Claudita Fierro y Horacio Torres, tras un volcánico y fugaz noviazgo, han decidido unirse eternamente en matrimonio. 
La boda se celebrará dentro de dos días, y tomarán 20 días de vacaciones para el viaje de novios. 
La empresa entregará a cada uno como regalo de bodas un 1% de su salario actual por cada año de servicio. 
Hallar: la fecha de la boda, la fecha en la que tienen que incorporarse a trabajar y el regalo de boda correspondiente a cada uno de ellos. 
Esta información podrá ser consultada por, cualquiera de los interesados, el director general y los jefes inmediatos de cada uno de ellos, 
pero estos, solamente verán la información correspondiente a su empleado. */

CREATE VIEW VW_Boda AS
	SELECT
		Nombre,
		FORMAT(DATEADD(dd, 2, GETDATE()), 'dd/MM/yy') AS Dia_Boda, 
		FORMAT(DATEADD(dd, 20, GETDATE()), 'dd/MM/yy') AS Dia_Incorporacion,
		FLOOR((Salario * 0.01) * DATEDIFF(yy, Fecha_Alt, GETDATE())) AS Regalo --CON FLOOR OBVIAMOS LOS DECIMALES
	FROM
		Temple
	WHERE 
		Nombre IN ( 'Fierro, Claudia', 'Torres, Horacio' )

	-- FORMAT SE UTILIZA PARA PONER FECHAS COMO NOSOTROS QUERAMOS.