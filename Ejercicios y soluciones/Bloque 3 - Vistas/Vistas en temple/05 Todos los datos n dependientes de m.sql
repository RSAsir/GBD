/* 5. Se desea autorizar a cada director de departamento a ver todos los datos de los empleados de los departamentos que dirige, 
tanto en propiedad como en funciones. Crear una vista para ello y autorizarla para consultas. */

CREATE VIEW VW_DirGen AS
SELECT
	*
FROM
	Temple
WHERE
	NumDe = 100