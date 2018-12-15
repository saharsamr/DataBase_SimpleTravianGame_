SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.RemoveUserFromClan
	@username VARCHAR(255),
  @doer_username VARCHAR(255)
AS
BEGIN
  IF dbo.HasPermission(@doer_username, 'management_permission') = 1
    UPDATE UserData
        SET roles_of_clan_id = NULL
        WHERE UserData.username = @username;
  ELSE
    PRINT 'You do not have permission to remove a user.';
END
GO
