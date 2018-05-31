-- 1.- introduciendo el identificador de un pedido, se pide obtener el cliente y la fecha de envío.

CREATE FUNCTION F_ClienteEnvioSegunIdPedido
(@idpedido INT)
RETURNS NVARCHAR (200)
BEGIN 
	/* Las variables se pueden ajustar mucho mejor */
	DECLARE @id NVARCHAR(200)
	DECLARE @NombreCliente NVARCHAR(200)
	DECLARE @FechaEnvio NVARCHAR(200)
	DECLARE @Mensaje VARCHAR(200)

	/* Asi funciona, pero la fecha se ve del modo mas cutre posible, seria conveniente ajustarla */
	SET @id = (SELECT IdPedido FROM Pedidos WHERE IdPedido = @idpedido)
	SET @NombreCliente = (SELECT NombreContacto FROM Clientes c INNER JOIN Pedidos p ON (c.idcliente = p.idcliente) WHERE	@id = IdPedido)
	SET @FechaEnvio = (SELECT FechaEnvío FROM Pedidos p INNER JOIN Clientes c ON (c.idcliente = p.idcliente) WHERE	@id = IdPedido)
	SET @Mensaje = 'La ID del pedido es ' + @id + ', fue enviado el ' + @FechaEnvio + ' y el nombre de contacto es ' + @NombreCliente
	

	IF @Mensaje IS NULL
		SET @Mensaje = 'No existe un pedido registrado con esa ID'

		RETURN @Mensaje
END


-- Invocaciones

	-- 1. Invocacion con resultado
		SELECT 
			dbo.F_ClienteEnvioSegunIdPedido(10249)

	-- 2. Invocacion sin resultados
		SELECT
			dbo.F_ClienteEnvioSegunIdPedido(1029)