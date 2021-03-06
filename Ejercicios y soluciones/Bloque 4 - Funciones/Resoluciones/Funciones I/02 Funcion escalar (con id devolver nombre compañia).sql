-- 2.- Introduciendo el id de un pedido, se pide obtener el nombre de la compaņía encargada de realizarlo.

-- LAS TABLAS QUE HAY EN PDF NO COINCIDEN CON LAS DE LA BBDD (REVISAR EL DIAGRAMA DESDE EL PROGRAMA).

CREATE FUNCTION F_NombreCompaņiaSegunId
(@idpedido INT)
RETURNS NVARCHAR(50)
AS
	BEGIN
		DECLARE @NombreCompaņia NVARCHAR(30)

		SET @NombreCompaņia = (SELECT NombreCompaņía 
								FROM  Clientes 
								WHERE IdCliente =	(SELECT IdCliente 
													 FROM  Pedidos 
													 WHERE @idpedido = IdPedido))
		
		IF @NombreCompaņia IS NULL
			SET @NombreCompaņia = 'El pedido no existe.'

		RETURN @NombreCompaņia
	END

	-- Invocaciones

		-- 1. Invocacion sin resultados.
			SELECT dbo.F_NombreCompaņiaSegunId(19)

		-- 2. Invocacion con resultados
			SELECT dbo.F_NombreCompaņiaSegunId(10249)
