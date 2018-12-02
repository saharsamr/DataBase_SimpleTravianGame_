-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters
-- command (Ctrl-Shift-M) to fill in the parameter
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.DoWarEffect
	@winner_id VARCHAR(255),
	@loser_id VARCHAR(255)
AS
BEGIN
	DECLARE @gold INT,
			@food INT,
			@sol_rand_winner INT,
			@sol_rand_loser INT;

	SELECT @gold = dbo.GetPropertyAmount(@loser_id, 'amount_of_gold');
	SELECT @food = dbo.GetPropertyAmount(@loser_id, 'amount_of_food');

	UPDATE Clan
		SET amount_of_gold = (0.9*@gold), amount_of_food = (0.9*@food)
		WHERE Clan.clan_name = @loser_id;

	UPDATE Clan
		SET amount_of_gold = (1.1*@gold), amount_of_food = (1.1*@food)
		WHERE Clan.clan_name = @winner_id;

	SELECT @sol_rand_winner = RAND()*(20-10)+10;
	SELECT @sol_rand_loser = RAND()*(30-20)+20;

	UPDATE Clan
		SET solders_num = (dbo.GetPropertyAmount(@loser_id, 'solders_num')*(1-@sol_rand_loser))
		WHERE Clan.clan_name = @loser_id;

	UPDATE Clan
		SET solders_num = (dbo.GetPropertyAmount(@winner_id, 'solders_num')*(1-@sol_rand_winner))
		WHERE Clan.clan_name = @winner_id;
END
GO
