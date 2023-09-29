CREATE TABLE Equipment
(
    ID INT NOT NULL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Price INT NOT NULL
);

CREATE TABLE Employees
(
    ID INT NOT NULL PRIMARY KEY,
    Full_Name VARCHAR(50) NOT NULL,
    Job_TitleID INT NOT NULL,
    Phone INT NOT NULL UNIQUE,
    Address VARCHAR(100) NOT NULL UNIQUE,
    Schedule DATETIME NOT NULL UNIQUE,
    DepartmentID INT NOT NULL UNIQUE,
    EquipmentID INT NOT NULL UNIQUE,
    FOREIGN KEY (Job_TitleID)
        REFERENCES Job_Title(ID)
        ON DELETE CASCADE ON UPDATE NO ACTION
    FOREIGN KEY (DepartmentID)
        REFERENCES Department(ID)
        ON DELETE CASCADE ON UPDATE NO ACTION
    FOREIGN KEY (EquipmentID)
        REFERENCES Equipment(ID)
        ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE Job_Title
(
    ID INT NOT NULL PRIMARY KEY,
    Job_Title VARCHAR(50) NOT NULL,
    Salary INT NOT NULL UNIQUE,
);

CREATE TABLE Department
(
    ID INT NOT NULL PRIMARY KEY,
    Name VARCHAR(50) NOT NULL

);

CREATE TABLE Tv_Program_Guide
(
    ID INT NOT NULL PRIMARY KEY,
    Employees VARCHAR(50) NOT NULL UNIQUE,
    Data DATE NOT NULL,
    Start_Time TIME NOT NULL,
    End_Time TIME NOT NULL,
    TV_ShowsID INT NOT NULL UNIQUE,
    TV_ChannelID int NOT NULL UNIQUE,
    FOREIGN KEY (TV_ShowsID)
        REFERENCES TV_Shows(ID)
        ON DELETE CASCADE ON UPDATE NO ACTION
    FOREIGN KEY (TV_ChannelID)
        REFERENCES TV_Channel(ID)
        ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE TV_Shows
(
    ID INT NOT NULL PRIMARY KEY,
    TV_Shows INT NOT NULL UNIQUE,
    GenreID INT NOT NULL,
    Description VARCHAR(100) NOT NULL,
    FOREIGN KEY (GenreID)
        REFERENCES TV_Shows_Genre(ID)
        ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE TV_Channels
(
    ID INT NOT NULL PRIMARY KEY,
    TV_Channel INT NOT NULL,
    InvitedID INT NOT NULL,
    SpecializationID INT NOT NULL UNIQUE,
    FOREIGN KEY (InvitedID)
        REFERENCES Invited(ID)
        ON DELETE CASCADE ON UPDATE NO ACTION
    FOREIGN KEY (SpecializationID)
        REFERENCES Specialization(ID)
        ON DELETE CASCADE ON UPDATE NO ACTION
);

CREATE TABLE TV_Shows_Genre
(
    ID INT NOT NULL PRIMARY KEY,
    Genre VARCHAR(30) NOT NULL UNIQUE
);

CREATE TABLE Specialization
(
    ID INT NOT NULL PRIMARY KEY,
    Specialization VARCHAR(50) NOT NULL

);

CREATE TABLE Invited
(
    ID INT NOT NULL PRIMARY KEY,
    Full_Name VARCHAR(50) UNIQUE NOT NULL,
    Arrival_Date DATE NOT NULL
);

INSERT INTO Equipment(ID, Name, Price) VALUES (1, 'Камера', '$4000');
INSERT INTO Equipment(ID, Name, Price) VALUES (2, 'Штатив', '$1000');
INSERT INTO Equipment(ID, Name, Price) VALUES (3, 'Микрофон', '$2500');

INSERT INTO Employees(ID, Full_Name, Job_Title, Phone, Address, Schedule, DepartmentID, EquipmentID) VALUES (1, 'Моисеева Ксения Ивановна', 1, '+795454632', 'Ул. Иванова Дом 3', '4/7', 1, 1);
INSERT INTO Employees(ID, Full_Name, Job_Title, Phone, Address, Schedule, DepartmentID, EquipmentID) VALUES (2, 'Грибов Даниил Александрович', 2, '+79545245', 'Ул. Иванова Дом 4', '2/4', 2, 2);
INSERT INTO Employees(ID, Full_Name, Job_Title, Phone, Address, Schedule, DepartmentID, EquipmentID) VALUES (3, 'Старостин Иван Алексеевич', 3, '795454423', 'Ул. Иванова Дом 6', '4/7', 3, 3);

INSERT INTO Job_Title(ID, Job_Title, Salary) VALUES (1, 'Оператор', '$500');
INSERT INTO Job_Title(ID, Job_Title, Salary) VALUES (2, 'Журналист', '$1000');
INSERT INTO Job_Title(ID, Job_Title, Salary) VALUES (3, 'Режиссер', '$2500');

INSERT INTO Tv_Program_Guide(ID, Employees, Data, Start_Time, End_Time, TV_ShowsID, TV_ChannelID) VALUES (1, 'Оператор', 9:00:00, 18:00:00, 1, 1);
INSERT INTO Job_Title(ID, Employees, Data, Start_Time, End_Time, TV_ShowsID, TV_ChannelID) VALUES (2, 'Журналист', 10:30:00, 14:40:00, 2, 2);
INSERT INTO Job_Title(ID, Employees, Data, Start_Time, End_Time, TV_ShowsID, TV_ChannelID) VALUES (3, 'Режиссер', 8:20:00, 19:00:00, 3, 3);

INSERT INTO Department(ID, Name) VALUES (1, 'Круглые');
INSERT INTO Department(ID, Name) VALUES (2, 'Плоские');
INSERT INTO Department(ID, Name) VALUES (3, 'Прямые');

INSERT INTO TV_Shows(ID, TV_Shows, GenreID, Description) VALUES (1, 1, 1,'Очень хорошо');
INSERT INTO TV_Shows(ID, TV_Shows, GenreID, Description) VALUES (2, 2, 2,'Очень плохо');
INSERT INTO TV_Shows(ID, TV_Shows, GenreID, Description) VALUES (3, 3, 3,'Очень отлично');

INSERT INTO TV_Channel(ID, TV_Channels, InvitedID, SpecializationID) VALUES (1, 1, 1, 1);
INSERT INTO TV_Channel(ID, TV_Channels, InvitedID, SpecializationID) VALUES (2, 2, 2, 2);
INSERT INTO TV_Channel(ID, TV_Channels, InvitedID, SpecializationID) VALUES (3, 3, 3, 3);

INSERT INTO TV_Shows_Genre(ID, Genre) VALUES (1, 'Хорор');
INSERT INTO TV_Shows_Genre(ID, Genre) VALUES (2, 'Приключение');
INSERT INTO TV_Shows_Genre(ID, Genre) VALUES (3, 'Выживание');

INSERT INTO Specialization(ID, Specialization) VALUES (1, 'Развлекательное');
INSERT INTO Specialization(ID, Specialization) VALUES (2, 'Позновательное');
INSERT INTO Specialization(ID, Specialization) VALUES (3, 'Логическое');

INSERT INTO Invited(ID, Full_Name, Arrival_Date) VALUES (1, 'Кузин Никита Львович', 20.01.2021);
INSERT INTO Invited(ID, Full_Name, Arrival_Date) VALUES (2, 'Гаврилова Сабина Семёновна', 20.01.2022);
INSERT INTO Invited(ID, Full_Name, Arrival_Date) VALUES (3, 'Полякова Маргарита Алексеевна', 20.01.2023);