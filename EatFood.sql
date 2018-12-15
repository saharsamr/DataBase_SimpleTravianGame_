SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.EatFood --TODO: man chon kolan ino nemifhamam mahsa bebine.
	@clan_name VARCHAR(255)
AS
BEGIN
    DECLARE @solders_num INT,
            @amount_of_food INT,
            @random_percentage_of_wasted INT,
            @needed_food INT;

    SET @amount_of_food = dbo.GetPropertyAmount(@clan_name, 'amount_of_food');
    SET @solders_num = dbo.GetPropertyAmount(@clan_name, 'solders_num');

    SELECT @random_percentage_of_wasted = RAND()*(12-10)+10;
    SET @needed_food = (@solders_num * @random_percentage_of_wasted / 100);

    IF (@amount_of_food < @needed_food)
      SET @solders_num = floor((@amount_of_food / @needed_food * @solders_num));

    SET @amount_of_food = @amount_of_food - (@solders_num * @random_percentage_of_wasted / 100);

    UPDATE Clan
      SET solders_num = @solders_num,
          amount_of_food = @amount_of_food
      WHERE Clan.clan_name = @clan_name;

END
GO
