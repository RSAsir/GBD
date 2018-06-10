-- 3.- Introduciendo el nombre de un producto, obtener el nombre de la compa��a proveedora.

CREATE FUNCTION F_NombreProACompa�iaProv
(@NomPro VARCHAR(50)) -- LOS PARENTESIS PUEDEN ESTROPEAR TODO EL EJERCICIO.
RETURNS NVARCHAR(50)
AS
	BEGIN
		DECLARE @Compa�ia NVARCHAR(50)

		SET @Compa�ia = (SELECT NombreCompa��a 
						 FROM Proveedores 
						 WHERE IdProveedor = (SELECT IdProveedor
											  FROM Productos
											  WHERE @NomPro = NombreProducto))

		IF @Compa�ia IS NULL
			SET @Compa�ia = 'El producto no esta asociado a ninguna compa�ia.'

		RETURN @Compa�ia
	END

-- INVOCACIONES
	
	-- 1. Invocacion con coincidencia
		SELECT dbo.F_NombreProACompa�iaProv('Cerveza tibetana Barley')

	-- 2. Invocancion sin coincidencia
		SELECT dbo.F_NombreProACompa�iaProv('Pene de goma')