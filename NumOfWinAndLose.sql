SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION NumOfWinAndLose
(
	@clan_name VARCHAR(255),
  @win_lose INT
)
RETURNS INT
AS
BEGIN
  DECLARE @lose_num INT,
          @win_num INT,
          @result INT;
  SELECT @lose_num = COUNT(*) FROM DoWar AS w
                      WHERE (w.starter = @clan_name AND w.winner_id = 1) OR
                            (w.threatened = @clan_name AND w.winner_id = 0);
  SELECT @win_num = COUNT(*) FROM DoWar AS w
                      WHERE (w.starter = @clan_name AND w.winner_id = 0) OR
                            (w.threatened = @clan_name AND w.winner_id = 1);
  IF @win_lose = 0
    SET @result = @win_num;
  ELSE
    SET @result = @lose_num;
  RETURN @result;
END
GO
