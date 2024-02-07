/* Database of the Rehabilitation Center.
A student project on relational databases at the Polish-Japanese Academy of Information Technology.
The task was to design the database and write sample queries.*/

-- Tables

-- Table: Physiotherapist
CREATE TABLE Physiotherapist (
    IdPhysiotherapist integer  NOT NULL,
    IdPositionReh integer  NOT NULL,
    CONSTRAINT Physiotherapist_pk PRIMARY KEY (IdPhysiotherapist)
) ;

-- Table: Injury
CREATE TABLE Injury (
    IdInjury integer  NOT NULL,
    DescInjury varchar2(200)  NOT NULL,
    CONSTRAINT Injury_pk PRIMARY KEY (IdInjury)
) ;

-- Table: Doctor
CREATE TABLE Doctor (
    IdDoctor integer  NOT NULL,
    IdPositionDoc integer  NOT NULL,
    CONSTRAINT Doctor_pk PRIMARY KEY (IdDoctor)
) ;

-- Table: Person
CREATE TABLE Person (
    IdPerson integer  NOT NULL,
    FirstName varchar2(40)  NOT NULL,
    LastName varchar2(40)  NOT NULL,
    DateOfBirth date  NOT NULL,
    PESEL char(11)  NULL,
    Gender char(1)  NOT NULL,
    Address varchar2(60)  NOT NULL,
    PhoneNumber char(11)  NOT NULL,
    CONSTRAINT Person_pk PRIMARY KEY (IdPerson)
) ;

-- Table: Patient
CREATE TABLE Patient (
    IdPatient integer  NOT NULL,
    CONSTRAINT Patient_pk PRIMARY KEY (IdPatient)
) ;

-- Table: Room
CREATE TABLE Room (
    IdRoom integer  NOT NULL,
    RoomName char(20)  NOT NULL,
    CONSTRAINT Room_pk PRIMARY KEY (IdRoom)
) ;

-- Table: PositionDoc
CREATE TABLE PositionDoc (
    IdPositionDoc integer  NOT NULL,
    PositionName varchar2(60)  NOT NULL,
    CONSTRAINT PositionDoc_pk PRIMARY KEY (IdPositionDoc)
) ;

-- Table: PositionReh
CREATE TABLE PositionReh (
    IdPositionReh integer  NOT NULL,
    PositionName varchar2(60)  NOT NULL,
    CONSTRAINT PositionReh_pk PRIMARY KEY (IdPositionReh)
) ;

-- Table: VisitMedInjury
CREATE TABLE VisitMedInjury (
    IdVisitMed integer  NOT NULL,
    IdInjury integer  NOT NULL,
    DateInjury date  NOT NULL,
    CONSTRAINT VisitMedInjury_pk PRIMARY KEY (IdVisitMed,IdInjury)
) ;

-- Table: VisitMed
CREATE TABLE VisitMed (
    IdVisitMed integer  NOT NULL,
    DateVisitMed timestamp  NOT NULL,
    IdDoctor integer  NOT NULL,
    IdPatient integer  NOT NULL,
    IdRoom integer  NOT NULL,
    CONSTRAINT VisitMed_pk PRIMARY KEY (IdVisitMed)
) ;

-- Table: VisitRehInjury
CREATE TABLE VisitRehInjury (
    IdInjury integer  NOT NULL,
    IdVisitReh integer  NOT NULL,
    CONSTRAINT VisitRehInjury_pk PRIMARY KEY (IdInjury,IdVisitReh)
) ;

-- Table: RehabVisit
CREATE TABLE RehabVisit (
    IdVisitReh integer  NOT NULL,
    DateVisitReh timestamp  NOT NULL,
    IdPhysiotherapist integer  NOT NULL,
    IdPatient integer  NOT NULL,
    IdRoom integer  NOT NULL,
    CONSTRAINT RehabVisit_pk PRIMARY KEY (IdVisitReh)
) ;

-- foreign keys
-- Reference: Physiotherapist_Person (table: Physiotherapist)
ALTER TABLE Physiotherapist ADD CONSTRAINT Physiotherapist_Person
    FOREIGN KEY (IdPhysiotherapist)
    REFERENCES Person (IdPerson);

-- Reference: Physiotherapist_PositionReh (table: Physiotherapist)
ALTER TABLE Physiotherapist ADD CONSTRAINT Physiotherapist_PositionReh
    FOREIGN KEY (IdPositionReh)
    REFERENCES PositionReh (IdPositionReh);

