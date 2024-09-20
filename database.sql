DROP DATABASE IF EXISTS airline;
CREATE DATABASE IF NOT EXISTS airline;
USE airline;

DROP TABLE IF EXISTS location;
CREATE TABLE location (
	locationID varchar(50) not null,
    PRIMARY KEY (locationID)
) ENGINE=innodb;

INSERT INTO location (locationID) VALUES
('port_1'),('port_2'),('port_3'),('port_10'),('port_17'),
('plane_1'),('plane_5'),('plane_8'),('plane_13'),('plane_20'),
('port_12'),('port_14'),('port_15'),('port_20'),('port_4'),
('port_16'),('port_11'),('port_23'),('port_7'),('port_6'),
('port_13'),('port_21'),('port_18'),('port_22'),
('plane_6'),('plane_18'),('plane_7');


DROP TABLE IF EXISTS route;
CREATE TABLE route (
	routeID varchar(50) not null,
    PRIMARY KEY (routeID)
) ENGINE=innodb;

INSERT INTO route (routeID) VALUES
('americas_hub_exchange'),
('americas_one'),
('americas_three'),
('americas_two'),
('euro_north'),
('euro_south'),
('big_europe_loop'),
('pacific_rim_tour'),
('germany_local'),
('south_euro_loop'),
('texas_local');

DROP TABLE IF EXISTS airport;
CREATE TABLE airport (
	airportID char(3) not null,
    airportName varchar(100) not null,
    city varchar(100) not null,
    state varchar(100) not null,
    country varchar(100) not null,
    locationID varchar(50),
    PRIMARY KEY (airportID),
    CONSTRAINT fk15 FOREIGN KEY (locationID) REFERENCES location(locationID)
) ENGINE=innodb;

INSERT INTO airport (airportID, airportName, city, state, country, locationID) VALUES
('ATL', 'Atlanta Hartsfield_Jackson International', 'Atlanta', 'Georgia', 'USA', 'port_1'),
('DXB', 'Dubai International', 'Dubai', 'Al Garhoud', 'UAE', 'port_2'),
('HND', 'Tokyo International Haneda', 'Ota City', 'Tokyo', 'JPN', 'port_3'),
('LHR', 'London Heathrow', 'London', 'England', 'GBR', 'port_4'),
('IST', 'Istanbul International', 'Arnavutkoy', 'Istanbul', 'TUR', null),
('DFW', 'Dallas_Fort Worth International', 'Dallas', 'Texas', 'USA', 'port_6'),
('CAN', 'Guangzhou International', 'Guangzhou', 'Guangdong', 'CHN', 'port_7'),
('DEN', 'Denver International', 'Denver', 'Colorado', 'USA', null),
('LAX', 'Los Angeles International', 'Los Angeles', 'California', 'USA', null),
('ORD', 'O_Hare International', 'Chicago', 'Illinois', 'USA', 'port_10'),
('AMS', 'Amsterdam Schipol International', 'Amsterdam', 'Haarlemmermeer', 'NLD', 'port_11'),
('CDG', 'Paris Charles de Gaulle', 'Roissy_en_France', 'Paris', 'FRA', 'port_12'),
('FRA', 'Frankfurt International', 'Frankfurt_Rhine_Main', 'Frankfurt', 'DEU', 'port_13'),
('MAD', 'Madrid Adolfo Suarez_Barajas', 'Madrid', 'Barajas', 'ESP', 'port_14'),
('BCN', 'Barcelona International', 'Barcelona', 'Catalonia', 'ESP', 'port_15'),
('FCO', 'Rome Fiumicino', 'Fiumicino', 'Lazio', 'ITA', 'port_16'),
('LGW', 'London Gatwick', 'London', 'England', 'GBR', 'port_17'),
('MUC', 'Munich International', 'Munich', 'Bavaria', 'DEU', 'port_18'),
('MDW', 'Chicago Midway International', 'Chicago', 'Illinois', 'USA', null),
('IAH', 'George Bush Intercontinental', 'Houston', 'Texas', 'USA', 'port_20'),
('HOU', 'William P_Hobby International', 'Houston', 'Texas', 'USA', 'port_21'),
('NRT', 'Narita International', 'Narita', 'Chiba', 'JPN', 'port_22'),
('BER', 'Berlin Brandenburg Willy Brandt International', 'Berlin', 'Schonefeld', 'DEU', 'port_23');

DROP TABLE IF EXISTS airline;
CREATE TABLE airline (
	airlineID varchar(50) not null,
    revenue int not null,
    PRIMARY KEY (airlineID)
) ENGINE=innodb;

