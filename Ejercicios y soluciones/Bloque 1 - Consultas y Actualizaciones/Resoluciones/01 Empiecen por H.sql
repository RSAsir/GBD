-- 1. Encuentre todos los miembros del personal cuyo nombre comience por H.
SELECT
	Apellido
FROM 
	Plantilla
WHERE
	Apellido LIKE 'H%'