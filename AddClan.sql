SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.AddClan
	@clan_name VARCHAR(255),
	@slogan VARCHAR(255),
	@default_building VARCHAR(65),
	@doer_username VARCHAR(255)
AS
BEGIN
	DECLARE @building_id INT,
					@role_id INT,
					@roles_clans_id INT;

	SELECT @building_id = building_id FROM Building
			WHERE Building.building_name = @default_building;

	INSERT INTO dbo.Clan (clan_name, slogan, default_type_building)
        VALUES (@clan_name, @slogan, @building_id);

	SELECT @role_id = role_id FROM Role
		WHERE Role.role_name = 'Manager';

	INSERT INTO dbo.RolesOfClans (clan_name, role_id)
		VALUES (@clan_name, @role_id);
	SELECT @roles_clans_id = id
		FROM RolesOfClans
		WHERE RolesOfClans.clan_name = @clan_name
			AND RolesOfClans.role_id = @role_id;
	UPDATE UserData SET roles_of_clan_id = @roles_clans_id
		WHERE UserData.username = @doer_username;
END
GO
