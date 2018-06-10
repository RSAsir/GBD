-- 4. Obtener el número de pedidos realizados desde un país introducido por teclado.

CREATE FUNCTION F_NumeroPedidosSegunPais
(@Pais VARCHAR(20))
RETURNS NVARCHAR(40)
AS
	BEGIN
		DECLARE @NumeroDePedidos NVARCHAR(40)

		SET @NumeroDePedidos = (SELECT COUNT(IdPedido)
								FROM Pedidos
								WHERE PaísDestinatario = @Pais
								GROUP BY PaísDestinatario)

		IF @NumeroDePedidos IS NULL
			SET @NumeroDePedidos = 'Pene de goma'

		RETURN @NumeroDePedidos

	END

-- INVOCACION

	-- 1. Invocacion con resultado
		SELECT dbo.F_NumeroPedidosSegunPais('Brasil')

	-- 2. Invocacion con resultado
		SELECT dbo.F_NumeroPedidosSegunPais('Jamaica')