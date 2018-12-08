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

CREATE PROCEDURE dbo.MakeSolder
	@clan_name VARCHAR(255)
AS
BEGIN
    DECLARE @trainer_duty_power INT,
            @solders_num INT,
            @amount_of_gold INT;

    SELECT @solders_num = solders_num,
           @amount_of_gold = amount_of_gold FROM Clan
        WHERE Clan.clan_name = @clan_name;

    SELECT @Trainer_duty_power = dbo.GetSensitiveDutyPower(@clan_name, 'Trainer');

    IF (@amount_of_gold > (@trainer_duty_power * 10 * 5))
    BEGIN
      UPDATE Clan
        SET solders_num = @solders_num + (@trainer_duty_power * 10)
        WHERE Clan.clan_name = @clan_name;
    END
END
GO
