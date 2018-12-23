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
      (SELECT building_id AS id, building_name FROM Building) AS B
      ON BC.building_id = B.id
      WHERE BC.clan_name = @clan_name AND
      B.building_name = @building_type
  )
go

