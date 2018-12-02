-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters
-- command (Ctrl-Shift-M) to fill in the parameter
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.SetUserDuty
	@username VARCHAR(255),
    @duty_name VARCHAR(255)
AS
BEGIN
    DECLAR @duty_id INT,
            @duty_history_id INT;

    SELECT @duty_id = duty_id FROM Duty
        WHERE Duty.duty_name = @duty_name;

    SELECT @duty_history_id = duty_history_id FROM UserDutyHistory
        WHERE UserDutyHistory.duty_id = @duty_id AND
            UserDutyHistory.username = @username

    UPDATE UserData -- TODO: esme table lazeme?
		SET duty_history_id = @duty_history_id
		WHERE UserData.username = @username;
END
GO
