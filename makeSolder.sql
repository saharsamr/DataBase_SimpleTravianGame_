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

    SET @amount_of_gold = dbo.GetPropertyAmount(@clan_name, 'amount_of_gold');
    SET @Trainer_duty_power = dbo.GetSensitiveDutyPower(@clan_name, 'Trainer');

    IF (@amount_of_gold >= (@trainer_duty_power * 10 * 5))
    BEGIN
      SET @solder_change = @trainer_duty_power * 10;
      EXEC dbo.UpdateClanProperty 'solders_num', @solder_change, @clan_name;
      SET @gold_change = @trainer_duty_power * 10 * 5 * -1;
      EXEC dbo.UpdateClanProperty 'amount_of_gold', @gold_change, @clan_name;
    END
    ELSE
      PRINT 'Not enough gold to train solders.'
END
GO
