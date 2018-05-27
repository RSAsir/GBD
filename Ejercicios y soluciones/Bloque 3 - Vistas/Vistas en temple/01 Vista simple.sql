/* 1. Crear una vista donde aparezcan todas las filas de la tabla TDepto, pero no aparezca la columna PRESU. */

CREATE VIEW VW_TDepto AS
SELECT
	Numde, Numce, Direc, TDir, DepDe, DNombre
FROM
	TDepto