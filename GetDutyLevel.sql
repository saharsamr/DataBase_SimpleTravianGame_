SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION GetDutyLevel
(
	@username VARCHAR(255),
  @duty_id INT
)
RETURNS INT
AS
BEGIN
	DECLARE @passed_cycle INT;

	SELECT @passed_cycle = passed_cycle FROM UserDutyHistory
		WHERE UserDutyHistory.username = @username
      AND UserDutyHistory.duty_id = @duty_id;

	RETURN (@passed_cycle / 100) + 1;
END
GO
