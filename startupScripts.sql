### animaladoption ###
### Drop Tables ###
DROP TABLE Adoptions;
DROP TABLE Animals;
DROP TABLE UserType;
DROP TABLE Users;
DROP TABLE AnimalSpecies;

### Create Tables ###
CREATE TABLE Users(
	id int PRIMARY KEY AUTO_INCREMENT UNIQUE,
	userEmail varchar(225) NOT NULL UNIQUE,
	userPassword varchar(225) NOT NULL,
	userName varchar(225) NOT NULL,
	userAddress varchar(225) NOT NULL,
	userCity varchar(225) NOT NULL,
    userState varchar(225) NOT NULL,
    userZipcode int NOT NULL,
    userPhone varchar(225) NOT NULL,
    userCreateDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    userUpdateDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE UserType(
	userTypeID int NOT NULL PRIMARY KEY UNIQUE,
    userType varchar(225) NOT NULL,
    userID int NOT NULL,
    foreign key (userID) references Users(id) ON DELETE restrict);   
    
CREATE TABLE AnimalSpecies (
	animalSpeciesID int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	speciesName varchar(225) NOT NULL,
	speciesCreateDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP());

CREATE TABLE Animals(
	animalID int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	animalName varchar(225) NOT NULL,
	animalAge int,
	animalGender varchar(20) NOT NULL,
	animalWeight DECIMAL(10,3) NOT NULL,
	animalSpeciesID int NOT NULL,
    animalDescription varchar(255) NOT NULL,
	animalStatus boolean  NOT NULL,
	userHospitalID int NOT NULL,
	animalCreateDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	animalUpdateDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	foreign key (animalSpeciesID) references AnimalSpecies(animalSpeciesID) ON DELETE restrict,
	foreign key (userHospitalID) references Users(id) ON DELETE restrict);

CREATE TABLE Adoptions (
	orderID int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	animalID int NOT NULL,
	userRescuerID int NOT NULL,
	userHospitalID int NOT NULL,
	orderStatus ENUM ('Accept', 'Waiting for pick up', 'Finished') NOT NULL,
	orderCreateDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	orderUpdateDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    foreign key (animalID) references Animals (animalID) ON DELETE restrict,
	foreign key (userHospitalID) references Users(id) ON DELETE restrict,
    foreign key (userRescuerID) references Users(id) ON DELETE restrict);

### Insert Info ###
INSERT INTO Users (id, userEmail, userPassword, userName, userAddress, userCity, userState, userZipcode, userPhone)
VALUES
(1, 'oak@gmail.com', 'hfsgfydg', 'Oak Knoll Animal Hospital', '6315 Minnetonka Blvd', 'Los Angeles', 'LA', 76342, '6538762435'),
(2, 'banfield@gmail.com', 'tdagew453dd', 'Banfield Pet Hospital', '651 Winnetka Ave N', 'Minneapolis', 'MN', 65423, '7463569874'),
(3, 'edina@gmail.com', 'tjkjgeefe73dd', 'Edina Pet Hospital', '7701 Cahill Rd', 'Houston', 'TX', 62241, '8542436254'),
(4, 'jaden@g.com', 'ythdv653gi', 'Jaden', '8610Minnehaha', 'Rhome', 'TX', 45321, '7652445380'),
(5, 'Mary@g.com', 'kajdgr3646', 'Mary', '8765 St paul', 'Chicago', 'IL', 54821, '1489526741'),
(6, 'Art@g.com', 'vkfje644', 'Art', '6532 University st', 'San Fransico', 'LA', 98562, '98548756123');

INSERT INTO UserType (userTypeID, userType, userID)
VALUES
(0, 'Hospital', 1),
(1, 'Rescuer', 6);

INSERT INTO AnimalSpecies (animalSpeciesID, speciesName)
VALUES
(1, 'Dog'),
(2, 'Cat'),
(3, 'Rat');

INSERT INTO Animals (animalID, animalName, animalAge, animalGender, animalWeight, animalSpeciesID, animalDescription, animalStatus, userHospitalID)
VALUES
(1, 'Ruby', 2, 'Female', 10.2, 1, 'Ruby is the a little', true, 1),
(2, 'Wani', 3, 'Male', 12.2, 2, 'Ruby is the a little', true, 3),
(3, 'Kiwi', 1, 'Female', 15, 3, 'Ruby is the a little', true, 1);

INSERT INTO Adoptions (orderID, animalID, userRescuerID, userHospitalID, orderStatus)
VALUES
(1, 1, 4, 1, 'Waiting for pick up'),
(2, 2, 5, 3, 'Finished');
