/* 10. Azucena Mu�oz recibi� un pr�stamo para vivienda el d�a que ingres� en empresa, con vencimientos anuales a los 180 d�as del d�a y mes de ingreso. 
Hallar la fecha en que vence la anualidad del pr�stamo correspondiente al a�o actual. Esta informaci�n la puede visualizar la interesada, 
su jefe inmediato y cualquiera de los empleados del departamento de personal. */

CREATE VIEW VW_Prestamo AS
	SELECT
		FORMAT(DATEADD(dd, 180, Fecha_Alt), 'dd/MM/yyyy') AS Vencimiento
	FROM
		Temple
	WHERE
		NumEm = '410' -- En un caso real se utilizaria la ID, ya que con el nombre puede haber varias coincidencias.