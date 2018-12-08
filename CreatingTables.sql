USE TRAVIANS

CREATE TABLE Building (
    building_id INT IDENTITY(1,1) PRIMARY KEY,
    building_name VARCHAR(65) NOT NULL
);

CREATE TABLE Clan (
    clan_name VARCHAR(255) NOT NULL PRIMARY KEY,
    slogan VARCHAR(255),
    amount_of_gold INT DEFAULT 0,
    amount_of_wood INT DEFAULT 0,
    amount_of_food INT DEFAULT 0,
    solders_num INT DEFAULT 0,
    experiment INT DEFAULT 0,
    clan_level INT DEFAULT 0,
    default_type_building INT FOREIGN KEY REFERENCES Building(building_id),
    CONSTRAINT not_negetive CHECK (
        amount_of_gold >= 0 AND
        amount_of_wood >= 0 AND
        amount_of_food >= 0 AND
        solders_num >= 0
    )
);

CREATE TABLE Role (
    role_id INT IDENTITY(1,1) PRIMARY KEY,
    role_name VARCHAR(65) NOT NULL,
    uniqueness INT NOT NULL --true or false!
);

CREATE TABLE RolesOfClans (
    id INT IDENTITY(1,1) PRIMARY KEY,
    clan_name VARCHAR(255) FOREIGN KEY REFERENCES Clan(clan_name),
    role_id INT FOREIGN KEY REFERENCES Role(role_id),
    CONSTRAINT unique_role_in_clan UNIQUE (clan_name, role_id)
);

CREATE TABLE Duty (
    duty_id INT IDENTITY(1,1) PRIMARY KEY,
    duty_name VARCHAR(65) NOT NULL
);

CREATE TABLE UserData (
    username VARCHAR(255) NOT NULL PRIMARY KEY,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    user_current_duty INT FOREIGN KEY REFERENCES Duty(duty_id),
    roles_of_clan_id INT FOREIGN KEY REFERENCES RolesOfClans(id),
    CONSTRAINT email_format CHECK (
        email LIKE '%_@__%.__%'
    )
);

CREATE TABLE UserDutyHistory (
    duty_history_id INT IDENTITY(1,1) PRIMARY KEY,
    username VARCHAR(255) FOREIGN KEY REFERENCES UserData(username),
    duty_id INT FOREIGN KEY REFERENCES DUTY(duty_id),
    passed_cycle INT DEFAULT 0, --TODO: in bayad ziad she ye ja :-???
    CONSTRAINT be_unique UNIQUE (username, duty_id)
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

GO
