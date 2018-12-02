USE TRAVIANS

CREATE TABLE Clan (
    clan_name VARCHAR(255) NOT NULL PRIMARY KEY,
    amount_of_gold INT DEFAULT 0,
    amount_of_wood INT DEFAULT 0,
    amount_of_food INT DEFAULT 0,
    solders_num INT DEFAULT 0,
    CONSTRAINT not_negetive CHECK (
        amount_of_gold >= 0 AND
        amount_of_wood >= 0 AND
        amount_of_food >= 0 AND
        solders_num >= 0
    )
);

CREATE TABLE Role (
    role_id INT NOT NULL PRIMARY KEY,
    role_name VARCHAR(65) NOT NULL
);

CREATE TABLE Duty (
    duty_id INT NOT NULL PRIMARY KEY,
    duty_name VARCHAR(65) NOT NULL
);

CREATE TABLE UserData (
    username VARCHAR(255) NOT NULL PRIMARY KEY,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    user_current_duty INT FOREIGN KEY REFERENCES UserDutyHistory(duty_history_id),
    CONSTRAINT email_format CHECK (
        email LIKE '%_@__%.__%'
    )
);

CREATE TABLE UserDutyHistory (
    duty_history_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(255) FOREIGN KEY REFERENCES UserData(username),
    duty_id INT FOREIGN KEY REFERENCES DUTY(duty_id)
    passed_cycle INT DEFAULT 0,
    CONSTRAINT be_unique UNIQUE (username, duty_id)
);

CREATE TABLE Building (
    building_id INT NOT NULL PRIMARY KEY,
    building_name VARCHAR(65) NOT NULL
);

CREATE TABLE BuildingsOfClans (
    clan_name VARCHAR(255) FOREIGN KEY REFERENCES Clan(clan_name),
    building_id INT FOREIGN KEY REFERENCES Building(building_id),
    percentage_of_progress DECIMAL DEFAULT 0,
    PRIMARY KEY (clan_name, building_id),
    CONSTRAINT percentage CHECK (
        0 <= percentage_of_progress AND percentage_of_progress <= 100
    )
);

CREATE TABLE RolesOfClans (
    id INT IDENTITY(1,1) PRIMARY KEY,
    clan_name VARCHAR(255) FOREIGN KEY REFERENCES Clan(clan_name),
    role_id INT FOREIGN KEY REFERENCES Role(role_id),
    CONSTRAINT be_unique UNIQUE (clan_name, role_id)
);

CREATE TABLE DoWar (
    starter VARCHAR(255) FOREIGN KEY REFERENCES Clan(clan_name),
    threatened VARCHAR(255) FOREIGN KEY REFERENCES Clan(clan_name),
    winner_id INT CHECK (winner_id IN (0, 1)),
    war_time TIMESTAMP,
    winner_fatality_percentage INT CHECK (
        winner_fatality_percentage >= 10 AND
        winner_fatality_percentage <= 20
    ),
    loser_fatality_percentage INT CHECK (
        loser_fatality_percentage >= 20 AND
        loser_fatality_percentage <= 30
    )
);

CREATE TABLE Membership (
    user_id VARCHAR(255) FOREIGN KEY REFERENCES UserData(username),
    roles_clans_id INT FOREIGN KEY REFERENCES RolesOfClans(id)
);

GO
