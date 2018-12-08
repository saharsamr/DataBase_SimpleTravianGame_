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

CREATE PROCEDURE dbo.EatFood
	@clan_name VARCHAR(255)
AS
BEGIN
    DECLARE @solders_num INT,
            @amount_of_food INT,
            @random_percentage_of_wasted INT,
            @needed_food INT;

    SELECT @amount_of_food = amount_of_food ,
            @solders_num = solders_num FROM Clan
        WHERE Clan.clan_name = @clan_name;

    SELECT @random_percentage_of_wasted = RAND()*(12-10)+10;
    SET @needed_food = (@solders_num * @random_percentage_of_wasted / 100);

    IF (@amount_of_food < @needed_food)
      SET @solders_num = floor((@amount_of_food / @needed_food * @solders_num));

    SET @amount_of_food = @amount_of_food - (@solders_num * @random_percentage_of_wasted / 100);

    UPDATE Clan
      SET solders_num = @solders_num,
          amount_of_food = @amount_of_food
      WHERE Clan.clan_name = @clan_name;

END
GO
