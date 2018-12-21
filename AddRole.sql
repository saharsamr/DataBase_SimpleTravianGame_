SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.AddRole
	@role_name VARCHAR(65),
	@uniqueness INT
AS
BEGIN
	INSERT INTO Role (role_name, uniqueness)
        VALUES (@role_name, @uniqueness);
END
GO
