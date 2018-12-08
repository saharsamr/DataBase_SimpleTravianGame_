-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters
-- command (Ctrl-Shift-M) to fill in the parameter
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
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
