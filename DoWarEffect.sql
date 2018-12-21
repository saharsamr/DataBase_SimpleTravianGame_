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

	SELECT @gold = dbo.GetPropertyAmount(@loser_id, 'amount_of_gold');
	SELECT @food = dbo.GetPropertyAmount(@loser_id, 'amount_of_food');
	SET @gold = 0.1*@gold;
	SET @food = 0.1*@food;

	SET @winner_gold_change = @gold;
	SET @loser_gold_change = -1*@gold;
	SET @winner_food_change = @food;
	SET @loser_food_change = -1*@food;

	EXEC dbo.UpdateClanProperty 'amount_of_gold', @loser_gold_change, @loser_id;
	EXEC dbo.UpdateClanProperty 'amount_of_food', @loser_food_change, @loser_id;

	EXEC dbo.UpdateClanProperty 'amount_of_gold', @winner_gold_change, @winner_id;
	EXEC dbo.UpdateClanProperty 'amount_of_food', @winner_food_change, @winner_id;

	SELECT @sol_rand_winner = RAND()*(20-10)+10;
	SELECT @sol_rand_loser = RAND()*(30-20)+20;

	SET @sol_rand_winner = dbo.GetPropertyAmount(@winner_id, 'solders_num')*(@sol_rand_winner);
	SET @sol_rand_loser = dbo.GetPropertyAmount(@loser_id, 'solders_num')*(@sol_rand_loser);

	EXEC dbo.UpdateClanProperty 'solders_num', @sol_rand_loser, @loser_id;
	EXEC dbo.UpdateClanProperty 'solders_num', @sol_rand_winner, @winner_id;

	SELECT @loser_experience = RAND()*(30-20)+20;
	SELECT @winner_experience = RAND()*(30-20)+20;

	EXEC UpdateClanProperty 'experiment', @loser_experience, @loser_id;
	EXEC UpdateClanProperty 'experiment', @winner_experience, @winner_id;
	UPDATE Clan SET clan_level = (experiment/100)
          WHERE Clan.clan_name = @loser_id;
	UPDATE Clan SET clan_level = (experiment/100)
          WHERE Clan.clan_name = @winner_id;
END
GO
