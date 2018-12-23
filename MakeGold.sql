SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.MakeGold
	@clan_name VARCHAR(255)
AS
BEGIN
    DECLARE @miner_duty_power INT,
            @change INT;

    SET @miner_duty_power = dbo.GetSensitiveDutyPower(@clan_name, 'Miner');
    SET @change = @miner_duty_power * 20;
    UPDATE Clan
        SET amount_of_gold = amount_of_gold + @change
          WHERE Clan.clan_name = @clan_name;
END
GO
