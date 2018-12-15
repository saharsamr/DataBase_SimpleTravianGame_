SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.FindFarmsNumber
(
	@clan_name VARCHAR(255)
)
RETURNS INT
AS
BEGIN
	DECLARE @farm_number INT;
    SET @farm_number = (SELECT COUNT(*) FROM BuildingsOfClans AS bc
                          INNER JOIN Building AS b
                            ON bc.building_id = b.building_id
                          WHERE bc.clan_name = @clan_name
                            AND b.building_name = 'Farm'
                            AND bc.percentage_of_progress = 100);
  RETURN @farm_number;
END
GO
