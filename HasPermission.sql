CREATE FUNCTION HasPermission
(
  @clan_name VARCHAR(255),
	@username VARCHAR(255),
  @permission_name VARCHAR(255)
)
RETURNS INT
AS
BEGIN
	DECLARE @role_of_clan_id INT,
          @result INT = 0;

  SELECT @role_of_clan_id = roles_of_clan_id FROM UserData
    WHERE UserData.username = @username;

  IF @permission_name = 'management_permission'
    SELECT @result = management_permission FROM RolesOfClans
        WHERE RolesOfClans.id = @role_of_clan_id AND clan_name = @clan_name;
  ELSE IF @permission_name = 'building_permission'
    SELECT @result = building_permission FROM RolesOfClans
        WHERE RolesOfClans.id = @role_of_clan_id AND clan_name = @clan_name;

  RETURN @result;
END
go