-- Reference: Doctor_Person (table: Doctor)
ALTER TABLE Doctor ADD CONSTRAINT Doctor_Person
    FOREIGN KEY (IdDoctor)
    REFERENCES Person (IdPerson);

-- Reference: Doctor_PositionDoc (table: Doctor)
ALTER TABLE Doctor ADD CONSTRAINT Doctor_PositionDoc
    FOREIGN KEY (IdPositionDoc)
    REFERENCES PositionDoc (IdPositionDoc);

-- Reference: Patient_Person (table: Patient)
ALTER TABLE Patient ADD CONSTRAINT Patient_Person
    FOREIGN KEY (IdPatient)
    REFERENCES Person (IdPerson);

-- Reference: VisitMedInjury_Injury (table: VisitMedInjury)
ALTER TABLE VisitMedInjury ADD CONSTRAINT VisitMedInjury_Injury
    FOREIGN KEY (IdInjury)
    REFERENCES Injury (IdInjury);

-- Reference: VisitMedInjury_WizytaLek (table: VisitMedInjury)
ALTER TABLE VisitMedInjury ADD CONSTRAINT VisitMedInjury_WizytaLek
    FOREIGN KEY (IdVisitMed)
    REFERENCES VisitMed (IdVisitMed);

-- Reference: WizytaLek_Doctor (table: VisitMed)
ALTER TABLE VisitMed ADD CONSTRAINT WizytaLek_Doctor
    FOREIGN KEY (IdDoctor)
    REFERENCES Doctor (IdDoctor);

-- Reference: VisitMed_Patient (table: VisitMed)
ALTER TABLE VisitMed ADD CONSTRAINT VisitMed_Patient
    FOREIGN KEY (IdPatient)
    REFERENCES Patient (IdPatient);

-- Reference: VisitMed_Room (table: VisitMed)
ALTER TABLE VisitMed ADD CONSTRAINT VisitMed_Room
    FOREIGN KEY (IdRoom)
    REFERENCES Room (IdRoom);

-- Reference: VisitRehInjury_Injury (table: VisitRehInjury)
ALTER TABLE VisitRehInjury ADD CONSTRAINT VisitRehInjury_Injury
    FOREIGN KEY (IdInjury)
    REFERENCES Injury (IdInjury);

-- Reference: VisitRehInjury_WizytaReh (table: VisitRehInjury)
ALTER TABLE VisitRehInjury ADD CONSTRAINT VisitRehInjury_WizytaReh
    FOREIGN KEY (IdVisitReh)
    REFERENCES RehabVisit (IdVisitReh);

-- Reference: WizytaReh_Physiotherapist (table: RehabVisit)
ALTER TABLE RehabVisit ADD CONSTRAINT WizytaReh_Physiotherapist
    FOREIGN KEY (IdPhysiotherapist)
    REFERENCES Physiotherapist (IdPhysiotherapist);

-- Reference: RehabVisit_Patient (table: RehabVisit)
ALTER TABLE RehabVisit ADD CONSTRAINT RehabVisit_Patient
    FOREIGN KEY (IdPatient)
    REFERENCES Patient (IdPatient);

-- Reference: RehabVisit_Room (table: RehabVisit)
ALTER TABLE RehabVisit ADD CONSTRAINT RehabVisit_Room
    FOREIGN KEY (IdRoom)
    REFERENCES Room (IdRoom);

-- End of file.

-- Insertation

