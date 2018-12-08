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
--TODO: check konim ke admin masalan az yeki bishtar nashe o ina

CREATE PROCEDURE dbo.ProgressBuilding
	@clan_name VARCHAR(255),
  @sensitive_duty_name VARCHAR(255) ---???
AS
BEGIN
    DECLARE @sensitive_duty_number INT, --sawyer
            @amount_of_progress INT,
            @amount_of_gold INT,
            @amount_of_wood INT,
            @building_id INT,
            @percentage_of_progress INT,
            @min_of_gold_and_wood INT;

    SELECT @amount_of_gold = amount_of_gold ,
            @amount_of_wood = amount_of_wood ,
            @building_id = default_type_building FROM Clan
        WHERE Clan.clan_name = @clan_name;

    --  :)))))
    SET @sensitive_duty_number = (SELECT COUNT(*) FROM UserData AS u
                                INNER JOIN Duty AS d
                                  ON u.user_current_duty = d.duty_id
                                INNER JOIN RolesOfClans AS r
                                  ON u.roles_of_clan_id = r.id
                                WHERE r.clan_name = @clan_name
                                  AND d.duty_name = @sensitive_duty_name);
    --TODO: bayad tabe she :) tabe min
    IF(@amount_of_gold > @amount_of_wood)
      SET @min_of_gold_and_wood = @amount_of_wood;
    ELSE
      SET @min_of_gold_and_wood = @amount_of_gold;


    IF (@min_of_gold_and_wood > @sensitive_duty_number * 25)
      SET @amount_of_progress = @sensitive_duty_number * 25;
    ELSE
      SET @amount_of_progress = @min_of_gold_and_wood / 25;

    UPDATE Clan
      SET amount_of_gold = @amount_of_gold - (@amount_of_progress * 25),
          amount_of_wood = @amount_of_wood - (@amount_of_progress * 25)
      WHERE Clan.clan_name = @clan_name;


    IF NOT EXISTS(SELECT * FROM BuildingsOfClans
                    WHERE BuildingsOfClans.clan_name = @clan_name
                      AND BuildingsOfClans.percentage_of_progress < 100)
    BEGIN
      INSERT INTO BuildingsOfClans(clan_name, building_id)
        VALUES(@clan_name, @building_id);
    END

    SELECT @percentage_of_progress = percentage_of_progress FROM BuildingsOfClans
      WHERE BuildingsOfClans.clan_name = @clan_name
        AND BuildingsOfClans.percentage_of_progress < 100

    IF ((100 - @percentage_of_progress) >= @amount_of_progress)
      BEGIN
        UPDATE BuildingsOfClans
          SET percentage_of_progress = @percentage_of_progress + @amount_of_progress
          WHERE BuildingsOfClans.clan_name = @clan_name
            AND BuildingsOfClans.percentage_of_progress < 100;
      END
    ELSE
      BEGIN
        UPDATE BuildingsOfClans
          SET percentage_of_progress = 100
          WHERE BuildingsOfClans.clan_name = @clan_name
            AND BuildingsOfClans.percentage_of_progress < 100;

          INSERT INTO BuildingsOfClans(clan_name, building_id, percentage_of_progress)
            VALUES(@clan_name, @building_id, (@amount_of_progress - 100 + @percentage_of_progress));
      END
	  RETURN
END
GO