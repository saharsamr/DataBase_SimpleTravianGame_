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
    UPDATE Clan
      SET amount_of_food = amount_of_food + @change
        WHERE Clan.clan_name = @clan_name;
END
GO
