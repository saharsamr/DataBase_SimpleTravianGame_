CREATE PROCEDURE dbo.AddUserToClan
    @username  VARCHAR(255),
    @role_name VARCHAR(65),
    @clan_name VARCHAR(255),
    @doer_username VARCHAR(255)
AS
BEGIN
  DECLARE @role_id INT,
          @roles_clans_id INT,
          @uniqueness_role INT = 0,
          @exist_temp INT,
          @exist INT = 1,
          @is_member INT = 0;

  SELECT @exist_temp = COUNT(*) FROM UserData
    WHERE username = @username;
  SET @exist = @exist*@exist_temp;

  SELECT @exist_temp = COUNT(*) FROM UserData
    WHERE username = @doer_username;
  SET @exist = @exist*@exist_temp;

  SELECT @exist_temp = COUNT(*) FROM Clan
    WHERE clan_name = @clan_name;
  SET @exist = @exist*@exist_temp;

  SELECT @exist_temp = COUNT(*) FROM Role
    WHERE role_name = @role_name;
  SET @exist = @exist*@exist_temp;

  SELECT @is_member = COUNT(*) FROM UserData AS UD
  INNER JOIN
  RolesOfClans AS RC
  ON RC.id = UD.roles_of_clan_id
  WHERE UD.username = @username;

  IF @exist != 0 AND @is_member = 0
  BEGIN
    IF dbo.HasPermission(@clan_name, @doer_username, 'management_permission') = 1
    BEGIN
      DECLARE @building_permission INT = 0,
              @management_permission INT = 0;
      IF @role_name = 'Manager'
      BEGIN
        SET @building_permission = 1;
        SET @management_permission = 1;
      END
      ELSE IF @role_name = 'Assistant'
        SET @building_permission = 1;

      SELECT @role_id = role_id, @uniqueness_role = uniqueness
        FROM Role WHERE Role.role_name = @role_name;

      IF @uniqueness_role = 1
        IF NOT EXISTS(SELECT * FROM RolesOfClans
                      WHERE RolesOfClans.clan_name = @clan_name
                        AND RolesOfClans.role_id = @role_id)
        BEGIN
          INSERT INTO dbo.RolesOfClans (clan_name, role_id, building_permission, management_permission)
            VALUES (@clan_name, @role_id, @building_permission, @management_permission);
          SELECT @roles_clans_id = id
            FROM RolesOfClans
            WHERE RolesOfClans.clan_name = @clan_name
              AND RolesOfClans.role_id = @role_id;
          UPDATE UserData SET roles_of_clan_id = @roles_clans_id
            WHERE UserData.username = @username;
        END
        ELSE
          PRINT 'This role should be unique, and there is one already.'
      ELSE
      BEGIN
        IF NOT EXISTS(SELECT * FROM RolesOfClans
                      WHERE RolesOfClans.clan_name = @clan_name
                        AND RolesOfClans.role_id = @role_id)
        BEGIN
          INSERT INTO dbo.RolesOfClans (clan_name, role_id, building_permission, management_permission)
            VALUES (@clan_name, @role_id, @building_permission, @management_permission);
          SELECT @roles_clans_id = id
            FROM RolesOfClans
            WHERE RolesOfClans.clan_name = @clan_name
              AND RolesOfClans.role_id = @role_id;
          UPDATE UserData SET roles_of_clan_id = @roles_clans_id
            WHERE UserData.username = @username;
        END
        ELSE
        BEGIN
          SELECT @roles_clans_id = id
              FROM RolesOfClans
              WHERE RolesOfClans.clan_name = @clan_name
                AND RolesOfClans.role_id = @role_id;
          UPDATE UserData SET roles_of_clan_id = @roles_clans_id
            WHERE UserData.username = @username;
        END
      END
    END
    ELSE
      PRINT 'You do not have permission to add users to clan.'
  END
END
go

