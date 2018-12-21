EXEC dbo.AddUserDuty 'Sawyer';
EXEC dbo.AddUserDuty 'Miner';
EXEC dbo.AddUserDuty 'Farmer';
EXEC dbo.AddUserDuty 'Trainer';

EXEC dbo.AddRole 'Manager', 1;
EXEC dbo.AddRole 'Assistant', 1;
EXEC dbo.AddRole 'Member', 0;

EXEC dbo.AddBuilding 'Farm';
EXEC dbo.AddBuilding 'Barrack';

EXEC dbo.AddUser 'Sahar', '1234', 's.r@g.com', 'Sawyer';
EXEC dbo.AddUser 'Mahsa', '1234', 's.r@g.com', 'Sawyer';
EXEC dbo.AddUser 'Sadegh', '1234', 's.r@g.com', 'Miner';
EXEC dbo.AddUser 'Zahra', '1234', 's.r@g.com', 'Trainer';
EXEC dbo.AddUser 'Sadaf', '1234', 's.r@g.com', 'Farmer';
EXEC dbo.AddUser 'Goli', '1234', 's.r@g.com', 'Farmer';
EXEC dbo.AddUser 'Ali', '1234', 's.r@g.com', 'Miner';
EXEC dbo.AddUser 'Negin', '1234', 's.r@g.com', 'Miner';

-- EXEC dbo.AddClan 'Clan1', 'YES!', 'Farm', 'Sahar';
-- EXEC dbo.AddClan 'Clan2', 'YES!', 'Farm', 'Mahsa';
-- EXEC dbo.AddClan 'Clan3', 'YES!', 'Barrack', 'Sadegh';

GO;

