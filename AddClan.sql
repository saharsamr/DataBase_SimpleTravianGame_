-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters
-- command (Ctrl-Shift-M) to fill in the parameter
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE dbo.AddClan
	@clan_name VARCHAR(255),
	@slogan VARCHAR(255),
	@default_building VARCHAR(65)
AS
BEGIN
	DECLARE @building_id INT;

	SELECT @building_id = building_id FROM Building
			WHERE Building.building_name = @default_building;

	INSERT INTO Caln (clan_name, slogan, default_type_building)
        VALUES (@clan_name, @slogan, @building_id);
END
GO
