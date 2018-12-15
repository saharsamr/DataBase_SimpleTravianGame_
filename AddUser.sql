SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.AddUser
	@username VARCHAR(255),
	@password_hash VARCHAR(255),
  	@email VARCHAR(255),
  	@duty_name VARCHAR(65)
AS
BEGIN
    DECLARE @duty_id INT,
						@duty_history_id INT;
    SELECT @duty_id = duty_id FROM Duty
        WHERE Duty.duty_name = @duty_name;

	INSERT INTO dbo.UserDutyHistory (username, duty_id)
			VALUES (@username, @duty_id);

    INSERT INTO dbo.UserData (username, password_hash, email, user_current_duty)
        VALUES (@username, @password_hash, @email, @duty_id);
END
GO
