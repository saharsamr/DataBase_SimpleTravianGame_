SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.SetDefaultTypeBuilding
		@clan_name VARCHAR(255),
    @default_type_building VARCHAR(255),
		@doer_username VARCHAR(255)
AS
BEGIN
	DECLARE @building_id INT,
					@exist_temp INT,
					@exist INT = 1;

	SELECT @exist_temp = COUNT(*) FROM UserData
		WHERE username = @doer_username;
	SET @exist = @exist*@exist_temp;

	SELECT @exist_temp = COUNT(*) FROM Clan
		WHERE clan_name = @clan_name;
	SET @exist = @exist*@exist_temp;

	SELECT @exist_temp = COUNT(*) FROM Building
		WHERE building_name = @default_type_building;
	SET @exist = @exist*@exist_temp;

	IF @exist != 0
	BEGIN
		SELECT @building_id = building_id FROM Building
			WHERE building_name = @default_type_building;

		IF dbo.HasPermission(@clan_name, @doer_username, 'building_permission') = 1 OR
				dbo.HasPermission(@clan_name, @doer_username, 'management_permission') = 1
			UPDATE Clan
					SET default_type_building = @building_id
					WHERE Clan.clan_name = @clan_name;
			IF NOT EXISTS(SELECT * FROM BuildingsOfClans
                    WHERE BuildingsOfClans.clan_name = @clan_name
                      AND BuildingsOfClans.percentage_of_progress < 100
                      AND BuildingsOfClans.building_id = @building_id)
			BEGIN
				INSERT INTO BuildingsOfClans(clan_name, building_id, percentage_of_progress)
					VALUES(@clan_name, @building_id, 0);
			END
		ELSE
			PRINT 'You do not have permission to change or set building type.'
	END
END
GO
