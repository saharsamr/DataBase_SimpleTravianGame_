SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.UpdateClanProperty
		    @property_name VARCHAR(255),
        @change_value INT,
        @clan_name VARCHAR(255)
AS
BEGIN
    UPDATE Clan
        SET @property_name = (dbo.GetPropertyAmount(@clan_name, @property_name)+@change_value)
        WHERE Clan.clan_name = @clan_name;
END
GO
