INSERT INTO HealthCenters (HealthCenterName, Location)
    VALUES
    ("EllenBogen","Malmö"), -- 1
    ("Blomman","Malmö"), -- 2
    ("Södervan","Malmö"),-- 3
    ("Universitet","Lund"),-- 4
    ("Gatan","Lund"),-- 5
    ("Päron","Landskrona"),-- 6
    ("Äpple","Landskrona"), -- 7
    ("Banan","Helsinborg"),-- 8
    ("Plomman","Helsinborg"),-- 9
    ("Vänner","Göteborg"),-- 10
    ("Family","Karlstad"),-- 11
    ("Siskon","Helsinborg")-- 12
    ;

INSERT INTO Patients (PersonalNumber, FirstName, LastName, PhoneNumber, 
Email, BirthDate, IsActive BOOLEAN DEFAULT TRUE, HealthCenterID)
VALUES 
("199356789542","Fatoom","Hussein","077777777","fatoom@gmail.com",1993 , TRUE,1),-- 1
("198454321764","Ahmed","Abdulmalek","073333333","ahmed@gmail.com",1984 ,FALSE,2),-- 2
("201449524252","Sukaina","Ahmed","075555555","sukaina@gmail.com",2014, FALSE ,1),-- 3
("199652395686","Sara","Karlsson","079999999","sara@gmail.com",1996 ,3),-- 4
("200047345271","Sara","Johansson","070707078","sara23@gmail.com",2000 ,4),-- 5
("200178567492","Anna","Zucchini","076688668","anna@gmail.com",2001, TRUE,5),-- 6
("202510103456","Santiago","Velasquez","076453623","santiago@gmail.com",2025,TRUE ,6),-- 7
("199706236754","Natalia","Velasquez","078964328","natalia@gmail.com",1997, TRUE,6),-- 8
("198311294381","Josephine","Fischhaber","0784623536","josephine@gmail.com",1983,TRUE ,7),-- 9
("188812223879","Danial","Andersson","074863529","danial@gmail.com",1888, TRUE,8),-- 10
("198206307643","Eloise","Metso","076666687","eloise@gmail.com",1982,TRUE ,8),-- 11
("202203258726","Oskar","Longman","078473654","oskar@gmail.com",2022,TRUE ,9)-- 12
;

INSERT INTO Roles (RoleName, CanAccessJournal BOOLEAN DEFAULT FALSE )
VALUES
("Nurse",TRUE ), -- 1
("Doctor",TRUE ), -- 2
("Pharmacist", FALSE), -- 3
("Surgeon", TRUE ), -- 4
("Dentist", FALSE), -- 5
("Medical Technologist", FALSE), -- 6
("Physiotherapist", FALSE), -- 7
("Neurologist",TRUE ) -- 8
;

INSERT INTO Staff (FirstName, LastName, Email, RoleID , HealthCenterID)
VALUES
("Fatima","Al-Murtadha","fatima12@gmail.com",4 , 1), -- 1 Ellenbogen Malmö
("Mathias","Jarlsson","mathias@gmail.com",8 , 2),-- 2 Blomman Malmö
("Mohammed","Ali","mohammed@gmail.com", 1 ,3 ),-- 3 Södervän Malmö
("Minshao","Kai","minsha@gmail.com", 1, 4),-- 4 univer Lund
("Milton","Frozen","milton@gmail.com", 2,5),-- 5  Gata Lund
("Laith","Saleh","laith@gmail.com", 2, 6),-- 6 Päron Lundskrona
("Sumaya","","sumaya@gmail.com", 3,5),-- 7 Gata Lund
("Jana","Sami","@gmail.com", 5, 8),-- 8 Banan Hels..
("Escada","Niabo","escada@gmail.com", 6, 9),-- 9 Plomman Helsinborg
("Lukas","Björnberg","lukas@gmail.com", 7, 10),-- 10 Vänner Göteborg
("Safa","Said","safa@gmail.com", 8,11 ),-- 11 Family Karlstad
("Thalia","Metso","thalia@gmail.com", 1, 12) -- 12 Siskon Hilsinborg

;

