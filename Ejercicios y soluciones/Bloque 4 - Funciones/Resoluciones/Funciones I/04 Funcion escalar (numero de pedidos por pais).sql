-- 4. Obtener el n�mero de pedidos realizados desde un pa�s introducido por teclado.

CREATE FUNCTION F_NumeroPedidosSegunPais
(@Pais VARCHAR(20))
RETURNS NVARCHAR(40)
AS
	BEGIN
		DECLARE @NumeroDePedidos NVARCHAR(40)

		SET @NumeroDePedidos = (SELECT COUNT(IdPedido)
								FROM Pedidos
								WHERE Pa�sDestinatario = @Pais
								GROUP BY Pa�sDestinatario)

		IF @NumeroDePedidos IS NULL
			SET @NumeroDePedidos = 'Pene de goma'

		RETURN @NumeroDePedidos

	END

-- INVOCACION

	-- 1. Invocacion con resultado
		SELECT dbo.F_NumeroPedidosSegunPais('Brasil')

	-- 2. Invocacion con resultado
		SELECT dbo.F_NumeroPedidosSegunPais('Jamaica')