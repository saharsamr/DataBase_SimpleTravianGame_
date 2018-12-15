CREATE VIEW RankingView AS
  SELECT TOP 100 c.clan_name, c.experiment, dbo.NumOfWinAndLose(c.clan_name, 0) AS num_of_wins,
    dbo.NumOfWinAndLose(c.clan_name, 1) AS num_of_loses FROM Clan AS C
ORDER BY c.experiment;