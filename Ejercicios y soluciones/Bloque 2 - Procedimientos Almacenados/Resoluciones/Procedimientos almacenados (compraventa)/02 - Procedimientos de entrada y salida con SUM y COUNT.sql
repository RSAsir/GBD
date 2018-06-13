/* 2.- Procedimiento “Valor Ventas”: Se le entrega el apellido de un empleado y debe visualizar el valor de sus ventas. 
Dicho valor deberá obtenerse de una vista creada previamente. La vista estará formada por dos campos: El apellido de cada vendedor y el valor 
de sus ventas. Sin/Con parámetros de salida. */


CREATE VIEW VW_Valor_ventas_empleados AS
	SELECT
		Apellidos, (SELECT SUM(PrecioUnidad * Cantidad) FROM [DETALLES DE PEDIDOS] ddp WHERE p.IdPedido = ddp.IdPedido GROUP BY ddp.IdPedido) AS Valor_ventas
	FROM
		Empleados e INNER JOIN Pedidos p ON (e.IdEmpleado = p.IdEmpleado)
	GROUP BY
		Apellidos, p.IdPedido

GO

-- 1. Parametros de entrada
CREATE PROCEDURE PA_Valor_ventas_entrada
	@apellidos VARCHAR(20)
AS
	IF EXISTS (SELECT * FROM VW_Valor_ventas_empleados WHERE @apellidos = Apellidos)
		SELECT
			Apellidos, SUM(Valor_ventas)
		FROM
			VW_Valor_ventas_empleados
		WHERE
			@apellidos = Apellidos
		GROUP BY
			Apellidos
	ELSE
		SELECT
			'No se encuentra el empleado.'

GO

-- 2. Parametros de entrada y salida
CREATE PROCEDURE PA_Valor_ventas_salida
	@apellidos VARCHAR(20),
	@ventas VARCHAR(50) OUTPUT
AS
	IF EXISTS (SELECT * FROM VW_Valor_ventas_empleados WHERE @apellidos = Apellidos)
		SET @ventas = (SELECT
						 SUM(Valor_ventas)
					   FROM
						 VW_Valor_ventas_empleados
					   WHERE
						 @apellidos = Apellidos
					   GROUP BY
						 Apellidos)
	ELSE
		SET @ventas = (SELECT 'No se encuentra el empleado')

	-- EN LOS PROCEDIMIENTOS ALMACENADOS CON PARAMETROS DE SALIDA, NO SE PONE EL 'RETURN'.

--INVOCACIONES
	
	-- 1.a Con resultado

	EXECUTE PA_Valor_ventas_entrada 'Davolio'

	-- 1.b Sin resultado

	EXECUTE PA_Valor_ventas_entrada 'Perez'

	-- 2.a Con resultado

	DECLARE @Output VARCHAR(50)
	EXECUTE PA_Valor_ventas_salida 'Davolio', @Output OUTPUT
	SELECT @Output AS Valor_ventas

	-- 2.b Sin resultado

	DECLARE @Output2 VARCHAR(50)
	EXECUTE PA_Valor_ventas_salida 'Perez', @Output2 OUTPUT
	SELECT  @Output2 AS Valor_ventas