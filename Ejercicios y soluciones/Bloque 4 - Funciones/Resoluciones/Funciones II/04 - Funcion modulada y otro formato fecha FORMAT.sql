/* 4.- Función que acepte el nombre de un producto y nos muestre la fecha en que se pidió por última vez */

CREATE FUNCTION F_Validacion_Producto
	(@producto VARCHAR(50))
RETURNS VARCHAR(50)
BEGIN
	DECLARE @mensaje VARCHAR(50)=1

	IF EXISTS (SELECT NombreProducto FROM Productos WHERE @producto = NombreProducto)
		SET @mensaje = 0

	RETURN @mensaje
END

GO

CREATE FUNCTION F_Ultima_vez_se_pido_producto
	(@producto VARCHAR(50))
RETURNS VARCHAR(50)
BEGIN
	DECLARE @mensaje VARCHAR(50)

	IF dbo.F_Validacion_Producto(@producto) = 1
		SET @mensaje = 'No se ha encontrado un producto con ese nombre.'
	ELSE
		SET @mensaje = (SELECT TOP 1
							FORMAT(FechaPedido, 'd/M/yyyy') 
						FROM 
							Pedidos
						WHERE
							@producto = (SELECT NombreProducto FROM Productos WHERE @producto = NombreProducto)
						ORDER BY FechaPedido DESC) --IMPORTANTE
	RETURN @mensaje

END

GO

--INVOCACIONES

SELECT dbo.F_Ultima_vez_se_pido_producto('Cerveza tibetana Barley')

SELECT dbo.F_Ultima_vez_se_pido_producto('Cerveza rusa Barley')