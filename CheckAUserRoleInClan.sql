CREATE FUNCTION dbo.CheckAUserRoleInClan
(
	@username VARCHAR(255),
  @role_name VARCHAR(255),
  @clan_name VARCHAR(255)
)
RETURNS TABLE
AS
	RETURN (
    SELECT * FROM RolesOfClans AS RC
      INNER JOIN
      UserData As UD
      ON RC.id = UD.roles_of_clan_id
      INNER JOIN
        (SELECT role_id AS role, role_name FROM Role )AS R
      ON RC.role_id = R.role
      WHERE UD.username = @username AND
        R.role_name = @role_name AND
        RC.clan_name = @clan_name
  )
go

