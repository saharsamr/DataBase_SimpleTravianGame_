SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.GetAClanInfo
(
	@clan_name VARCHAR(255)
)
RETURNS TABLE
AS
	RETURN (
    SELECT * FROM Clan WHERE clan_name = @clan_name
  );
GO
