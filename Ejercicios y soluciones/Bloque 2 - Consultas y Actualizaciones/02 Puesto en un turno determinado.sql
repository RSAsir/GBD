-- 2. �Qui�nes son los Enfermeros y Enfermeras que trabajan en el turno de Tarde o Ma�ana?
SELECT
	Apellido, Funcion, Turno
FROM
	Plantilla
WHERE
	Funcion LIKE 'Enfermer_' AND Turno IN ('T', 'M')