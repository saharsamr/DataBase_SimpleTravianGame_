SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.SetSloganOfClan
		@clan_name VARCHAR(255),
    @slogan VARCHAR(255),
		@doer_username VARCHAR(255)
AS
BEGIN
	IF dbo.HasPermission(@clan_name, @doer_username, 'management_permission') = 1
    UPDATE Clan
		    SET slogan = @slogan
		    WHERE Clan.clan_name = @clan_name;
	ELSE
		PRINT 'You do not have permission to set slogan for the clan.'
END
GO
