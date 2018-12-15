SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.AddUserToClan
    @username  VARCHAR(255),
    @role_name VARCHAR(65),
    @clan_name VARCHAR(255),
    @doer_username VARCHAR(255)
AS
BEGIN
  DECLARE @role_id INT,
  @roles_clans_id INT,
  @uniqueness_role INT;

  IF dbo.HasPermission(@doer_username, 'management_permission') = 1
  BEGIN
    SELECT @role_id = role_id, @uniqueness_role = uniqueness
      FROM Role WHERE Role.role_name = @role_name;

    SELECT @roles_clans_id = id
      FROM RolesOfClans
      WHERE RolesOfClans.clan_name = @clan_name
        AND RolesOfClans.role_id = @role_id;

    IF @uniqueness_role = 1
      IF NOT EXISTS(SELECT * FROM RolesOfClans
                    WHERE RolesOfClans.clan_name = @clan_name
                      AND RolesOfClans.role_id = @role_id)
      BEGIN
        INSERT INTO dbo.RolesOfClans (clan_name, role_id)
          VALUES (@clan_name, @role_id);
        UPDATE UserData SET roles_of_clan_id = @roles_clans_id
          WHERE UserData.username = @username;
      END
      ELSE
        PRINT 'This role should be unique, and there is one already.'
    ELSE
      UPDATE UserData SET roles_of_clan_id = @roles_clans_id
        WHERE UserData.username = @username;
  END
  ELSE
    PRINT 'You do not have permission to add users to clan.'
END
GO
