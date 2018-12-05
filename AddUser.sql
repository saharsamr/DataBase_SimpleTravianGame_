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
