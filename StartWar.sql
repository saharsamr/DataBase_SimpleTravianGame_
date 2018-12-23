SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.StartWar
	@Starter VARCHAR(255),
	@Threatened VARCHAR(255)
AS
BEGIN
	DECLARE @winner INT,
			@winner_id VARCHAR(255),
			@loser_id VARCHAR(255),
			@has_war_permission INT,
			@exist_temp INT,
			@exist INT = 1;

	SELECT @exist_temp = COUNT(*) FROM Clan
		WHERE clan_name = @Starter;
	SET @exist = @exist*@exist_temp;

	SELECT @exist_temp = COUNT(*) FROM Clan
		WHERE clan_name = @Threatened;
	SET @exist = @exist*@exist_temp;

	IF @Starter = @Threatened
		SET @exist = 0;

	IF @exist != 0
	BEGIN
		SET @has_war_permission = dbo.IsWarAllowable(@Starter, @Threatened);

		IF @has_war_permission = 1
		BEGIN
			SET @winner = dbo.DetermineWinner(@Starter, @Threatened);

			IF (@winner = 1)
			BEGIN
				SET @winner_id = @Starter;
				SET @loser_id = @Threatened;
			END
			ELSE
			BEGIN
				SET @winner_id = @Threatened;
				SET @loser_id = @Starter;
			END

			INSERT INTO DoWar (starter, threatened, winner_id)
				VALUES (@Starter, @Threatened, @winner);
			EXEC dbo.DoWarEffect @winner_id, @loser_id;
		END
	END
END
GO
