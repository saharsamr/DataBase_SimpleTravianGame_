SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.LogIn
	@username VARCHAR(65),
	@pass VARCHAR(255)
AS
BEGIN
  DECLARE @exist INT;
  SELECT @exist = COUNT(*) FROM UserData
    WHERE username = @username AND password_hash = @pass;
  IF @exist != 0
    INSERT INTO LogedInUser (username)
          VALUES (@username);
END
GO
