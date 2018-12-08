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
USE TRAVIANS

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================

CREATE PROCEDURE dbo.MAkeFood
	@clan_name VARCHAR(255)
AS
BEGIN
    DECLARE @Farmer_duty_power INT,
            @amount_of_food INT,
            @farm_number INT;

    SELECT @amount_of_food = amount_of_food FROM Clan
        WHERE Clan.clan_name = @clan_name;

    SET @farm_number = (SELECT COUNT(*) FROM BuildingsOfClans AS bc
                      INNER JOIN Building AS b
                        ON bc.building_id = b.building_id
                      WHERE bc.clan_name = @clan_name
                        AND b.building_name = 'Farm'
                        AND bc.percentage_of_progress = 100);

    SELECT @Farmer_duty_power = dbo.GetSensitiveDutyPower(@clan_name, 'Farmer');

    UPDATE Clan
      SET amount_of_food = @amount_of_food + (@Farmer_duty_power * @farm_number)
      WHERE Clan.clan_name = @clan_name;
END
GO