INSERT INTO airline (airlineID, revenue) VALUES
('Delta', 53000),
('United', 48000),
('British Airways', 24000),
('Lufthansa', 35000),
('Air_France', 29000),
('KLM', 29000),
('Ryanair', 10000),
('Japan Airlines', 9000),
('China Southern Airlines', 14000),
('Korean Air Lines', 10000),
('American', 52000);

DROP TABLE IF EXISTS airplane;
CREATE TABLE airplane (
	tailNumber varchar(50) not null,
    seat_cap int not null,
    speed int not null,
    airlineID varchar(50) not null,
    planeType varchar(100),
    skids boolean,
    props int,
	planeEngines int,
    locationID varchar(50),
	PRIMARY KEY (tailNumber, airlineID),
    CONSTRAINT fk5 FOREIGN KEY (airlineID) REFERENCES airline(airlineID),
    CONSTRAINT fk17 FOREIGN KEY (locationID) REFERENCES location(locationID)
) ENGINE = innodb;

INSERT INTO airplane (tailNumber, seat_cap, speed, airlineID, planeType, skids, props, planeEngines, locationID)
VALUES
('n106js', 4, 800, 'Delta', 'jet', NULL, NULL, 2, 'plane_1'),
('n110jn', 5, 800, 'Delta', 'jet', NULL, NULL, 2, NULL),
('n127js', 4, 600, 'Delta', 'jet', NULL, NULL, 4, NULL),
('n330ss', 4, 800, 'United', 'jet', NULL, NULL, 2, 'plane_5'),
('n380sd', 5, 400, 'United', 'jet', NULL, NULL, 2, NULL),
('n616lt', 7, 600, 'British Airways', 'jet', NULL, NULL, 2, 'plane_6'),
('n517ly', 4, 600, 'British Airways', 'jet', NULL, NULL, 2, 'plane_7'),
('n620la', 4, 800, 'Lufthansa', 'jet', NULL, NULL, 4, 'plane_8'),
('n401fj', 4, 300, 'Lufthansa', NULL, NULL, NULL, NULL, NULL),
('n653fk', 6, 600, 'Lufthansa', 'jet', NULL, NULL, 2, NULL),
('n118fm', 4, 400, 'Air_France', 'prop', FALSE, 2, NULL, NULL),
('n815pw', 3, 400, 'Air_France', 'jet', NULL, NULL, 2, NULL),
('n161fk', 4, 600, 'KLM', 'jet', NULL, NULL, 4, 'plane_13'),
('n337as', 5, 400, 'KLM', 'jet', NULL, NULL, 2, NULL),
('n256ap', 4, 300, 'KLM', 'prop', FALSE, 2, NULL, NULL),
('n156sq', 8, 600, 'Ryanair', 'jet', NULL, NULL, 2, NULL),
('n451fi', 5, 600, 'Ryanair', 'jet', NULL, NULL, 4, NULL),
('n341eb', 4, 400, 'Ryanair', 'prop', TRUE, 2, NULL, 'plane_18'),
('n353kz', 4, 400, 'Ryanair', 'prop', TRUE, 2, NULL, NULL),
('n305fv', 6, 400, 'Japan Airlines', 'jet', NULL, NULL, 2, 'plane_20'),
('n443wu', 4, 800, 'Japan Airlines', 'jet', NULL, NULL, 4, NULL),
('n454gq', 3, 400, 'China Southern Airlines', NULL, NULL, NULL, NULL, NULL),
('n249yk', 4, 400, 'China Southern Airlines', 'prop', FALSE, NULL, NULL, NULL),
('n180co', 5, 600, 'Korean Air Lines', 'jet', NULL, NULL, 2, NULL),
('n448cs', 4, 400, 'American', 'prop', TRUE, 2, NULL, NULL),
('n225sb', 8, 600, 'American', 'jet', NULL, NULL, 4, NULL),
('n553qn', 5, 800, 'American', 'jet', NULL, NULL, 2, NULL);

DROP TABLE IF EXISTS flight;
CREATE TABLE flight (
	flightID varchar(50) not null,
    cost int not null,
    routeID varchar(50) not null,
    progress varchar(100) not null,
    flightStatus varchar(100) not null,
    next_time varchar(100) not null,
    tailID varchar(50) not null,
    PRIMARY KEY (flightID),
    CONSTRAINT fk9 FOREIGN KEY (routeID) references route(routeID),
    CONSTRAINT fk6 FOREIGN KEY (tailID) references airplane(tailNumber)
) ENGINE=innodb;

