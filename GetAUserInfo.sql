SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.GetAUserInfo
(
	@username VARCHAR(255)
)
RETURNS TABLE
AS
	RETURN (
    SELECT * FROM UserData WHERE username = @username
  );
GO
