-- Create a login for the SSAS virtual account
CREATE LOGIN [NT SERVICE\MSOLAP$MSSQLSERVER1] FROM WINDOWS;
-- Switch to your data warehouse DB
USE [DataWarehouseSales];
-- Create a user for the login in that DB
CREATE USER [NT SERVICE\MSOLAP$MSSQLSERVER1] FOR LOGIN [NT SERVICE\MSOLAP$MSSQLSERVER1];
-- Grant read access
ALTER ROLE db_datareader ADD MEMBER [NT SERVICE\MSOLAP$MSSQLSERVER1];