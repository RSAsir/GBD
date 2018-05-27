/* 5. En la tabla DOCTOR, otorgar a Cardiolog�a el c�digo 1, a Psiquiatr�a el 2, a pediatr�a el 3 y el cualquier otra especialidad el 4. 
Recuperar todos los doctores, su especialidad y el c�digo correspondiente. */

SELECT
	Apellido, Especialidad, COD=CASE Especialidad
		WHEN 'Cardiologia' THEN 1
		WHEN 'Psiquiatria' THEN 2
		WHEN 'Pediatria' THEN 3
		ELSE 4 
	END
FROM
	Doctor
ORDER BY
	3
