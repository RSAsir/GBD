/* 5. Se va a realizar un programa de consulta de información sobre los enfermos. 
Los datos a mostrar serán sus apellidos, dirección, fecha_nac y hospital en el que se encuentran ingresados. */

CREATE VIEW Datos_Enfermos AS
SELECT
	h.Nombre, e.Apellido, e.Direccion, e.Fecha_Nac
FROM
	Ocupacion o INNER JOIN Enfermo e ON (e.Inscripcion = o.Inscripcion)
				INNER JOIN Hospital h ON (o.Hospital_Cod = h.Hospital_Cod)
