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
("Fatima","Al-Murtadha","fatima12@gmail.com",True,4 , 1), -- 1
("Mathias","Jarlsson","mathias@gmail.com",True,8 , 2),-- 2
("Mohammed","Ali","mohammed@gmail.com",True, 1 ,2 ),-- 3
("Minshao","Kai","minsha@gmail.com",True, 1, 1),-- 4
("Milton","Frozen","milton@gmail.com",True, 2,2 ),-- 5
("Laith","Saleh","laith@gmail.com",True, 2, 1),-- 6
("Sumaya","","sumaya@gmail.com",True, 3,1 ),-- 7
("Jana","Sami","@gmail.com",True, 5, ),-- 8
("Escada","Niabo","escada@gmail.com",True, 6, ),-- 9
("Lukas","Björnberg","lukas@gmail.com",True, 7, ),-- 10
("Safa","Said","safa@gmail.com",True, 8,5 ),-- 11
("Thalia","Metso","thalia@gmail.com",True, 1, 3) -- 12

;



INSERT INTO Bookings ( BookingDate, PatientID, Purpose, HealthCenterID )
VALUES
(DATE , 1,"Diaria",1 ), -- 1
(DATE ,2 ,"Andnings problem",2 ),-- 2
 (DATE , 3,"Andnings problem", 1), -- 3
(DATE , ,"Ont i mage", ),-- 4
 (DATE , ,"Huvudvärk", ),-- 5
  (DATE , ,"Graviditet", ), -- 6
(DATE , ,"Prov Tagning", ), -- 7
(DATE , ,"Förnya recept", ),-- 8
 (DATE , ,"Hälsokontroll", ), -- 9
(DATE , ,"Undersökning", ), -- 10
(DATE , ,"Feber", ),-- 11
 (DATE , ,"Hosta", )-- 12

;

INSERT INTO Journals ( PatientID, StaffID, BookingID)
VALUES
( , , ),-- 1
( , ,  ),-- 2
( , ,  ),-- 3
(  , , ),-- 4
( , ,  ),-- 5
( , ,  ),-- 6
(  , , ),-- 7
( , ,  ),-- 8
( , ,  ),-- 9
( , ,  ),-- 10
( , ,  ),-- 11
( , ,  )-- 12
;

INSERT INTO JournalDetails (JournalDetailID, NoteTitle, NoteDate, Note, NextProcedure, WriterID, JournalID)
VALUES
( ,"", DATE, "", "", ),-- 1
( ,"", DATE, "", "", ),-- 2
( ,"", DATE, "", "", ),-- 3
( ,"", DATE, "", "", ),-- 4
( ,"", DATE, "", "", ),-- 5
( ,"", DATE, "", "", ),-- 6
( ,"", DATE, "", "", ),-- 7
( ,"", DATE, "", "", ),-- 8
( ,"", DATE, "", "", ),-- 9
( ,"", DATE, "", "", ),-- 10
( ,"", DATE, "", "", ),-- 11
( ,"", DATE, "", "", )-- 12
;

INSERT INTO BookingStaff (BookingID, StaffID, Role)
VALUES
( , , ""),-- 1
( , , ""),-- 2
( , , ""),-- 3
( , , ""),-- 4
( , , ""),-- 5
( , , ""),-- 6
( , , ""),-- 7
( , , ""),-- 8
( , , ""),-- 9
( , , ""),-- 10
( , , ""),-- 11
( , , "")-- 12
;