INSERT INTO Person (IdPerson, FirstName, LastName, DateOfBirth, PESEL, Gender, Address, PhoneNumber) VALUES (1, 'Robert', 'Kowalik', '1990-08-07', 90070824454, 'M', 'Mickiewicza 90 Warszawa', 48667235445);
INSERT INTO Person (IdPerson, FirstName, LastName, DateOfBirth, PESEL, Gender, Address, PhoneNumber) VALUES (2, 'Grazyna', 'Guzik', '1992-01-04', 92040132234, 'K', 'Sienkiewicza 10 Lodz', 48557623433);
INSERT INTO Person (IdPerson, FirstName, LastName, DateOfBirth, PESEL, Gender, Address, PhoneNumber) VALUES (3, 'Fabian', 'Fabianski', '1987-05-12', 87120578834, 'M', 'Kaliskiego 7 Warszawa', 48669777834);
INSERT INTO Person (IdPerson, FirstName, LastName, DateOfBirth, PESEL, Gender, Address, PhoneNumber) VALUES (4, 'Tomasz', 'Kowalski', '1996-05-02', 96020523345, 'M', 'Reymonta 56 Warszawa', 46898933456);
INSERT INTO Person (IdPerson, FirstName, LastName, DateOfBirth, PESEL, Gender, Address, PhoneNumber) VALUES (5, 'Radoslaw', 'Nowicki', '1992-02-03', 92030223333, 'M', 'Bielska 9 Warszawa', 48849583848);
INSERT INTO Person (IdPerson, FirstName, LastName, DateOfBirth, PESEL, Gender, Address, PhoneNumber) VALUES (6, 'Tola', 'Jackowska', '1998-05-04', 98040521156, 'K', 'Kolorowa 12 Lodz', 48668308934);
INSERT INTO Person (IdPerson, FirstName, LastName, DateOfBirth, PESEL, Gender, Address, PhoneNumber) VALUES (7, 'Filip', 'Rupniewicz', '1986-02-11', 86110212234, 'M', 'Michalowska 54 Lodz', 48789478564);
INSERT INTO Person (IdPerson, FirstName, LastName, DateOfBirth, PESEL, Gender, Address, PhoneNumber) VALUES (8, 'Anna', 'Kowalik', '1994-11-12', 94121156743, 'K', 'Zjednoczenia 57 Warszawa', 48168409327);
INSERT INTO Person (IdPerson, FirstName, LastName, DateOfBirth, PESEL, Gender, Address, PhoneNumber) VALUES (9, 'Piotr', 'Pawlak', '1984-11-02', 84021156723, 'M', 'Mickiewicza 57 Warszawa', 48165509327);

INSERT INTO Injury (IdInjury, DescInjury) VALUES (1, 'Zlamanie kosci piszczelowej');
INSERT INTO Injury (IdInjury, DescInjury) VALUES (2, 'Zapalenie rozciegna podeszkowego');
INSERT INTO Injury (IdInjury, DescInjury) VALUES (3, 'Zapalenie sciegna Achillesa');
INSERT INTO Injury (IdInjury, DescInjury) VALUES (4, 'Uszkodzenie zginaczy kolana');
INSERT INTO Injury (IdInjury, DescInjury) VALUES (5, 'Uszkodzenie wiezadel');
INSERT INTO Injury (IdInjury, DescInjury) VALUES (6, 'Skrecenie kostki');

INSERT INTO Patient (IdPatient) VALUES (1);
INSERT INTO Patient (IdPatient) VALUES (3);
INSERT INTO Patient (IdPatient) VALUES (5);
INSERT INTO Patient (IdPatient) VALUES (7);

INSERT INTO PositionDoc (IdPositionDoc, PositionName) VALUES (1, 'Doctor Chirurg');
INSERT INTO PositionDoc (IdPositionDoc, PositionName) VALUES (2, 'Doctor Rehabilitacji Medycznej');
INSERT INTO PositionDoc (IdPositionDoc, PositionName) VALUES (3, 'Doctor Ortopeda');

INSERT INTO PositionReh (IdPositionReh, PositionName) VALUES (1, 'Physiotherapist');
INSERT INTO PositionReh (IdPositionReh, PositionName) VALUES (2, 'Asystent fizjoterapeuty');

INSERT INTO Doctor (IdDoctor, IdPositionDoc) VALUES (2, 1);
INSERT INTO Doctor (IdDoctor, IdPositionDoc) VALUES (4, 2);
INSERT INTO Doctor (IdDoctor, IdPositionDoc) VALUES (9, 2);

INSERT INTO Physiotherapist (IdPhysiotherapist, IdPositionReh) VALUES (6, 1);
INSERT INTO Physiotherapist (IdPhysiotherapist, IdPositionReh) VALUES (8, 2);

INSERT INTO Room (IdRoom, RoomName) VALUES (1, 'Gabinet nr 1');
INSERT INTO Room (IdRoom, RoomName) VALUES (2, 'Gabinet nr 2');
INSERT INTO Room (IdRoom, RoomName) VALUES (3, 'Gabinet nr 3');
INSERT INTO Room (IdRoom, RoomName) VALUES (4, 'Gabinet nr 4');
INSERT INTO Room (IdRoom, RoomName) VALUES (5, 'Gabinet nr 5');
INSERT INTO Room (IdRoom, RoomName) VALUES (6, 'Gabinet nr 6');
INSERT INTO Room (IdRoom, RoomName) VALUES (7, 'Rehabilitacyjna 1');
INSERT INTO Room (IdRoom, RoomName) VALUES (8, 'Rehabilitacyjna 2');

