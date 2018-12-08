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
CREATE PROCEDURE dbo.SetDefaultTypeBuilding
		@clan_name VARCHAR(255),
    @default_type_building INT
AS
BEGIN
    UPDATE Clan
		    SET default_type_building = @default_type_building
		    WHERE Clan.clan_name = @clan_name;
END
GO
