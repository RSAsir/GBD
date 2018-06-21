CREATE PROCEDURE PA_Fecha_ult_viaje
	@matricula VARCHAR(10)
AS
	DECLARE @dia VARCHAR(10)
	DECLARE @fecha VARCHAR(20)

	SET @dia = (SELECT TOP 1 DATENAME(dw, Fecha) FROM Transportes WHERE @matricula = Matricula ORDER BY Fecha DESC) 
	SET @fecha = (SELECT TOP 1 FORMAT(Fecha, 'dd/MM/yyyy') FROM Transportes WHERE @matricula = Matricula ORDER BY FECHA DESC) 
	
	IF EXISTS (SELECT * FROM VW_Numero_viajes WHERE @matricula = Matricula AND n_viajes = '0')
		SELECT 'El camion no ha realizado viajes.'
	ELSE IF EXISTS (SELECT * FROM VW_Numero_viajes WHERE @matricula = Matricula)
		SELECT @dia AS Dia_semana, @fecha AS Fecha
	ELSE
		SELECT 'La matricula introducida no es correcta.'

	--INVOCACIONES
EXECUTE PA_Fecha_ult_viaje 'Davolio'
EXECUTE PA_Fecha_ult_viaje '3128 PTM'
EXECUTE PA_Fecha_ult_viaje '3141 BMC'