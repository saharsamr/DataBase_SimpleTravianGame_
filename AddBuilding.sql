SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.AddBuilding
	@building_name VARCHAR(65)
AS
BEGIN
	INSERT INTO Building (building_name)
        VALUES (@building_name);
END
GO
