CREATE PROCEDURE dbo.SetUserDuty
		@username VARCHAR(255),
    @duty_name VARCHAR(65)
AS
BEGIN
    DECLARE @duty_id INT= 0;
		DECLARE @countUserDuty INT = 0,
						@exist_temp INT,
						@exist INT = 1;

	SELECT @exist_temp = COUNT(*) FROM UserData
		WHERE username = @username;
	SET @exist = @exist*@exist_temp;

	SELECT @exist_temp = COUNT(*) FROM Duty
		WHERE duty_name = @duty_name;
	SET @exist = @exist*@exist_temp;

	IF @exist != 0
	BEGIN
    SELECT @duty_id = duty_id FROM Duty
        WHERE Duty.duty_name = @duty_name;

		SELECT @countUserDuty = COUNT(*) FROM UserDutyHistory
										WHERE duty_id = @duty_id
		  							AND username = @username
		IF @countUserDuty = 0
			INSERT INTO UserDutyHistory (username, duty_id)
				VALUES (@username, @duty_id)

		UPDATE UserData
			SET user_current_duty = @duty_id
				WHERE UserData.username = @username;
	END
END
go

