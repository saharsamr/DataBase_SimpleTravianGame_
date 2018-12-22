SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION GetPropertyAmount
(
	@clan_name VARCHAR(255),
	@property_name VARCHAR(255)
)
RETURNS INT
AS
BEGIN
	DECLARE @result INT;
	
	SELECT @result = @property_name FROM Clan
		WHERE Clan.clan_name = @clan_name;

	RETURN @result
END
GO

