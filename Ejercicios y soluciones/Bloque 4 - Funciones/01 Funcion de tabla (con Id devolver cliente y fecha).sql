-- 1.- introduciendo el identificador de un pedido, se pide obtener el cliente y la fecha de envío.

CREATE FUNCTION F_NomCli_FecEnv
(@idpedido INT)
RETURNS @DatosCliente TABLE
(IdPedido			VARCHAR (60)	NOT NULL,
IdCliente			NVARCHAR(60)	NOT NULL,
NombreContacto		NVARCHAR(60)	NOT NULL,
FechaEnvio			DATE		) /* 1. EL TIPO DE DATOS DEBERIA SER DATETIME, PERO LO HE OBVIADO YA QUE TODOS
									 UTILIZAN LAS 00:00 COMO HORA (NO DEBE HACERSE). 
									 2. CON EL FIN DE DEJAR EL ESPACIO DE FECHA EN BLANCO CUANDO SE INTRODUCE
									 UNA ID NO VALIDA, PODRIA PROBARSE CAMBIAR EL TIPO DE DATOS A UN VARCHAR.*/
AS
BEGIN 
	IF NOT EXISTS (SELECT * FROM Pedidos WHERE IdPedido = @idpedido) 
		INSERT @DatosCliente
		SELECT
			'No existe un pedido registrado con esa ID','', '', ''
	ELSE
		INSERT @DatosCliente
		SELECT
			IdPedido, p.IdCliente, NombreContacto, FechaEnvío
		FROM
			Pedidos p INNER JOIN Clientes c ON (p.IdCliente = c.IdCliente)
		WHERE
			IdPedido = @idpedido
	RETURN
END

-- INVOCACIONES
	
	-- 1. Invocacion valida
		SELECT 
			* 
		FROM
			F_NomCli_FecEnv(10249)

	-- 2. Invocacion sin resultados
		SELECT 
			* 
		FROM
			F_NomCli_FecEnv(12)