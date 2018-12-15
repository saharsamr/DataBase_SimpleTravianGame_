SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.SetDefaultTypeBuilding
		@clan_name VARCHAR(255),
    @default_type_building INT,
		@doer_username VARCHAR(255)
AS
BEGIN
	IF dbo.HasPermission(@doer_username, 'building_permission') = 1 OR
			dbo.HasPermission(@doer_username, 'management_permission') = 1
    UPDATE Clan
		    SET default_type_building = @default_type_building
		    WHERE Clan.clan_name = @clan_name;
	ELSE
		PRINT 'You do not have permission to change or set building type.'
END
GO
