-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters
-- command (Ctrl-Shift-M) to fill in the parameter
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE dbo.MakeGold
	@clan_name VARCHAR(255),
  @sensitive_duty_name VARCHAR(255) ---???
AS
BEGIN
    DECLARE @sensitive_duty_power INT, --Miner
            @amount_of_gold INT;

    SELECT @amount_of_gold = amount_of_gold FROM Clan
        WHERE Clan.clan_name = @clan_name;

    SELECT @sensitive_duty_power = dbo.GetSensitiveDutyPower(@clan_name, @sensitive_duty_name);

    UPDATE Clan
      SET amount_of_gold = @amount_of_gold + (@sensitive_duty_power * 20)
      WHERE Clan.clan_name = @clan_name;
END
GO
