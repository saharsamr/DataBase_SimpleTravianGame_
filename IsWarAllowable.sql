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
CREATE FUNCTION dbo.IsWarAllowable (
	@first_clan VARCHAR(255),
	@second_clan VARCHAR(255)
)
RETURNS INT
AS
BEGIN
	DECLARE @first_clan_level INT,
			@second_clan_level INT,
			@result INT;

	SELECT @first_clan_level = dbo.GetClanLevel(@first_clan);
	SELECT @second_clan_level = dbo.GetClanLevel(@second_clan);

	IF (ABS(@first_clan_level - @second_clan_level) <= 1)
		SET @result = 1;
	ELSE
		SET @result = 0;

	RETURN @result
END
GO
