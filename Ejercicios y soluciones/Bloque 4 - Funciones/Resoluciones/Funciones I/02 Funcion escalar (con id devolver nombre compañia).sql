-- 2.- Introduciendo el id de un pedido, se pide obtener el nombre de la compañía encargada de realizarlo.

-- LAS TABLAS QUE HAY EN PDF NO COINCIDEN CON LAS DE LA BBDD (REVISAR EL DIAGRAMA DESDE EL PROGRAMA).

CREATE FUNCTION F_NombreCompañiaSegunId
(@idpedido INT)
RETURNS NVARCHAR(50)
AS
	BEGIN
		DECLARE @NombreCompañia NVARCHAR(30)

		SET @NombreCompañia = (SELECT NombreCompañía 
								FROM  Clientes 
								WHERE IdCliente =	(SELECT IdCliente 
													 FROM  Pedidos 
													 WHERE @idpedido = IdPedido))
		
		IF @NombreCompañia IS NULL
			SET @NombreCompañia = 'El pedido no existe.'

		RETURN @NombreCompañia
	END

	-- Invocaciones

		-- 1. Invocacion sin resultados.
			SELECT dbo.F_NombreCompañiaSegunId(19)

		-- 2. Invocacion con resultados
			SELECT dbo.F_NombreCompañiaSegunId(10249)
