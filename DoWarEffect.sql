SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.DoWarEffect
	@winner_id VARCHAR(255),
	@loser_id VARCHAR(255)
AS
BEGIN
	DECLARE @gold INT,
					@food INT,
					@sol_rand_winner INT,
					@sol_rand_loser INT,
					@winner_gold_change INT,
					@loser_gold_change INT,
					@winner_food_change INT,
					@loser_food_change INT,
					@loser_experience INT,
					@winner_experience INT;

	SELECT @gold = amount_of_gold FROM Clan
		WHERE Clan.clan_name = @loser_id;

	SELECT @food = amount_of_food FROM Clan
		WHERE Clan.clan_name = @loser_id;
	SET @gold = 0.1*@gold;
	SET @food = 0.1*@food;

	SET @winner_gold_change = @gold;
	SET @loser_gold_change = -1*@gold;
	SET @winner_food_change = @food;
	SET @loser_food_change = -1*@food;

	UPDATE Clan
		SET amount_of_gold = amount_of_gold + @loser_gold_change
			WHERE Clan.clan_name = @loser_id;
	UPDATE Clan
		SET amount_of_food = amount_of_food + @loser_food_change
			WHERE Clan.clan_name = @loser_id;

	UPDATE Clan
		SET amount_of_gold = amount_of_gold + @winner_gold_change
			WHERE Clan.clan_name = @winner_id;
	UPDATE Clan
		SET amount_of_food = amount_of_food + @winner_food_change
			WHERE Clan.clan_name = @winner_id;

	SELECT @sol_rand_winner = solders_num FROM Clan
		WHERE Clan.clan_name = @winner_id;
	SET @sol_rand_winner = @sol_rand_winner*RAND()*(20-10)+10;

	SELECT @sol_rand_loser = solders_num FROM Clan
		WHERE Clan.clan_name = @loser_id;
	SET @sol_rand_loser = @sol_rand_loser*RAND()*(30-20)+20;

	UPDATE Clan
		SET solders_num = solders_num + @sol_rand_loser
			WHERE Clan.clan_name = @loser_id;
	UPDATE Clan
		SET solders_num = solders_num + @sol_rand_winner
			WHERE Clan.clan_name = @winner_id;

	SELECT @loser_experience = RAND()*(30-20)+20;
	SELECT @winner_experience = RAND()*(30-20)+20;

	UPDATE Clan
		SET experiment = experiment + @loser_experience
			WHERE Clan.clan_name = @loser_id;
	UPDATE Clan
		SET experiment = experiment + @winner_experience
			WHERE Clan.clan_name = @winner_id;

	UPDATE Clan SET clan_level = (experiment/100)
          WHERE Clan.clan_name = @loser_id;
	UPDATE Clan SET clan_level = (experiment/100)
          WHERE Clan.clan_name = @winner_id;
END
GO
