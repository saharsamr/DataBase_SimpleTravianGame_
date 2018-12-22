SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

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

	SELECT @first_clan_solders = solders_num FROM Clan
		WHERE Clan.clan_name = @first_clan;

	SELECT @second_clan_solders = solders_num FROM Clan
			WHERE Clan.clan_name = @second_clan;

	IF (@first_clan_solders >= @second_clan_solders)
		SET @winner = 0;
	ELSE
		SET @winner = 1;

	RETURN @winner;
END
GO
