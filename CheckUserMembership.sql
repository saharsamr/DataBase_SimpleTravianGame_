SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.CheckUserMembership
(
  @username VARCHAR(255)
)
RETURNS TABLE
AS
	RETURN (
    SELECT * FROM RolesOfClans AS RC
      INNER JOIN
      UserData AS UD
      ON RC.id = UD.roles_of_clan_id
      WHERE UD.username = @username
  );
GO
