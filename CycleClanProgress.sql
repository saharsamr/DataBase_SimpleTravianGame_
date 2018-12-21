SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.CycleClanProgress
AS
BEGIN
    DECLARE @clan_name VARCHAR(255);
    DECLARE clans CURSOR FOR
        SELECT clan_name FROM Clan (NOLOCK)
    OPEN clans
        FETCH NEXT FROM clans INTO @clan_name
        WHILE @@FETCH_STATUS = 0
            BEGIN
            BEGIN TRANSACTION cycle_transaction
                BEGIN TRY
                    EXEC dbo.MakeGold @clan_name;
                    EXEC dbo.MakeWood @clan_name;
                    EXEC dbo.MakeFood @clan_name;
                    EXEC dbo.EatFood @clan_name;
                    EXEC dbo.MakeSolder @clan_name;
                    EXEC dbo.ProgressBuilding @clan_name, 'Sawyer';
                    COMMIT TRANSACTION cycle_transaction;
                END TRY
                BEGIN CATCH
                    ROLLBACK TRANSACTION cycle_transaction;
                END CATCH
            FETCH NEXT FROM clans INTO @clan_name;
            END
    CLOSE clans
    DEALLOCATE clans
END
GO
