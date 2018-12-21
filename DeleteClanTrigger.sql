CREATE TRIGGER dbo.DeleteClanTrigger
ON Clan
AFTER DELETE
AS
BEGIN
  UPDATE DoWar
    SET starter = 'DELETED'
    FROM deleted
    WHERE starter IN (SELECT clan_name FROM deleted);
  UPDATE DoWar
    SET threatened = 'DELETED'
    FROM deleted
    WHERE threatened IN (SELECT clan_name FROM deleted);
END
go

