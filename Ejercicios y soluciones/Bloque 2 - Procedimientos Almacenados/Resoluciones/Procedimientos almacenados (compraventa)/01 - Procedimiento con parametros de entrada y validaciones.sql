/* 1.- Procedimiento Ciudades. Se le entrega el apellido de un empleado y debe visualizar el Nombre de las compañías 
clientes que tienen su sede en la misma ciudad que el domicilio del empleado. Si no hay ninguno deberá emitir el mensaje 
correspondiente. */

CREATE PROCEDURE PA_Ciudades
	@Apellido VARCHAR(20)
AS

--El primer if checkea que exista el apellido en la BD.
	IF EXISTS (SELECT * FROM Empleados WHERE @Apellido = Apellidos)
	-- El segundo if checkea que ese empleado tenga clientes.
		IF EXISTS (SELECT NombreCompañía FROM Pedidos p INNER JOIN Clientes c ON  (c.IdCliente = p.IdCliente) INNER JOIN Empleados e ON (e.IdEmpleado = p.IdEmpleado) WHERE @Apellido = Apellidos)
			SELECT
				NombreCompañía
			FROM
				-- ES IMPORTANTE REALIZAR CORRECTAMENTE LA JOIN, SI NO, EL RESULTADO SERA ERRONEO
				Clientes c INNER JOIN Empleados e ON (c.Ciudad = e.Ciudad)
			WHERE
				@Apellido = Apellidos
		ELSE
			SELECT 'No existe ninguna cliente.'
	ELSE
		SELECT 'No hay ningun empleado con ese apellido.'


-- INVOCACION
EXECUTE PA_Ciudades 'Davolio'
EXECUTE PA_Ciudades 'Perez'

