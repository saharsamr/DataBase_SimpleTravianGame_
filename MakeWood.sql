SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.MakeWood
	@clan_name VARCHAR(255)
AS
BEGIN
    DECLARE @sawyer_duty_power INT,
            @amount_of_gold INT,
            @wood_change INT,
            @gold_change INT;

    SET @amount_of_gold = dbo.GetPropertyAmount(@clan_name, 'amount_of_gold');
    SET @sawyer_duty_power = dbo.GetSensitiveDutyPower(@clan_name, 'Sawyer');

    IF (@amount_of_gold >= (@sawyer_duty_power * 10))
    BEGIN
      SET @wood_change = @sawyer_duty_power * 10;
      EXEC dbo.UpdateClanProperty 'amount_of_wood', @wood_change, @clan_name;
      SET @gold_change = -1 * @wood_change;
      EXEC dbo.UpdateClanProperty 'amount_of_gold', @gold_change, @clan_name;
    END
    ELSE
      PRINT 'Amount of gold is not sufficient for making wood.'
END
GO
