SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.MakeSolder
	@clan_name VARCHAR(255)
AS
BEGIN
    DECLARE @trainer_duty_power INT,
            @amount_of_gold INT,
            @solder_change INT,
            @gold_change INT;

    SELECT @amount_of_gold = amount_of_gold FROM Clan
        WHERE Clan.clan_name = @clan_name;
    SET @Trainer_duty_power = dbo.GetSensitiveDutyPower(@clan_name, 'Trainer');

    IF (@amount_of_gold >= (@trainer_duty_power * 10 * 5))
    BEGIN
      SET @solder_change = @trainer_duty_power * 10;
      UPDATE Clan
      SET solders_num = solders_num + @solder_change
        WHERE Clan.clan_name = @clan_name;
      SET @gold_change = @trainer_duty_power * 10 * 5 * -1;
      UPDATE Clan
      SET amount_of_gold = amount_of_gold + @gold_change
        WHERE Clan.clan_name = @clan_name;
    END
    ELSE
      PRINT 'Not enough gold to train solders.'
END
GO
