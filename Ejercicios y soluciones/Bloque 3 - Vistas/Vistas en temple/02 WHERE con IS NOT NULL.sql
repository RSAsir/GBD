/* 2. Crear una vista llamada Vemcom que contenga las columnas NUMEM, NUMDE, EXTEL Y NOMBRE, de los empleados que trabajan a comisión. */

CREATE VIEW VW_Vemcom AS
SELECT
	NumEm, NumDe, Extel, Nombre, Comision
FROM
	Temple
WHERE
	Comision IS NOT NULL