SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION HasPermission
(
	@username VARCHAR(255),
  @permission_name VARCHAR(255)
)
RETURNS INT
AS
BEGIN
	DECLARE @role_of_clan_id INT,
          @result INT;

  SELECT @role_of_clan_id = roles_of_clan_id FROM UserData
    WHERE UserData.username = @username;

  SELECT @result = @permission_name FROM RolesOfClans
                  WHERE RolesOfClans.id = @role_of_clan_id;

  RETURN @result;
END
GO
