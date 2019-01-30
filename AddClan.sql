CREATE PROCEDURE dbo.AddClan
	@clan_name VARCHAR(255),
	@slogan VARCHAR(255),
	@default_building VARCHAR(65),
	@doer_username VARCHAR(255)
AS
BEGIN
	DECLARE @building_id INT,
					@role_id INT,
					@roles_clans_id INT,
					@exist1 INT = 1,
					@exist2 INT = 1,
					@is_member INT;

	SELECT @building_id = building_id FROM Building
			WHERE Building.building_name = @default_building;

	SELECT @exist1 = COUNT(*) FROM Building
		WHERE Building.building_name = @default_building;

	SELECT @exist2 = COUNT(*) FROM UserData
		WHERE UserData.username = @doer_username;

	SELECT @role_id = role_id FROM Role
		WHERE Role.role_name = 'Manager';

	SELECT @is_member = COUNT(*) FROM UserData AS UD
		INNER JOIN
		RolesOfClans AS RC
		ON RC.id = UD.roles_of_clan_id
		WHERE UD.username = @doer_username;

	IF @exist1 != 0 AND @exist2 != 0 AND @is_member = 0
	BEGIN
		INSERT INTO dbo.Clan (clan_name, slogan, default_type_building)
			VALUES (@clan_name, @slogan, @building_id);
		INSERT INTO BuildingsOfClans(clan_name, building_id, percentage_of_progress)
					VALUES(@clan_name, @building_id, 0);
		INSERT INTO dbo.RolesOfClans (clan_name, role_id, building_permission, management_permission)
			VALUES (@clan_name, @role_id, 1, 1);
		SELECT @roles_clans_id = id
			FROM RolesOfClans
			WHERE RolesOfClans.clan_name = @clan_name
				AND RolesOfClans.role_id = @role_id;
		UPDATE UserData SET roles_of_clan_id = @roles_clans_id
			WHERE UserData.username = @doer_username;
	END

END
go