INSERT INTO flight (flightID, cost, routeID, progress, flightStatus, next_time, tailID) VALUES
('dl_10', 200, 'americas_one', 1, 'in_flight', '08:00:00', 'n106js'),
('un_38', 200, 'americas_three', 2, 'in_flight', '14:30:00', 'n380sd'),
('ba_61', 200, 'americas_two', 0, 'on_ground', '09:30:00', 'n616lt'),
('lf_20', 300, 'euro_north', 3, 'in_flight', '11:00:00', 'n620la'),
('km_16', 400, 'euro_south', 6, 'in_flight', '14:00:00', 'n161fk'),
('ba_51', 100, 'big_europe_loop', 0, 'on_ground', '11:30:00', 'n517ly'),
('ja_35', 300, 'pacific_rim_tour', 1, 'in_flight', '09:30:00', 'n305fv'),
('ry_34', 100, 'germany_local', 0, 'on_ground', '15:00:00', 'n341eb');

DROP TABLE IF EXISTS person;
CREATE TABLE person (
    firstName varchar(100) not null,
    lastName varchar(100), -- can be null
    personID varchar(50) not null,
    locationID varchar(50),
    PRIMARY KEY (personID),
    CONSTRAINT fk14 FOREIGN KEY (locationID) REFERENCES location(locationID)
) ENGINE=innodb;

INSERT INTO person (personID, firstName, lastName, locationID) VALUES
('p1','Jeanne','Nelson','port_1'),
('p10','Lawrence','Morgan','port_3'),
('p11','Sandra','Cruz','port_3'),
('p12','Dan','Ball','port_3'),
('p13','Bryant','Figueroa','port_3'),
('p14','Dana','Perry','port_3'),
('p15','Matt','Hunt','port_10'),
('p16','Edna','Brown','port_10'),
('p17','Ruby','Burgess','port_10'),
('p18','Esther','Pittman','port_10'),
('p19','Doug','Fowler','port_17'),
('p2','Roxanne','Byrd','port_1'),
('p20','Thomas','Olson','port_17'),
('p21','Mona','Harrison','plane_1'),
('p22','Arlene','Massey','plane_1'),
('p23','Judith','Patrick','plane_1'),
('p24','Reginald','Rhodes','plane_5'),
('p25','Vincent','Garcia','plane_5'),
('p26','Cheryl','Moore','plane_5'),
('p27','Michael','Rivera','plane_8'),
('p28','Luther','Matthews','plane_8'),
('p29','Moses','Parks','plane_13'),
('p3','Tanya','Nguyen','port_1'),
('p30','Ora','Steele','plane_13'),
('p31','Antonio','Flores','plane_13'),
('p32','Glenn','Ross','plane_13'),
('p33','Irma','Thomas','plane_20'),
('p34','Ann','Maldonado','plane_20'),
('p35','Jeffrey','Cruz','port_12'),
('p36','Sonya','Price','port_12'),
('p37','Tracy','Hale','port_12'),
('p38','Albert','Simmons','port_14'),
('p39','Karen','Terry','port_15'),
('p4','Kendra','Jacobs','port_1'),
('p40','Glen','Kelley','port_20'),
('p41','Brooke','Little','port_3'),
('p42','Daryl','Nguyen','port_4'),
('p43','Judy','Willis','port_14'),
('p44','Marco','Klein','port_15'),
('p45','Angelica','Hampton','port_16'),
('p5','Jeff','Burton','port_1'),
('p6','Randal','Parks','port_1'),
('p7','Sonya','Owens','port_2'),
('p8','Bennie','Palmer','port_2'),
('p9','Marlene','Warner','port_3');
    
DROP TABLE IF EXISTS pilot;
CREATE TABLE pilot (
	experience int,
    taxID varchar(50),
    flightID varchar(50),
    personID varchar(50) not null,
    PRIMARY KEY (personID),
    UNIQUE KEY (taxID),
    CONSTRAINT fk10 FOREIGN KEY (personID) REFERENCES person(personID),
    CONSTRAINT fk16 FOREIGN KEY (flightID) REFERENCES flight(flightID)
) ENGINE=innodb;

