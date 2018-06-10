/* EX- Funci�n que acepte un a�o y devuelva el mejor cliente del mismo. 
El mejor cliente es el que ha realizado mas pedidos ese a�o. 
Utiliza una vista, y obt�n s�lo uno, aunque todos sabemos que podr�an ser varios. */

CREATE VIEW VW_Clientes_por_anyo AS
	SELECT
		NombreContacto, COUNT(IdPedido) AS Numero_pedidos, DATEPART(yy,FechaPedido) AS A�o
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

			IF EXISTS (SELECT A�o FROM VW_Clientes_por_anyo WHERE @anyo = A�o) SET @retorno = 0

			RETURN @retorno
		END

GO

CREATE FUNCTION F_Mejor_cliente_anyo
	(@anyo AS INT)
	RETURNS VARCHAR(40)
		BEGIN
			DECLARE @cliente VARCHAR(40)
			DECLARE @retorno VARCHAR(50)

			IF dbo.F_Validacion_anyo(@anyo) = 1 SET @cliente = 'No hay ningun cliente registrado ese a�o.'
			ELSE
				SET @cliente = (SELECT TOP 1 NombreContacto AS CLIENTE FROM VW_Clientes_por_anyo WHERE @anyo = A�o ORDER BY Numero_pedidos DESC)

			RETURN @cliente
		END

GO
	
-- Invocaciones
	
	SELECT dbo.F_Mejor_cliente_anyo(2014) AS Mejor_cliente -- Sin resultado
	UNION
	SELECT dbo.F_Mejor_cliente_anyo(1997) AS Mejor_cliente -- Con resultado