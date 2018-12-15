SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.AddUserDuty
	@duty_name VARCHAR(65)
AS
BEGIN
	INSERT INTO Duty (duty_name)
        VALUES (@duty_name);
END
GO
