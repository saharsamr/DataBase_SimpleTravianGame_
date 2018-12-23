CREATE PROCEDURE dbo.AddUser
	@username VARCHAR(255),
	@password_hash VARCHAR(255),
  	@email VARCHAR(255),
  	@duty_name VARCHAR(65)
AS
BEGIN
    DECLARE @duty_id INT,
						@exist INT = 1;

    SELECT @duty_id = duty_id FROM Duty
        WHERE Duty.duty_name = @duty_name;

		SELECT @exist = COUNT(*) FROM Duty
			WHERE Duty.duty_name = @duty_name;

	IF @exist != 0
	BEGIN
    INSERT INTO dbo.UserData (username, password_hash, email, user_current_duty)
        VALUES (@username, @password_hash, @email, @duty_id);

		INSERT INTO dbo.UserDutyHistory (username, duty_id)
				VALUES (@username, @duty_id);
	END
END
go

