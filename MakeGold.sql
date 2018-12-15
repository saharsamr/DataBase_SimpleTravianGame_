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
    EXEC dbo.UpdateClanProperty 'amount_of_gold', @change, @clan_name;
END
GO
