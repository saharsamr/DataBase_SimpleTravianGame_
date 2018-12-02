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
CREATE FUNCTION dbo.DetermineWinner
(
	@first_clan VARCHAR(255),
	@second_clan VARCHAR(255)
)
RETURNS INT
AS
BEGIN
	DECLARE @winner INT,
			@first_clan_solders INT,
			@second_clan_solders INT;

	SELECT @first_clan_solders = dbo.GetPropertyAmount(@first_clan, 'solders_num');
	SELECT @second_clan_solders = dbo.GetPropertyAmount(@second_clan, 'solders_num');

	IF (@first_clan_solders >= @second_clan_solders)
		SET @winner = 0;
	ELSE
		SET @winner = 1;

	RETURN @winner;
END
GO
