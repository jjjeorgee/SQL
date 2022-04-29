CREATE TABLE S(
S_NO VARCHAR(5) PRIMARY KEY,
SNAME CHAR(10),
STATUS INT(4),
CITY CHAR(15)
);
INSERT INTO S
VALUES
('S1', 'Smith', 20, 'London'),
('S2', 'Jones', 10, 'Paris'),
('S3', 'Blake', 30, 'Paris'),
('S4', 'Clark', 20, 'London'),
('S5', 'Adams', 30, 'Athens');
SELECT * 
FROM S;

CREATE TABLE P(
P_NO VARCHAR(4) PRIMARY KEY,
PNAME CHAR(20),
COLOR CHAR(20),
WEIGHT DECIMAL(20, 3),
CITY CHAR(20)
);
INSERT INTO P
VALUES
('P1','Nut', 'Red', 12.0, 'London'),
('P2', 'Bolt', 'Green', 17.0, 'Paris'),
('P3', 'Screw', 'Blue', 17.0, 'Oslo'),
('P4', 'Screw', 'Red', '14.0', 'London'),
('P5', 'Cam', 'Blue', '12.0', 'Paris'),
('P6', 'Cog', 'Red', '19.0', 'London');

CREATE TABLE j (
  `J_NO` VARCHAR(5) NOT NULL,
  `JNAME` VARCHAR(45) NULL,
  `CITY` VARCHAR(45) NULL,
  PRIMARY KEY (`J_NO`)
  );
INSERT INTO `sql_drills`.`j` (`J_NO`, `JNAME`, `CITY`) VALUES ('J1', 'Sorter', 'Paris');
INSERT INTO `sql_drills`.`j` (`J_NO`, `JNAME`, `CITY`) VALUES ('J2', 'Display', 'Rome');
INSERT INTO `sql_drills`.`j` (`J_NO`, `JNAME`, `CITY`) VALUES ('J3', 'OCR', 'Athens');
INSERT INTO `sql_drills`.`j` (`J_NO`, `JNAME`, `CITY`) VALUES ('J4', 'Console', 'Athens');
INSERT INTO `sql_drills`.`j` (`J_NO`, `JNAME`, `CITY`) VALUES ('J5', 'RAID', 'London');
INSERT INTO `sql_drills`.`j` (`J_NO`, `JNAME`, `CITY`) VALUES ('J6', 'EDS', 'Oslo');
INSERT INTO `sql_drills`.`j` (`J_NO`, `JNAME`, `CITY`) VALUES ('J7', 'Tape', 'London');

CREATE TABLE spj (
  `S_NO` VARCHAR(5) NOT NULL,
  `P_NO` VARCHAR(5) NOT NULL,
  `J_NO` VARCHAR(5) NOT NULL,
  `QTY` INT NULL,
  PRIMARY KEY (`S_NO`, `P_NO`, `J_NO`),
  INDEX `P_NO_idx` (`P_NO` ASC),
  INDEX `J_NO_idx` (`J_NO` ASC),
  CONSTRAINT `S_NO`
    FOREIGN KEY (`S_NO`)
    REFERENCES `sql_drills`.`s` (`S_NO`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `P_NO`
    FOREIGN KEY (`P_NO`)
    REFERENCES `sql_drills`.`p` (`P_NO`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `J_NO`
    FOREIGN KEY (`J_NO`)
    REFERENCES `sql_drills`.`j` (`J_NO`)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S1', 'P1', 'J1', '200');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S1', 'P1', 'J4', '700');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S2', 'P3', 'J1', '400');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S2', 'P3', 'J2', '200');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S2', 'P3', 'J3', '200');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S2', 'P3', 'J4', '500');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S2', 'P3', 'J5', '600');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S2', 'P3', 'J6', '400');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S2', 'P3', 'J7', '800');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S2', 'P5', 'J2', '100');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S3', 'P3', 'J1', '200');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S3', 'P4', 'J2', '500');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S4', 'P6', 'J3', '300');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S4', 'P6', 'J7', '300');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S5', 'P2', 'J2', '200');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S5', 'P2', 'J4', '100');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S5', 'P5', 'J5', '500');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S5', 'P5', 'J7', '100');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S5', 'P6', 'J2', '200');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S5', 'P1', 'J4', '100');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S5', 'P3', 'J4', '200');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S5', 'P4', 'J4', '800');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S5', 'P5', 'J4', '400');
INSERT INTO `sql_drills`.`spj` (`S_NO`, `P_NO`, `J_NO`, `QTY`) VALUES ('S5', 'P6', 'J4', '500');
