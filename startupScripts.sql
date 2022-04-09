### animaladoption ###
### Drop Tables ###
DROP TABLE Adoption;
DROP TABLE Animal;
DROP TABLE User;
DROP TABLE UserType;
DROP TABLE AnimalSpecies;

### Create Tables ###
CREATE TABLE UserType(
	id int NOT NULL PRIMARY KEY UNIQUE,
    userType varchar(225) NOT NULL);   

CREATE TABLE User(
	id int PRIMARY KEY AUTO_INCREMENT UNIQUE,
	email varchar(225) NOT NULL UNIQUE,
	password varchar(225) NOT NULL,
	name varchar(225) NOT NULL,
	address varchar(225) NOT NULL,
	city varchar(225) NOT NULL,
    state varchar(225) NOT NULL,
    zipcode int NOT NULL,
    phone varchar(225) NOT NULL,
	userTypeID int NOT NULL,
    createDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updateDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    foreign key (userTypeID) references UserType(id) ON DELETE restrict);
    
CREATE TABLE AnimalSpecies (
	animalSpeciesID int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	speciesName varchar(225) NOT NULL,
	speciesCreateDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP());

CREATE TABLE Animal(
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
	foreign key (userHospitalID) references User(id) ON DELETE restrict);

CREATE TABLE Adoption (
	orderID int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	animalID int NOT NULL,
	userRescuerID int NOT NULL,
	userHospitalID int NOT NULL,
	orderStatus ENUM ('Accept', 'Waiting for pick up', 'Finished') NOT NULL,
	orderCreateDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	orderUpdateDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    foreign key (animalID) references Animal (animalID) ON DELETE restrict,
	foreign key (userHospitalID) references User(id) ON DELETE restrict,
    foreign key (userRescuerID) references User(id) ON DELETE restrict);

### Insert Info ###
INSERT INTO UserType (id, userType)
VALUES
(0, 'Hospital'),
(1, 'Rescuer');

INSERT INTO User (id, email, password, name, address, city, state, zipcode, phone, userTypeID)
VALUES
(1, 'oak@gmail.com', 'hfsgfydg', 'Oak Knoll Animal Hospital', '6315 Minnetonka Blvd', 'Los Angeles', 'LA', 76342, '6538762435', 0),
(2, 'banfield@gmail.com', 'tdagew453dd', 'Banfield Pet Hospital', '651 Winnetka Ave N', 'Minneapolis', 'MN', 65423, '7463569874', 0),
(3, 'edina@gmail.com', 'tjkjgeefe73dd', 'Edina Pet Hospital', '7701 Cahill Rd', 'Houston', 'TX', 62241, '8542436254', 0),
(4, 'jaden@g.com', 'ythdv653gi', 'Jaden', '8610Minnehaha', 'Rhome', 'TX', 45321, '7652445380', 1),
(5, 'Mary@g.com', 'kajdgr3646', 'Mary', '8765 St paul', 'Chicago', 'IL', 54821, '1489526741', 1),
(6, 'Art@g.com', 'vkfje644', 'Art', '6532 University st', 'San Fransico', 'LA', 98562, '98548756123', 1);

INSERT INTO AnimalSpecies (animalSpeciesID, speciesName)
VALUES
(1, 'Dog'),
(2, 'Cat'),
(3, 'Rat');

INSERT INTO Animal (animalID, animalName, animalAge, animalGender, animalWeight, animalSpeciesID, animalDescription, animalStatus, userHospitalID)
VALUES
(1, 'Ruby', 2, 'Female', 10.2, 1, 'Ruby is the a little', true, 1),
(2, 'Wani', 3, 'Male', 12.2, 2, 'Ruby is the a little', true, 3),
(3, 'Kiwi', 1, 'Female', 15, 3, 'Ruby is the a little', true, 1);

INSERT INTO Adoption (orderID, animalID, userRescuerID, userHospitalID, orderStatus)
VALUES
(1, 1, 4, 1, 'Waiting for pick up'),
(2, 2, 5, 3, 'Finished');