INSERT INTO pilot VALUES
(31, '330-12-6907', 'dl_10', 'p1'),
(15, '769-60-1266', 'lf_20', 'p10'),
(22, '369-22-9505', 'km_16', 'p11'),
(24, '680-92-5329', 'ry_34', 'p12'),
(24, '513-40-4168', 'km_16', 'p13'),
(13, '454-71-7847', 'km_16', 'p14'),
(30, '153-47-8101', 'ja_35', 'p15'),
(28, '598-47-5172', 'ja_35', 'p16'),
(36, '865-71-6800', NULL, 'p17'),
(23, '250-86-2784', NULL, 'p18'),
(2, '386-39-7881', NULL, 'p19'),
(9, '842-88-1257', 'dl_10', 'p2'),
(28, '522-44-3098', NULL, 'p20'),
(11, '750-24-7616', 'un_38', 'p3'),
(24, '776-21-8098', 'un_38', 'p4'),
(27, '933-93-2165', 'ba_61', 'p5'),
(38, '707-84-4555', 'ba_61', 'p6'),
(13, '450-25-5617', 'lf_20', 'p7'),
(12, '701-38-2179', 'ry_34', 'p8'),
(13, '936-44-6941', 'lf_20', 'p9');

DROP TABLE IF EXISTS passenger;
CREATE TABLE passenger (
	miles int,
    funds int,
    personID varchar(50) not null,
    PRIMARY KEY (personID),
    CONSTRAINT fk13 FOREIGN KEY (personID) REFERENCES person(personID)
) ENGINE=innodb;

INSERT INTO passenger VALUES
(771, 700, 'p21'),
(374, 200, 'p22'),
(414, 400, 'p23'),
(292, 500, 'p24'),
(390, 300, 'p25'),
(302, 600, 'p26'),
(470, 400, 'p27'),
(208, 400, 'p28'),
(292, 700, 'p29'),
(686, 500, 'p30'),
(547, 400, 'p31'),
(257, 500, 'p32'),
(564, 600, 'p33'),
(211, 200, 'p34'),
(233, 500, 'p35'),
(293, 400, 'p36'),
(552, 700, 'p37'),
(812, 700, 'p38'),
(541, 400, 'p39'),
(441, 700, 'p40'),
(875, 300, 'p41'),
(691, 500, 'p42'),
(572, 300, 'p43'),
(572, 500, 'p44'),
(663, 500, 'p45');

DROP TABLE IF EXISTS vacation;
CREATE TABLE vacation (
	destination char(3),
    sequence int,
    personID varchar(50) not null,
    PRIMARY KEY (personID, destination, sequence),
    CONSTRAINT fk11 FOREIGN KEY (personID) REFERENCES passenger(personID)
) ENGINE=innodb;

INSERT INTO vacation (destination, sequence, personID) VALUES
('AMS', 1, 'p21'),
('AMS', 1, 'p22'),
('BER', 1, 'p23'),
('MUC', 1, 'p24'),
('CDG', 2, 'p24'),
('MUC', 1, 'p25'),
('MUC', 1, 'p26'),
('BER', 1, 'p27'),
('LGW', 1, 'p28'),
('FCO', 1, 'p29'),
('LHR', 2, 'p29'),
('FCO', 1, 'p30'),
('MAD', 2, 'p30'),
('FCO', 1, 'p31'),
('FCO', 1, 'p32'),
('CAN', 1, 'p33'),
('HND', 1, 'p34'),
('LGW', 1, 'p35'),
('FCO', 1, 'p36'),
('FCO', 1, 'p37'),
('LGW', 2, 'p37'),
('CDG', 3, 'p37'),
('MUC', 1, 'p38'),
('MUC', 1, 'p39'),
('HND', 1, 'p40');


DROP TABLE IF EXISTS license;
CREATE TABLE license (
    license varchar(100) not null,
    personID varchar(50) not null,
    PRIMARY KEY (personID, license),
    CONSTRAINT fk12 FOREIGN KEY (personID) REFERENCES pilot(personID)
) ENGINE=innodb;

INSERT INTO license (personID, license) VALUES
('p1', 'jets'),
('p10', 'jets'),
('p11', 'jets'),
('p11', 'props'),
('p12', 'props'),
('p13', 'jets'),
('p14', 'jets'),
('p15', 'jets'),
('p15', 'props'),
('p15', 'testing'),
('p16', 'jets'),
('p17', 'jets'),
('p17', 'props'),
('p18', 'jets'),
('p19', 'jets'),
('p2', 'jets'),
('p2', 'props'),
('p20', 'jets'),
('p3', 'jets'),
('p4', 'jets'),
('p4', 'props'),
('p5', 'jets'),
('p6', 'jets'),
('p6', 'props'),
('p7', 'jets'),
('p8', 'props'),
('p9', 'jets'),
('p9', 'props'),
('p9', 'testing');

