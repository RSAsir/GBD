CREATE FUNCTION F_Validacion_matricula
	(@matricula VARCHAR(10))
RETURNS CHAR(1)
BEGIN
	DECLARE @retorno CHAR(1)=1
	
	 	IF EXISTS (SELECT * FROM VW_Numero_viajes WHERE @matricula = Matricula)
			SET @retorno = 0
		
		RETURN @retorno
END

GO

CREATE FUNCTION F_Numero_viajes
	(@matricula VARCHAR(10))
RETURNS VARCHAR(50)
BEGIN
	DECLARE @retorno VARCHAR(50)

	IF dbo.F_Validacion_matricula(@matricula) = 1
		SET @retorno = (SELECT 'La matricula introducida no es correcta.')
	ELSE
		SET @retorno = (SELECT n_viajes FROM  VW_Numero_viajes WHERE @matricula = Matricula)

	RETURN @retorno
END

GO

-- INVOCACIONES
	
	-- Correcta
	SELECT dbo.F_Numero_viajes('3128 PTM')

	-- inorrecta
	SELECT dbo.F_Numero_viajes('3121 PTM')