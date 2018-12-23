SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.CheckUserDuty
(
  @username VARCHAR(255),
  @duty_name VARCHAR(255)
)
RETURNS TABLE
AS
	RETURN (
    SELECT * FROM UserDutyHistory AS UDH
      INNER JOIN
      (SELECT duty_id AS duty FROM Duty) AS D
      ON UDH.duty_id = D.duty
      WHERE UDH.username = @username AND
      D.duty = @duty_name
  );
GO
