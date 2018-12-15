SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.MakeFood
	@clan_name VARCHAR(255)
AS
BEGIN
    DECLARE @Farmer_duty_power INT,
            @farm_number INT,
            @change INT;

    SET @farm_number = dbo.FindFarmsNumber(@clan_name);
    SET @Farmer_duty_power = dbo.GetSensitiveDutyPower(@clan_name, 'Farmer');
    SET @change = @Farmer_duty_power * @farm_number;
    EXEC dbo.UpdateClanProperty 'amount_of_food', @change, @clan_name;
END
GO
