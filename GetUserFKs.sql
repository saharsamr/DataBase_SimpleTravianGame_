SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.GetUserFKs
(
	@username VARCHAR(255),
	@property_name VARCHAR(255)
)
RETURNS INT
AS
BEGIN
	DECLARE @result INT;

	SELECT @result = @property_name FROM UserData
		WHERE UserData.username = @username;

	RETURN @result
END
GO

