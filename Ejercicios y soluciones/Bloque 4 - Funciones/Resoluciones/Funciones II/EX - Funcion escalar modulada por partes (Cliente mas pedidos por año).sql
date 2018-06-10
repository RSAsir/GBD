/* EX- Función que acepte un año y devuelva el mejor cliente del mismo. 
El mejor cliente es el que ha realizado mas pedidos ese año. 
Utiliza una vista, y obtén sólo uno, aunque todos sabemos que podrían ser varios. */

CREATE VIEW VW_Clientes_por_anyo AS
	SELECT
		NombreContacto, COUNT(IdPedido) AS Numero_pedidos, DATEPART(yy,FechaPedido) AS Año
	FROM
		Clientes c INNER JOIN Pedidos p ON (p.IdCliente = c.IdCliente)
	GROUP BY
		NombreContacto, DATEPART(yy,FechaPedido)

GO

CREATE FUNCTION F_Validacion_anyo 
	(@anyo AS INT)
	RETURNS INT
		BEGIN
			DECLARE @retorno CHAR(1)=1

			IF EXISTS (SELECT Año FROM VW_Clientes_por_anyo WHERE @anyo = Año) SET @retorno = 0

			RETURN @retorno
		END

GO

CREATE FUNCTION F_Mejor_cliente_anyo
	(@anyo AS INT)
	RETURNS VARCHAR(40)
		BEGIN
			DECLARE @cliente VARCHAR(40)
			DECLARE @retorno VARCHAR(50)

			IF dbo.F_Validacion_anyo(@anyo) = 1 SET @cliente = 'No hay ningun cliente registrado ese año.'
			ELSE
				SET @cliente = (SELECT TOP 1 NombreContacto AS CLIENTE FROM VW_Clientes_por_anyo WHERE @anyo = Año ORDER BY Numero_pedidos DESC)

			RETURN @cliente
		END

GO
	
-- Invocaciones
	
	SELECT dbo.F_Mejor_cliente_anyo(2014) AS Mejor_cliente -- Sin resultado
	UNION
	SELECT dbo.F_Mejor_cliente_anyo(1997) AS Mejor_cliente -- Con resultado