INSERT INTO VisitMed (IdVisitMed, DateVisitMed, IdDoctor, IdPatient, IdRoom) VALUES (1, '2018-01-02 11:00:00', 2, 1, 6);
INSERT INTO VisitMed (IdVisitMed, DateVisitMed, IdDoctor, IdPatient, IdRoom) VALUES (2, '2018-01-02 10:00:00', 2, 3, 5);
INSERT INTO VisitMed (IdVisitMed, DateVisitMed, IdDoctor, IdPatient, IdRoom) VALUES (3, '2018-01-03 11:15:00', 4, 5, 3);
INSERT INTO VisitMed (IdVisitMed, DateVisitMed, IdDoctor, IdPatient, IdRoom) VALUES (4, '2018-01-04 09:45:00', 4, 5, 1);
INSERT INTO VisitMed (IdVisitMed, DateVisitMed, IdDoctor, IdPatient, IdRoom) VALUES (5, '2018-01-04 10:30:00', 2, 7, 2);
INSERT INTO VisitMed (IdVisitMed, DateVisitMed, IdDoctor, IdPatient, IdRoom) VALUES (6, '2018-01-05 11:30:00', 2, 5, 6);

INSERT INTO RehabVisit (IdVisitReh, DateVisitReh, IdPhysiotherapist, IdPatient, IdRoom) VALUES (1, '2018-01-04 10:00:00', 6, 1, 8);
INSERT INTO RehabVisit (IdVisitReh, DateVisitReh, IdPhysiotherapist, IdPatient, IdRoom) VALUES (2, '2018-01-04 11:30:00', 8, 3, 8);
INSERT INTO RehabVisit (IdVisitReh, DateVisitReh, IdPhysiotherapist, IdPatient, IdRoom) VALUES (3, '2018-01-06 11:00:00', 8, 1, 8);
INSERT INTO RehabVisit (IdVisitReh, DateVisitReh, IdPhysiotherapist, IdPatient, IdRoom) VALUES (4, '2018-01-07 09:30:00', 6, 5, 7);
INSERT INTO RehabVisit (IdVisitReh, DateVisitReh, IdPhysiotherapist, IdPatient, IdRoom) VALUES (5, '2018-01-09 09:00:00', 8, 3, 8);
INSERT INTO RehabVisit (IdVisitReh, DateVisitReh, IdPhysiotherapist, IdPatient, IdRoom) VALUES (6, '2018-01-09 11:00:00', 6, 7, 7);
INSERT INTO RehabVisit (IdVisitReh, DateVisitReh, IdPhysiotherapist, IdPatient, IdRoom) VALUES (7, '2018-01-10 10:30:00', 6, 5, 7);
INSERT INTO RehabVisit (IdVisitReh, DateVisitReh, IdPhysiotherapist, IdPatient, IdRoom) VALUES (8, '2018-01-11 11:00:00', 8, 3, 7);
INSERT INTO RehabVisit (IdVisitReh, DateVisitReh, IdPhysiotherapist, IdPatient, IdRoom) VALUES (9, '2018-01-13 11:30:00', 8, 3, 8);

INSERT INTO VisitMedInjury (IdVisitMed, IdInjury, DateInjury) VALUES (1, 4, '2018-01-01');
INSERT INTO VisitMedInjury (IdVisitMed, IdInjury, DateInjury) VALUES (2, 6, '2018-01-02');
INSERT INTO VisitMedInjury (IdVisitMed, IdInjury, DateInjury) VALUES (3, 2, '2018-01-03');
INSERT INTO VisitMedInjury (IdVisitMed, IdInjury, DateInjury) VALUES (4, 3, '2018-01-03');
INSERT INTO VisitMedInjury (IdVisitMed, IdInjury, DateInjury) VALUES (5, 1, '2018-01-04');

