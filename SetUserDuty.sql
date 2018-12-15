SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.SetUserDuty
		@username VARCHAR(255),
    @duty_name VARCHAR(65)
AS
BEGIN
    DECLARE @duty_id INT;

    SELECT @duty_id = duty_id FROM Duty
        WHERE Duty.duty_name = @duty_name;

		IF NOT EXISTS (SELECT * FROM UserDutyHistory
										WHERE UserDutyHistory.duty_id = @duty_id
		  							AND UserDutyHistory.username = @username)
		BEGIN
			INSERT INTO UserDutyHistory (username, duty_id)
				VALUES (@username, @duty_id)
		END

    UPDATE UserData
			SET user_current_duty = @duty_id
				WHERE UserData.username = @username;
END
GO
