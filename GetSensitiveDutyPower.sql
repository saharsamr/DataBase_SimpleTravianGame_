SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION GetSensitiveDutyPower
(
	@clan_name VARCHAR(255),
  @sensitive_duty_name VARCHAR(255)
)
RETURNS INT
AS
BEGIN
	DECLARE @result INT;

	SET @result = (SELECT SUM(dbo.GetDutyLevel(h.username, h.duty_id))
                  FROM UserDutyHistory AS h
                  INNER JOIN UserData AS u
                    ON h.username = u.username
                  INNER JOIN Duty AS d
                    ON u.user_current_duty = d.duty_id
                  INNER JOIN RolesOfClans AS r
                    ON u.roles_of_clan_id = r.id
                  WHERE d.duty_name = @sensitive_duty_name
                    AND r.clan_name = @clan_name);

	RETURN @result;
END
GO