INSERT INTO Bookings ( BookingDate, PatientID, Purpose, HealthCenterID )
VALUES
(2025-11-18 09:00:00 , 1,"Diaria",1 ), -- 1 -- Ellenbogen Malmö
(2025-12-12 10:00:00,2 ,"Andnings problem",2 ),-- 2 Blooman Malmö
(2025-12-12 10:12:00, 3,"Andnings problem", 1), -- 3  Ellenbogen Malmö
(2025-12-13 13:00:00, 4,"Ont i mage", 3),-- 4  Södervän Malmö
(2025-12-20 11:30:00, 5,"Huvudvärk", 5),-- 5 Gata Lund
(2025-12-11 08:30:00, 6,"Graviditet", 6), -- 6 Päron Landskrona
(2025-12-17 08:00:00, 7,"Prov Tagning", 7), -- 7 Äpple Landskrona
(2025-12-10 09:30:00, 8,"Förnya recept", 8),-- 8 Banan Helsinborg
(2025-12-22 10:30:00, 9,"Hälsokontroll", 9), -- 9 Plomman Helsinborg
(2025-12-09 13:00:00,10 ,"Undersökning", 10), -- 10 Vänner Göteborg
(2025-12-03 13:30:00, 11,"Feber",11 ),-- 11 family Karlstad
(2025-11-18 13:00:00, 1,"Hosta", 12)-- 12 -- 

;
INSERT INTO Journals ( PatientID, StaffID, BookingID)
VALUES
( 1, 1,1 ),-- 1 ---- fatoom, fatima, Diaria Ellenbogen
( 2,1 , 2 ),-- 2 ---- Ahmed, Fatima, Andnings problem Ellenbogen
( 3, 3,  3),-- 3 ---- Sukaina, Mohammed,Andnings problem Ellenbogen
(  4,1 ,4),-- 4 ---- Sara Karlsoon, fatima, Ont i mage
( 5, 2,  5),-- 5 ---- Sara Johansson, Mathias, Huvudvärk
( 6,2 ,6),-- 6 ---- Anna Z, Mathias, Graviditet
(  7,3 ,7 ),-- 7---- Santiago, Mohammed, Prov Tagning
(8, 2,  8),-- 8---- Natalia, Mathias,Förnya recept
( 9,3 ,  9),-- 9 ---- Josephine, Mohammed, Hälsokontroll
( 10, 3, 10 ),-- 10 ---- Danial, Mohammed, Undersökning
( 11, 4, 11 ),-- 11 ---- Eloise, Minshaw, Feber
( 1, 7, 12 )-- 12 ---- Fatoom, Sumaya, Hosta 
;

INSERT INTO JournalDetails (NoteTitle, NoteDate, Note, NextProcedure, WriterID, JournalID)
VALUES
("", 2025-11-18 09:12:00, "", "", 1, 1),
("", 2025-12-12 10:20:00, "", "", 1, 2),
("", 2025-12-12 10:30:00, "", "", 3, 3),
("", 2025-12-13 13:15:00, "", "", 1, 4),
("", 2025-12-20 11:40:00, "", "", 2, 5),
("", 2025-12-11 09:00:00, "", "", 2, 6),
("", 2025-12-17 08:30:00, "", "", 3, 7),
("",2025-12-10 09:55:00, "", "", 2, 8),
("",2025-12-22 10:50:00, "", "", 3, 9),
("", 2025-12-09 13:20:00, "", "", 3,10),
("", 2025-12-03 13:52:00, "", "", 4,11),
("",2025-11-18 13:32:00, "", "", 7,12);


INSERT INTO BookingStaff (BookingID, StaffID, Role)
VALUES
(1,  1, "Nurse"),
(2,  1, "Surgeon"),
(3,  3, "Surgeon"),
(4,  1, "Surgeon"),
(5,  2, "Neurologist"),
(6,  2, "Neurologist"),
(7,  3, "Nurse"),
(8,  2, "Neurologist"),
(9,  3, "Nurse"),
(10, 3, "Nurse"),
(11, 4, "Nurse"),
(12, 7, "Pharmacist");

