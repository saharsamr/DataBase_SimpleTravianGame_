SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.CheckBuildingOfAClan
(
  @clan_name VARCHAR(255),
  @building_type VARCHAR(255)
)
RETURNS TABLE
AS
	RETURN (
    SELECT * FROM BuildingsOfClans AS BC
      INNER JOIN
      (SELECT building_id AS id FROM Building) AS B
      ON BC.building_id = B.id
      WHERE BC.clan_name = @clan_name AND
      B.id = @building_type
  );
GO
