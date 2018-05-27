-- 2. ¿Quiénes son los Enfermeros y Enfermeras que trabajan en el turno de Tarde o Mañana?
SELECT
	Apellido, Funcion, Turno
FROM
	Plantilla
WHERE
	Funcion LIKE 'Enfermer_' AND Turno IN ('T', 'M')