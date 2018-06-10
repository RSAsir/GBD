/* 1. Crear un procedimiento almacenado que calcule el presupuesto total de un centro, pasado como parámetro
   su código de centro, cuyos directores de departamento NO estén en funciones. Opcionalmente, se le podrá
   proporcionar el nombre de un departamento como segundo parámetro, en cuyo caso se deberá obtener el
   presupuesto de ese departamento. Como requisitos, se pide que se haga todo a través de una única consulta
   (SELECT) y que la columna de salida tenga como nombre "PRESUPUESTO". */

CREATE PROCEDURE PA_Presupuestos
	@codigo_centro INT,
	@nombre_departamento VARCHAR(30)='vacio'
AS
	IF @nombre_departamento = 'vacio'
		IF EXISTS (SELECT * FROM TDepto WHERE @codigo_centro = NumCe)
			SELECT
				SUM(Presu) AS PRESUPUESTO
			FROM
				TDepto
			WHERE
				@codigo_centro = NumCe AND TDir = 'P'
		ELSE
			SELECT
				'No se encuentra el centro especificado.' AS MENSAJE
	ELSE
		IF @nombre_departamento IS NOT NULL
			IF EXISTS (SELECT * FROM TDepto WHERE @nombre_departamento = DNombre)
				SELECT
					Presu AS PRESUPUESTO
				FROM
					TDepto
				WHERE
					@codigo_centro = NumCe AND @nombre_departamento = DNombre
			ELSE
				SELECT
					'No se encuentra el departamento especificado.' AS MENSAJE




-- INVOCACIONES
	EXECUTE PA_Presupuestos '10', 'pene'

