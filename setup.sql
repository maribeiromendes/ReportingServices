USE master;
GO

-- https://www.tech-recipes.com/database/sql-server-how-to-check-if-a-file-exists-in-a-directory/
CREATE FUNCTION dbo.fc_FileExists(@path varchar(8000))
RETURNS BIT
AS
BEGIN
	DECLARE @result INT
	EXEC master.dbo.xp_fileexist @path, @result OUTPUT
	RETURN cast(@result as bit)
END
GO

BEGIN
	DECLARE @fileExists BIT
	SELECT @fileExists = dbo.fc_FileExists('/var/opt/mssql/backup/AdventureWorks2022.bak');
	PRINT 'FILE EXISTS' + CAST(@fileExists as varchar(1))
END
GO

IF EXISTS(SELECT * FROM sys.databases WHERE name = 'AdventureWorks2022') 
	PRINT N'Database already exists...'

IF NOT EXISTS(SELECT * FROM sys.databases WHERE name = 'AdventureWorks2022') 
BEGIN
	PRINT N'Start restoring database...'

	RESTORE DATABASE [AdventureWorks2022]
	FROM DISK = '/var/opt/mssql/backup/AdventureWorks2022.bak'
	WITH
    	MOVE 'AdventureWorks2022' TO '/var/opt/mssql/data/AdventureWorks2022.mdf',
    	MOVE 'AdventureWorks2022_log' TO '/var/opt/mssql/data/AdventureWorks2022_log.ldf',
    	FILE = 1,
    	NOUNLOAD,
    	STATS = 5;

	PRINT N'Restore completed...'
END
GO

USE AdventureWorks2022; 
GO
IF EXISTS (SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_TYPE = 'BASE TABLE') 
	BEGIN 
		PRINT N'Database ready to use...';
	END 
	GO

