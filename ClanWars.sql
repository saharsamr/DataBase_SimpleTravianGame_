SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION dbo.ClanWars
(
	@clan_name VARCHAR(255)
)
RETURNS TABLE
AS
  RETURN (
    SELECT CASE
       WHEN (starter = @clan_name AND winner_id = 0) OR (threatened = @clan_name AND winner_id = 1)
               THEN 1
       ELSE 0
         END AS HAS_WIN
    FROM DoWar
  );
GO
