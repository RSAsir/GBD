-- 3.- Introduciendo el nombre de un producto, obtener el nombre de la compañía proveedora.

CREATE FUNCTION F_NombreProACompañiaProv
(@NomPro VARCHAR(50)) -- LOS PARENTESIS PUEDEN ESTROPEAR TODO EL EJERCICIO.
RETURNS NVARCHAR(50)
AS
	BEGIN
		DECLARE @Compañia NVARCHAR(50)

		SET @Compañia = (SELECT NombreCompañía 
						 FROM Proveedores 
						 WHERE IdProveedor = (SELECT IdProveedor
											  FROM Productos
											  WHERE @NomPro = NombreProducto))

		IF @Compañia IS NULL
			SET @Compañia = 'El producto no esta asociado a ninguna compañia.'

		RETURN @Compañia
	END

-- INVOCACIONES
	
	-- 1. Invocacion con coincidencia
		SELECT dbo.F_NombreProACompañiaProv('Cerveza tibetana Barley')

	-- 2. Invocancion sin coincidencia
		SELECT dbo.F_NombreProACompañiaProv('Pene de goma')