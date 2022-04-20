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
    name varchar(225) NOT NULL);   

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
	weight DOUBLE NOT NULL,
	speciesId int NOT NULL,
	description varchar(255) NOT NULL,
-- 	status boolean  NOT NULL,
	shelterId int NOT NULL,
	imgURL varchar(255) NOT NULL,
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
INSERT INTO UserType (id, name)
VALUES
(0, 'Shelter'),
(1, 'Rescuer');

INSERT INTO User (id, email, password, name, address, city, state, zipcode, phone, userTypeId)
VALUES
(1, 'Oak321@gmail.com', '$2a$10$z/1Dp5EVw4ioNXRAgSvWCOPGk9sLfZ4FSNGQH0zrwUCY5qV7OR32S', 'Oak Knoll Animal Shelter', '6315 Minnetonka Blvd', 'Los Angeles', 'LA', 76342, '6538762435', 0),
(2, 'Banfield20@gmail.com', '$2a$10$XKWgWHGP.qhdnmINSN83qeIugqm7YsIdwKjaNYfkCvjKG1Afkvq0y', 'Banfield Pet Shelter', '651 Winnetka Ave N', 'Minneapolis', 'MN', 65423, '7463569874', 0),
(3, 'edina@gmail.com', '$2a$12$LBB13.5MS6hQIvMGQlWIBOgk0NA6PiUg66omMzuFRA9SqwQ2MX9vi', 'Edina Pet Shelter', '7701 Cahill Rd', 'Houston', 'TX', 62241, '8542436254', 0),
(4, 'Jaden@143.com', '$2a$10$4tZh4VBFxsB0v9u7KwzTZOV4jQtaLSeWS2ddziz6ZDgVDqAnDpa0a', 'Jaden', '8610Minnehaha', 'Rhome', 'TX', 45321, '7652445380', 1),
(5, 'Mary@g.com', '$2a$12$0g03ObFvj92cZ2DI1SPaVuH6c0xzUvCtN/kQQGZvBoi2MOOEiDREO', 'Mary', '8765 St paul', 'Chicago', 'IL', 54821, '1489526741', 1),
(6, 'Art@g.com', '$2a$12$2AEwC/ROabFpFLnn6/N7l.Z98P.mwADDDR1xLreVbCr0z52NhzdfO', 'Art', '6532 University st', 'San Fransico', 'LA', 98562, '98548756123', 1);

INSERT INTO AnimalSpecies (id, name)
VALUES
    (1, 'Dog'),
    (2, 'Cat'),
    (3, 'Rat');

INSERT INTO Animal (id, name, age, gender, weight, speciesId, description, shelterId, imgURL)
VALUES
    (1, 'Ruby', 2, 'Female', 10.2, 1, 'Ruby is the a little dog', 1, 'https://placekitten.com/401/401'),
    (2, 'Wani', 3, 'Male', 12.2, 2, 'Wani is a cute girl', 3, 'https://placekitten.com/403/403'),
    (3, 'Kiwi', 1, 'Female', 15, 3, 'Kiwi is the only 12 month', 3, 'https://placekitten.com/404/404'),
    (4, 'Apple', 1, 'Male', 15, 1, 'Apple is the a little', 1, 'https://placekitten.com/408/408'),
    (5, 'Banana', 2, 'Female', 15, 2, 'Banana is the a little', 2, 'https://placekitten.com/401/401'),
    (6, 'Haha', 1, 'Male', 15, 2, 'Haha is the one of us favorite', 1, 'https://placekitten.com/406/406'),
    (7, 'Yaya', 3, 'Female', 15, 1, 'Yaya is the a little', 2, 'https://placekitten.com/407/407');


INSERT INTO Adoption (id, animalId, rescuerId, shelterId, orderStatus)
VALUES
(1, 1, 4, 1, 'REQUESTED'),
(2, 2, 5, 3, 'COMPLETED');
