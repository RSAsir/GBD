CREATE VIEW VW_Numero_viajes AS
	SELECT
		Matricula, Marca, Modelo, (SELECT COUNT(Matricula) FROM Transportes t WHERE c.Matricula = t.Matricula AND DATEPART(yy,Fecha) = YEAR(GETDATE())) AS n_viajes
	FROM
		Camiones c