DROP TABLE IF EXISTS leg;
CREATE TABLE leg (
    legID varchar(50) not null,
    distance int not null,
    departureID char(3) not null,
    arrivalID char(3) not null,
    PRIMARY KEY (legID),
    CONSTRAINT fk1 FOREIGN KEY (departureID) REFERENCES airport(airportID),
    CONSTRAINT fk2 FOREIGN KEY(arrivalID) REFERENCES airport(airportID)
) ENGINE=innodb;

INSERT INTO leg VALUES
('leg_1', 400, 'AMS', 'BER'),
('leg_2', 3900, 'ATL', 'AMS'),
('leg_3', 3700, 'ATL', 'LHR'),
('leg_4', 600, 'ATL', 'ORD'),
('leg_5', 500, 'BCN', 'CDG'),
('leg_6', 300, 'BCN', 'MAD'),
('leg_7', 4700, 'BER', 'CAN'),
('leg_8', 600, 'BER', 'LGW'),
('leg_9', 300, 'BER', 'MUC'),
('leg_10', 1600, 'CAN', 'HND'),
('leg_11', 500, 'CDG', 'BCN'),
('leg_12', 600, 'CDG', 'FCO'),
('leg_13', 200, 'CDG', 'LHR'),
('leg_14', 400, 'CDG', 'MUC'),
('leg_15', 200, 'DFW', 'IAH'),
('leg_16', 800, 'FCO', 'MAD'),
('leg_17', 300, 'FRA', 'BER'),
('leg_18', 100, 'HND', 'NRT'),
('leg_19', 300, 'HOU', 'DFW'),
('leg_20', 100, 'IAH', 'HOU'),
('leg_21', 600, 'LGW', 'BER'),
('leg_22', 600, 'LHR', 'BER'),
('leg_23', 500, 'LHR', 'MUC'),
('leg_24', 300, 'MAD', 'BCN'),
('leg_25', 600, 'MAD', 'CDG'),
('leg_26', 800, 'MAD', 'FCO'),
('leg_27', 300, 'MUC', 'BER'),
('leg_28', 400, 'MUC', 'CDG'),
('leg_29', 400, 'MUC', 'FCO'),
('leg_30', 200, 'MUC', 'FRA'),
('leg_31', 3700, 'ORD', 'CDG');

DROP TABLE IF EXISTS contains_relation;
CREATE TABLE contains_relation (
    sequence int not null,
    routeID varchar(50) not null,
    legID varchar(50) not null,
    PRIMARY KEY (routeID, legID),
    CONSTRAINT fk3 FOREIGN KEY (routeID) REFERENCES route(routeID),
    CONSTRAINT fk4 FOREIGN KEY (legID) REFERENCES leg(legID)
) ENGINE=innodb;

INSERT INTO contains_relation (sequence, routeID, legID) VALUES
(1, 'americas_hub_exchange', 'leg_4'),
(2, 'americas_one', 'leg_1'),
(1, 'americas_one', 'leg_2'),
(2, 'americas_three', 'leg_14'),
(1, 'americas_three', 'leg_31'),
(1, 'americas_two', 'leg_3'),
(2, 'americas_two', 'leg_22'),
(5, 'big_europe_loop', 'leg_13'),
(3, 'big_europe_loop', 'leg_16'),
(1, 'big_europe_loop', 'leg_23'),
(4, 'big_europe_loop', 'leg_25'),
(2, 'big_europe_loop', 'leg_29'),
(3, 'euro_north', 'leg_5'),
(6, 'euro_north', 'leg_8'),
(4, 'euro_north', 'leg_14'),
(1, 'euro_north', 'leg_16'),
(2, 'euro_north', 'leg_24'),
(5, 'euro_north', 'leg_27'),
(5, 'euro_south', 'leg_6'),
(2, 'euro_south', 'leg_9'),
(4, 'euro_south', 'leg_11'),
(1, 'euro_south', 'leg_21'),
(6, 'euro_south', 'leg_26'),
(3, 'euro_south', 'leg_28'),
(1, 'germany_local', 'leg_9'),
(3, 'germany_local', 'leg_17'),
(2, 'germany_local', 'leg_30'),
(1, 'pacific_rim_tour', 'leg_7'),
(2, 'pacific_rim_tour', 'leg_10'),
(3, 'pacific_rim_tour', 'leg_18'),
(1, 'south_euro_loop', 'leg_16'),
(3, 'south_euro_loop', 'leg_5'),
(2, 'south_euro_loop', 'leg_24'),
(4, 'south_euro_loop', 'leg_12'),
(1, 'texas_local', 'leg_15'),
(3, 'texas_local', 'leg_19'),
(2, 'texas_local', 'leg_20');