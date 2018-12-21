SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.CycleProgress
	@clan_name VARCHAR(255)
AS
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
END
GO
