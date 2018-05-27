/* 3. Crear una vista llamada VJUBIL1 en la que aparezcan todos los datos de los empleados que cumplen 65 a�os de edad durante este a�o, 
de modo que pueden ser consultados por el director del departamento de personal. */

CREATE VIEW VW_VJUBIL1 AS
SELECT
	Nombre, Fecha_Nac, DATEDIFF(yy,Fecha_Nac, GETDATE()) AS A�os
FROM
	Temple
WHERE
	DATEDIFF(yy,Fecha_Nac, GETDATE()) = 65