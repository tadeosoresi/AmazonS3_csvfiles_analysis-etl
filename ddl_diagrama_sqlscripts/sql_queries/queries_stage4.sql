IF DB_ID('platforms_database') IS NULL
   print 'db does not exist!, run sqlconnection.py'
USE platforms_database;
GO
--- Actors netflix ---
SELECT TOP(1) TRIM(VALUE) as actor, COUNT(VALUE) as ocurrencias 
		FROM contenidos CROSS APPLY STRING_SPLIT([cast], ',') --- La idea es splittear columna de cast (,) y crear nueva columna con esos registros unicos
		WHERE platform_name = 'netflix' 
		GROUP BY VALUE 
		ORDER BY ocurrencias DESC; 

--- Top 10 Actors netflix/disney --- (no hay registros 2020, se tomo a�o 2019)
SELECT TOP(10) platform_name, [year], TRIM(VALUE) as actor, COUNT(VALUE) as ocurrencias 
		FROM contenidos CROSS APPLY STRING_SPLIT([cast], ',') --- La idea es splittear columna de cast (,) y crear nueva columna con esos registros unicos
		WHERE [year] = 2019 
		GROUP BY platform_name, [year], VALUE 
		ORDER BY ocurrencias DESC;

--- PROCEDURE ---
go
CREATE PROCEDURE top_5_duration
	@a�o INTEGER
	AS
	IF (@a�o IS NULL) OR (@a�o > YEAR(getdate())) OR (LEN(@a�o) < 4) --- Validamos arg
		BEGIN
		PRINT 'A�o incorrecto!'
		END
	ELSE
	BEGIN
	SELECT TOP(5) * FROM contenidos WHERE [type] = 'movie' and [year] = @a�o ORDER BY duration DESC --- Query
	END;
go
EXEC top_5_duration 2000;
go
SELECT * FROM contenidos;
