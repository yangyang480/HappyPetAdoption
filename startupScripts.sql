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
    zipcode varchar(50) NOT NULL,
    phone varchar(225) NOT NULL,
	userTypeId int NOT NULL,
    createdDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    foreign key (userTypeId) references UserType(id) ON DELETE restrict);
    
CREATE TABLE AnimalSpecies (
	id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	name varchar(225) NOT NULL,
	createdDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP());

CREATE TABLE Animal(
	id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	name varchar(225) NOT NULL,
	age int,
	gender varchar(20) NOT NULL,
	weight DOUBLE(10,3) NOT NULL,
	speciesId int NOT NULL,
	description varchar(255) NOT NULL,
-- 	status boolean  NOT NULL,
	shelterId int NOT NULL,
	createdDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	updatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	foreign key (speciesId) references AnimalSpecies(id) ON DELETE restrict,
	foreign key (shelterId) references User(id) ON DELETE restrict);

CREATE TABLE Adoption (
	id int PRIMARY KEY AUTO_INCREMENT NOT NULL,
	animalId int NOT NULL,
	rescuerId int NOT NULL,
	shelterId int NOT NULL,
	orderStatus ENUM ('REQUESTED', 'PENDING', 'CANCELED', 'COMPLETED') NOT NULL,
	createdDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	updatedDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(),
	foreign key (animalId) references Animal (id) ON DELETE restrict,
	foreign key (shelterId) references User(id) ON DELETE restrict,
	foreign key (rescuerId) references User(id) ON DELETE restrict);

### Insert Info ###
INSERT INTO UserType (id, userType)
VALUES
(0, 'Shelter'),
(1, 'Rescuer');

INSERT INTO User (id, email, password, name, address, city, state, zipcode, phone, userTypeId)
VALUES
    (1, 'oak@gmail.com', 'hfsgfydg', 'Oak Knoll Animal Shelter', '6315 Minnetonka Blvd', 'Los Angeles', 'LA', 76342, '6538762435', 0),
    (2, 'banfield@gmail.com', 'tdagew453dd', 'Banfield Pet Shelter', '651 Winnetka Ave N', 'Minneapolis', 'MN', 65423, '7463569874', 0),
    (3, 'edina@gmail.com', 'tjkjgeefe73dd', 'Edina Pet Shelter', '7701 Cahill Rd', 'Houston', 'TX', 62241, '8542436254', 0),
    (4, 'jaden@g.com', 'ythdv653gi', 'Jaden', '8610Minnehaha', 'Rhome', 'TX', 45321, '7652445380', 1),
    (5, 'Mary@g.com', 'kajdgr3646', 'Mary', '8765 St paul', 'Chicago', 'IL', 54821, '1489526741', 1),
    (6, 'Art@g.com', 'vkfje644', 'Art', '6532 University st', 'San Fransico', 'LA', 98562, '98548756123', 1);

INSERT INTO AnimalSpecies (id, name)
VALUES
    (1, 'Dog'),
    (2, 'Cat'),
    (3, 'Rat');

INSERT INTO Animal (id, name, age, gender, weight, speciesId, description, shelterId)
VALUES
    (1, 'Ruby', 2, 'Female', 10.2, 1, 'Ruby is the a little', 1),
    (2, 'Wani', 3, 'Male', 12.2, 2, 'Ruby is the a little', 3),
    (3, 'Kiwi', 1, 'Female', 15, 3, 'Ruby is the a little', 1);

INSERT INTO Adoption (id, animalId, rescuerId, shelterId, orderStatus)
VALUES
(1, 1, 4, 1, 'REQUESTED'),
(2, 2, 5, 3, 'COMPLETED');
