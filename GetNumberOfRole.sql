SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.GetNumberOfRole
(
	@clan_name VARCHAR(255),
  @sensitive_duty_name VARCHAR(255)
)
RETURNS INT
AS
BEGIN
  DECLARE @sensitive_duty_number INT;
	SET @sensitive_duty_number = (SELECT COUNT(*) FROM UserData AS u
                                  INNER JOIN Duty AS d
                                    ON u.user_current_duty = d.duty_id
                                  INNER JOIN RolesOfClans AS r
                                    ON u.roles_of_clan_id = r.id
                                  WHERE r.clan_name = @clan_name
                                    AND d.duty_name = @sensitive_duty_name);
  RETURN @sensitive_duty_number;
END
GO
