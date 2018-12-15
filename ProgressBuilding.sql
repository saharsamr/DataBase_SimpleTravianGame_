SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.ProgressBuilding
	@clan_name VARCHAR(255),
  @sensitive_duty_name VARCHAR(255)
AS
BEGIN
    DECLARE @sensitive_duty_number INT,
            @amount_of_progress INT,
            @amount_of_gold INT,
            @amount_of_wood INT,
            @building_id INT,
            @percentage_of_progress INT,
            @min_of_gold_and_wood INT,
            @gold_wood_change INT;

    SET @amount_of_gold = dbo.GetPropertyAmount(@clan_name, 'amount_of_gold');
    SET @amount_of_wood = dbo.GetPropertyAmount(@clan_name, 'amount_of_wood');
    SELECT @building_id = default_type_building FROM Clan
        WHERE Clan.clan_name = @clan_name;

    SET @sensitive_duty_number = dbo.GetNumberOfRole(@clan_name, @sensitive_duty_name);

    SET @min_of_gold_and_wood = dbo.GetMin(@amount_of_gold, @amount_of_wood);
    SET @min_of_gold_and_wood = @min_of_gold_and_wood/25;
    SET @amount_of_progress = dbo.GetMin(@min_of_gold_and_wood, @sensitive_duty_number);

    IF NOT EXISTS(SELECT * FROM BuildingsOfClans
                    WHERE BuildingsOfClans.clan_name = @clan_name
                      AND BuildingsOfClans.percentage_of_progress < 100
                      AND BuildingsOfClans.building_id = @building_id)
    BEGIN
      INSERT INTO BuildingsOfClans(clan_name, building_id)
        VALUES(@clan_name, @building_id);
      SET @percentage_of_progress = 0;
    END

    ELSE
      SELECT @percentage_of_progress = percentage_of_progress FROM BuildingsOfClans
        WHERE BuildingsOfClans.clan_name = @clan_name
          AND BuildingsOfClans.percentage_of_progress < 100
          AND BuildingsOfClans.building_id = @building_id;

    IF ((100 - @percentage_of_progress) >= @amount_of_progress)
    BEGIN
      UPDATE BuildingsOfClans
        SET percentage_of_progress = @percentage_of_progress + @amount_of_progress
        WHERE BuildingsOfClans.clan_name = @clan_name
          AND BuildingsOfClans.percentage_of_progress < 100
          AND BuildingsOfClans.building_id = @building_id;
    END
    ELSE
    BEGIN
      SET @amount_of_progress = 100 - @percentage_of_progress;
      UPDATE BuildingsOfClans
        SET percentage_of_progress = 100
        WHERE BuildingsOfClans.clan_name = @clan_name
          AND BuildingsOfClans.percentage_of_progress < 100
          AND BuildingsOfClans.building_id = @building_id;
    END

    SET @gold_wood_change = -1 * @amount_of_progress * 25;
    EXEC UpdateClanProperty 'amount_of_gold', @gold_wood_change, @clan_name;
    EXEC UpdateClanProperty 'amount_of_wood', @gold_wood_change, @clan_name;

  RETURN
END
GO
