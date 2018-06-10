/* 2. Crear un procedimiento almacenado que calcule la suma total de salarios de un departamento cuyo nombre pasaremos 
como parámetro. Si el resultado de la suma es nulo se debe mostrar un mensaje explicativo. 
El resultado debe proporcionarse como parámetro de salida y, por lo tanto, también deben proporcionarse las sentencias 
necesarias para obtener el resultado de su ejecución y mostrarlo por pantalla. */

CREATE PROCEDURE PA_Salarios_departamentos
	@departamento VARCHAR(30),
	@retorno VARCHAR(30) OUTPUT
AS
		IF EXISTS (SELECT * FROM TDepto WHERE @departamento = DNombre)
			SET @retorno = (SELECT
				(SELECT SUM(Salario) AS Suma_Salarios FROM Temple t WHERE t.NumDe = td.NumDe) 
			FROM
				TDepto td
			WHERE
				DNombre = @departamento)
		ELSE
			SET @retorno = (SELECT
				'No se encuentra el departamento especificado.' AS MENSAJE)


-- INVOCACIONES
	-- Inv. valida
	DECLARE @outputretorno VARCHAR(30)
	EXECUTE PA_Salarios_departamentos 'direccion general', @outputretorno OUTPUT
	SELECT @outputretorno AS Suma_Salarios

	-- Inv. no valida
	DECLARE @outputretorno2 VARCHAR(30)
	EXECUTE PA_Salarios_departamentos 'direccion', @outputretorno2 OUTPUT
	SELECT @outputretorno2 AS Suma_Salarios