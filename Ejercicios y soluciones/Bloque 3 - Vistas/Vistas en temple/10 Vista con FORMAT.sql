/* 10. Azucena Muñoz recibió un préstamo para vivienda el día que ingresó en empresa, con vencimientos anuales a los 180 días del día y mes de ingreso. 
Hallar la fecha en que vence la anualidad del préstamo correspondiente al año actual. Esta información la puede visualizar la interesada, 
su jefe inmediato y cualquiera de los empleados del departamento de personal. */

CREATE VIEW VW_Prestamo AS
	SELECT
		FORMAT(DATEADD(dd, 180, Fecha_Alt), 'dd/MM/yyyy') AS Vencimiento
	FROM
		Temple
	WHERE
		NumEm = '410' -- En un caso real se utilizaria la ID, ya que con el nombre puede haber varias coincidencias.