-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters
-- command (Ctrl-Shift-M) to fill in the parameter
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION GetSensitiveDutyPower
(
	@clan_name VARCHAR(255),
  @sensitive_duty_name VARCHAR(255)
)
RETURNS INT
AS
BEGIN
	DECLARE @result INT;

	@result = (SELECT SUM(dbo.GetDutyLevel(h.username, h.duty_id))
                FROM UserDutyHistory AS h
                INNER JOIN UserData AS u
                  ON h.username = u.username
                INNER JOIN Duty AS d
                  ON u.user_current_duty = d.duty_id
                INNER JOIN RolesOfClans AS r
                  ON u.roles_of_clan_id = r.id
                WHERE d.duty_name = @sensitive_duty_name
                  AND r.clan_name = @clan_name)

	RETURN @result;
END
GO
