CREATE PROCEDURE dbo.RemoveUserFromClan
  @clan_name VARCHAR(255),
	@username VARCHAR(255),
  @doer_username VARCHAR(255)
AS
BEGIN
  DECLARE @exist_temp INT,
          @exist INT = 1;

  SELECT @exist_temp = COUNT(*) FROM UserData
    WHERE username = @doer_username;
  SET @exist = @exist*@exist_temp;

  SELECT @exist_temp = COUNT(*) FROM UserData
    WHERE username = @username;
  SET @exist = @exist*@exist_temp;

  SELECT @exist_temp = COUNT(*) FROM Clan
    WHERE clan_name = @clan_name;
  SET @exist = @exist*@exist_temp;

  IF @exist != 0
  BEGIN
    IF dbo.HasPermission(@clan_name, @doer_username, 'management_permission') = 1
      UPDATE UserData
          SET roles_of_clan_id = NULL
          WHERE UserData.username = @username;
    ELSE
      PRINT 'You do not have permission to remove a user.';
  END
END
go

