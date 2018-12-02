-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION GetClanLevel
(
	@clan_name VARCHAR(255)
)
RETURNS INT
AS
BEGIN
	DECLARE @result INT;

	SELECT @result = clan_level FROM Clan 
		WHERE Clan.clan_name = @clan_name;

	RETURN @result;
END
GO