INSERT INTO VisitRehInjury (IdInjury, IdVisitReh) VALUES (4, 1);
INSERT INTO VisitRehInjury (IdInjury, IdVisitReh) VALUES (6, 2);
INSERT INTO VisitRehInjury (IdInjury, IdVisitReh) VALUES (4, 3);
INSERT INTO VisitRehInjury (IdInjury, IdVisitReh) VALUES (2, 4);
INSERT INTO VisitRehInjury (IdInjury, IdVisitReh) VALUES (6, 5);
INSERT INTO VisitRehInjury (IdInjury, IdVisitReh) VALUES (3, 6);
INSERT INTO VisitRehInjury (IdInjury, IdVisitReh) VALUES (1, 7);

-- Sample Queries

-- Provide a number of rehabilitation visits in the room called 'Rehabilitacja 1'
SELECT COUNT(RehabVisit.IdRoom)
FROM RehabVisit
JOIN Room ON RehabVisit.IdRoom = Room.IdRoom
WHERE RoomName = 'Rehabilitacyjna 1';

-- How many times the medical visit related to injury 'Uszkodzenie zginaczy kolana'
SELECT COUNT(VisitMedInjury.IdInjury)
FROM VisitMedInjury
JOIN Injury ON VisitMedInjury.IdInjury = Injury.IdInjury
WHERE DescInjury = 'Uszkodzenie zginaczy kolana';

-- Enter the number of rehabilitation visits of patients living in Warszawa according to the dates of visits from the oldest.
SELECT COUNT(IdVisitReh), DateVisitReh
FROM RehabVisit
JOIN Patient ON RehabVisit.IdPatient = Patient.IdPatient
JOIN Person ON Patient.IdPatient = Person.IdPerson
WHERE Address LIKE '%Warszawa%'
GROUP BY DateVisitReh;

-- Provide a number of medical visits, last names and first names of patients who have had more than one medical visit.
SELECT count(IdVisitMed), LastName, FirstName
FROM VisitMed
JOIN Patient ON VisitMed.IdPatient = Patient.IdPatient
JOIN Person ON Patient.IdPatient = Person.IdPerson
GROUP BY LastName, FirstName
HAVING count(IdVisitMed) > 1;

-- Provide the last names and first names of physiotherapists who have had one or more visits during the given period and print the number of visits.
SELECT count(IdVisitReh), LastName, FirstName
FROM RehabVisit
JOIN Physiotherapist ON RehabVisit.IdPhysiotherapist = Physiotherapist.IdPhysiotherapist
JOIN Person ON Physiotherapist.IdPhysiotherapist = Person.IdPerson
WHERE DateVisitReh >= '2018-01-07 00:00:00' AND DateVisitReh <= '2018-01-15 00:00:00'
GROUP BY LastName, FirstName
HAVING count(IdVisitReh) >= 1;

-- Find doctors employed in the same position as doctor with IdDoctor = 4.
SELECT *
FROM Doctor
WHERE IdPositionDoc = (SELECT IdPositionDoc FROM Doctor WHERE IdDoctor = 4);

-- Find details of medical visits that took place in the same room as the visit with IdVisitMed = 1.
SELECT *
FROM VisitMed
WHERE IdRoom = (SELECT IdRoom FROM VisitMed WHERE IdVisitMed = 1);

-- Find patient's IdPatient, whose number of rehabilitation visits exceeds the number of visits of patient with IdPatient = 1.
SELECT IdPatient
FROM RehabVisit
GROUP BY IdPatient
HAVING count(IdPatient) > (SELECT count(IdPatient) FROM RehabVisit WHERE IdPatient = 1);

-- Find an IdRoom of rooms in which there were less or the same number of rehabilitation visits than in the Room with IdRoom = 8.
SELECT IdRoom
FROM RehabVisit
GROUP BY IdRoom
HAVING count(IdRoom) <= (SELECT count(IdRoom) FROM RehabVisit WHERE IdRoom = 8);

-- Provide details of all people who are not patients.
SELECT *
FROM Person
WHERE not exists (SELECT * FROM Patient WHERE Patient.IdPatient=Person.IdPerson);

-- Provide medical visits to patients who also had a rehabilitation visit.
SELECT *
FROM VisitMed
WHERE IdPatient IN (SELECT IdPatient FROM RehabVisit WHERE RehabVisit.IdPatient = VisitMed.IdPatient);

-- Provide an IdPatient of patient who has had more rehabilitation visits than medical visits.
SELECT IdPatient
FROM RehabVisit
GROUP BY IdPatient
HAVING count(IdPatient) > (SELECT count(IdPatient) FROM VisitMed WHERE VisitMed.IdPatient = RehabVisit.IdPatient);
