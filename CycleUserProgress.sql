SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.CycleUserProgress
AS
BEGIN
    DECLARE @user_duty_id INT;
    DECLARE @username VARCHAR(255);
    DECLARE users CURSOR FOR
        SELECT username, user_current_duty FROM UserData (NOLOCK)
    OPEN users
        FETCH NEXT FROM users INTO @username, @user_duty_id
        WHILE @@FETCH_STATUS = 0
            BEGIN

            UPDATE UserDutyHistory
              SET passed_cycle = passed_cycle + 1
              WHERE UserDutyHistory.username = @username AND
                UserDutyHistory.duty_id = @user_duty_id;

            FETCH NEXT FROM users INTO @username, @user_duty_id;

            END
    CLOSE users
    DEALLOCATE users
END
GO
