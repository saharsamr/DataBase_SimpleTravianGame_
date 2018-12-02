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
CREATE PROCEDURE dbo.WarSP
	@Starter VARCHAR(255),
	@Threatened VARCHAR(255)
AS
BEGIN
	DECLARE @winner INT,
			@winner_id VARCHAR(255),
			@loser_id VARCHAR(255),
			@has_war_permission INT;

	SELECT @has_war_permission = dbo.IsWarAllowable(@Starter, @Threatened);

	IF (@has_war_permission = 1)
	BEGIN
		SET @winner = dbo.DetermineWinner(@Starter, @Threatened);

		IF (@winner = 1)
		BEGIN
			SET @winner_id = @Starter;
			SET @loser_id = @Threatened;
		END
		ELSE
		BEGIN
			SET @winner_id = @Threatened;
			SET @loser_id = @Starter;
		END

		EXEC dbo.DoWarEffect @winner_id, @loser_id;
	END

END
GO
