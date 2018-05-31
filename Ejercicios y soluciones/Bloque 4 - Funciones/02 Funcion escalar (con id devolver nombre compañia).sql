-- 2.- Introduciendo el id de un pedido, se pide obtener el nombre de la compa��a encargada de realizarlo.

-- LAS TABLAS QUE HAY EN PDF NO COINCIDEN CON LAS DE LA BBDD (REVISAR EL DIAGRAMA DESDE EL PROGRAMA).

CREATE FUNCTION F_NombreCompa�iaSegunId
(@idpedido INT)
RETURNS NVARCHAR(50)
AS
	BEGIN
		DECLARE @NombreCompa�ia NVARCHAR(30)

		SET @NombreCompa�ia = (SELECT NombreCompa��a 
								FROM  Clientes 
								WHERE IdCliente =	(SELECT IdCliente 
													 FROM  Pedidos 
													 WHERE @idpedido = IdPedido))
		
		IF @NombreCompa�ia IS NULL
			SET @NombreCompa�ia = 'El pedido no existe.'

		RETURN @NombreCompa�ia
	END

	-- Invocaciones

		-- 1. Invocacion sin resultados.
			SELECT dbo.F_NombreCompa�iaSegunId(19)

		-- 2. Invocacion con resultados
			SELECT dbo.F_NombreCompa�iaSegunId(10249)
