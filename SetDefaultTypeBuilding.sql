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
	DECLARE @building_id INT;
	SELECT @building_id = building_id FROM Building
		WHERE building_name = @default_type_building;

	IF dbo.HasPermission(@clan_name, @doer_username, 'building_permission') = 1 OR
			dbo.HasPermission(@clan_name, @doer_username, 'management_permission') = 1
    UPDATE Clan
		    SET default_type_building = @building_id
		    WHERE Clan.clan_name = @clan_name;
	ELSE
		PRINT 'You do not have permission to change or set building type.'
END
GO
