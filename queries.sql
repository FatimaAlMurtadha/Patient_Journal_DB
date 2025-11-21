-- 1/ vissa all vårdcentraler  i Malmö

SELECT * FROM HealthCareCenters
WHERE Location LIKE "%ö"
;

-- 2/ Vissa alla Patienter (FirstName, LastName) och vilken vårdcentral de är registererat på: 

SELECT CONCAT(p.FirstName ,' ',p.LastName) AS PatientName, CONCAT(h.HealthCareCenterName, ' ', h.Location) AS
HealthCareCenter
FROM Patients AS p
INNER JOIN HealthCareCenters AS h ON p.HealthCareCenterID = h.HealthCareCenterID
;

-- 3/ Vissa hur många Patienter finns på alla vårdcentraler även om de inte har någon patient: 

SELECT CONCAT(h.HealthCareCenterName, ' ', h.Location) AS HealthCareCenter, COUNT(p.PatientID) AS 
TotalPatients
FROM HealthCareCenters AS h
LEFT JOIN Patients AS p ON h.HealthCareCenterID = p.HealthCareCenterID
GROUP BY HealthCareCenter
;

-- 4/ Vissa alla Bookningar med Patients namn och vårdcentral och sorterra resultat på BookingID ASC
SELECT CONCAT(p.FirstName," ", p.LastName) AS PatientName,CONCAT(h.HealthCareCenterName, ' ', h.Location) AS 
HealthCareCenter, b.BookingID, b.BookingDate, b.Purpose
FROM Bookings AS b
INNER JOIN Patients AS p ON b.PatientID = p.PatientID
INNER JOIN HealthCareCenters AS h ON b.HealthCareCenterID = h.HealthCareCenterID
ORDER BY b.BookingID ASC
;

-- 5/ Vissa alla Bookningar med Patients namn och purpuse av läkaren Fatima Al-Murtadha och sorterra resultat på BookingID ASC
SELECT s.FirstName,CONCAT(p.FirstName," ", p.LastName) AS PatientName, b.BookingID, b.BookingDate, b.Purpose
FROM Bookings AS b
INNER JOIN Patients AS p ON b.PatientID = p.PatientID
INNER JOIN Staff AS s ON s.HealthCareCenterID = b.HealthCareCenterID
WHERE s.StaffID = 1
ORDER BY b.BookingID ASC
;


-- 6/ Vissa Journals detaljer med personneln som har skrivit den och när -börja på den aktueln-
SELECT CONCAT(p.FirstName, " ", p.LastName) AS PatientName ,jd.NoteTitle, jd.Note , jd.NoteDate,
CONCAT(s.FirstName, " ",s.LastName) AS WriterName
FROM JournalDetails AS jd 
INNER JOIN Journals AS j ON jd.JournalID = j.JournalID
INNER JOIN Staff AS s ON jd.WriterID = s.StaffID
INNER JOIN Patients AS p ON j.PatientID = p.PatientID
ORDER BY jd.NoteDate DESC
;

-- 7/ Vissa Hur många Journals har en personnel skrivit upp 
SELECT CONCAT(s.FirstName, " ",s.LastName) AS WriterName, COUNT(jd.JournalDetailID) AS WrittenNote
FROM Staff AS s 
LEFT JOIN JournalDetails AS jd ON s.StaffID = jd.WriterID
GROUP BY WriterName
HAVING WrittenNote > 0
ORDER BY WrittenNote ASC
;
-- 8/ Vissa Hur många patienter och personnel finns på vårdcentraler 
SELECT h.HealthCareCenterName, (SELECT COUNT(*) FROM Staff AS s 
WHERE S.HealthCareCenterID = h.HealthCareCenterID)
AS TotalStaff, (SELECT COUNT(*)
FROM Patients AS p 
WHERE p.HealthCareCenterID = h.HealthCareCenterID) AS TotalPatients
FROM HealthCareCenters AS h
ORDER BY TotalStaff ASC
;

-- 9/ Vissa alla bookningar som inte har någon journal skrivits. 
SELECT b.BookingDate, CONCAT(p.FirstName, " ",p.LastName ) AS PatientName
FROM Bookings AS b
LEFT JOIN Journals AS j ON b.BookingID = j.BookingID
INNER JOIN Patients AS p ON b.PatientID = p.PatientID
WHERE j.JournalID IS NULL
;

-- 10/ Göra patienten som är född 1982 INACTIVE   
UPDATE Patients 
SET IsActive = FALSE 
WHERE BirthDate = "1982-06-30"
;
SELECT * FROM Patients;


-- 11/ Göra en View som vissar en sammanfattning av patientens journal, patients namn, personnelns namn
-- och den sista uppskrivits anteckning. 
CREATE VIEW vwPatientJournalSummary AS
SELECT j.JournalID, CONCAT(p.FirstName, " ",p.LastName) AS PatientName,
CONCAT(s.FirstName, " ",s.LastName) AS StaffName,
jd.NoteTitle, jd.NoteDate 
FROM Journals AS j
INNER JOIN Patients AS p ON j.PatientID = p.PatientID
INNER JOIN Staff AS s ON j.StaffID = s.StaffID
INNER JOIN JournalDetails AS jd ON jd.JournalID = j.JournalID
;
-- Använda den här viewen
SELECT * FROM
vwPatientJournalSummary;

-- ELLER bara för en viss patient 
SELECT * FROM
vwPatientJournalSummary
WHERE PatientName = "Fatoom Hussein"
;

-- OCH på samma sätt kan man kolla på en viss patient med PatientID eller Personnummer
-- OCH man kan vissa journaler som en viss personnel har skrivit
-- OCH man kan sortera Viewn beroende på NoteDate alltså datumet
-- OCH man kan även använda den med andra Select queries 
