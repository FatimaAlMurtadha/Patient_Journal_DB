-- Skapa en ny database som heter PatientJournalDB
CREATE DATABASE PatientJournalDB;
-- Köra eller använda nyläggd database som heter PatientJournalDB 
-- Det här steget är viktigt och nödvändig för att all kommande kommandon 
-- kommer att köras, execveras och läggas här.

USE PatientJournalDB;

-- Skapa Vårdcentraler tabell 
CREATE TABLE HealthCareCenters (
    HealthCareCenterID INT PRIMARY KEY AUTO_INCREMENT,
    HealthCareCenterName VARCHAR(50) NOT NULL,
    Location VARCHAR(50) NOT NULL
);

-- Skapa Patienter tabell "Här kopplas patienten till en viss vårdcentral"
CREATE TABLE Patients (
    PatientID INT PRIMARY KEY AUTO_INCREMENT,
    PersonalNumber VARCHAR(13) NOT NULL UNIQUE,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    PhoneNumber VARCHAR(14) NOT NULL,
    Email VARCHAR(70) NOT NULL,
    BirthDate DATE NOT NULL,
    IsActive BOOLEAN DEFAULT TRUE,
    HealthCareCenterID INT NOT NULL,
    CONSTRAINT FKPatientsHealthCareCenter FOREIGN KEY (HealthCareCenterID)
       REFERENCES HealthCareCenters(HealthCareCenterID)
);

-- Skapa Personnels Behörigheter tabell
CREATE TABLE Roles (
    RoleID INT PRIMARY KEY AUTO_INCREMENT, 
    RoleName varchar(50) NOT NULL,
    CanAccessJournal BOOLEAN DEFAULT FALSE 
);

-- Skappa personnel Tabell "Här sättas en viss roll eller behörighet för varje personnel som skapas
-- Och kopplas den här personneln till en viss vårdcentral"
CREATE TABLE Staff (
    StaffID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE,
    IsActive BOOLEAN DEFAULT TRUE,
    RoleID INT NOT NULL,
    HealthCareCenterID INT NOT NULL,
    CONSTRAINT FKStaffRole FOREIGN KEY (RoleID)
        REFERENCES Roles(RoleID),
    CONSTRAINT FKStaffHealthCareCenter FOREIGN KEY (HealthCareCenterID)
        REFERENCES HealthCareCenters(HealthCareCenterID)
);


-- Skapa Bookningar tabell "Här kopplas patienten med en viss bookning ihop
-- Och sättas vilken vårdcentral då patienten ska på. Det är p.g.a att patienten kan 
-- vara registereras till en viss vårdcentral men kan få bookning på en annan vårdcentral."
CREATE TABLE Bookings (
    BookingID INT PRIMARY KEY AUTO_INCREMENT,
    BookingDate DATETIME NOT NULL,
    PatientID INT NOT NULL,
    Purpose VARCHAR(200) NOT NULL,
    HealthCareCenterID INT NOT NULL,
    CONSTRAINT FKBookingsPatient FOREIGN KEY (PatientID)
        REFERENCES Patients(PatientID),
    CONSTRAINT FKBookingsHealthCareCenter FOREIGN KEY (HealthCareCenterID)
        REFERENCES HealthCareCenters(HealthCareCenterID)
);

-- Skapa Journaler tabell "Här läggas huvudkoppling mellan patienten, personneln och bookningen"
CREATE TABLE Journals (
    JournalID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT NOT NULL,
    StaffID INT NOT NULL,
    BookingID INT, -- inget behöv till NOT NULL då kan personneln lägga till Note utan en Bokkning
    CONSTRAINT FKJournalsPatient FOREIGN KEY (PatientID)
        REFERENCES Patients(PatientID),
    CONSTRAINT FKJournalsStaff FOREIGN KEY (StaffID)
        REFERENCES Staff(StaffID),
    CONSTRAINT FKJournalsBooking FOREIGN KEY (BookingID)
        REFERENCES Bookings(BookingID)
);

-- Skapa Journals detaljer tabell
CREATE TABLE JournalDetails (
    JournalDetailID INT PRIMARY KEY AUTO_INCREMENT,
    NoteTitle VARCHAR(70) NOT NULL,
    NoteDate DATETIME NOT NULL,
    Note TEXT NOT NULL,
    NextProcedure VARCHAR(150),
    WriterID INT NOT NULL,
    JournalID INT NOT NULL,
    CONSTRAINT FKJournalDetailsWriter FOREIGN KEY (WriterID)
        REFERENCES Staff(StaffID),
    CONSTRAINT FKJournalDetailsJournal FOREIGN KEY (JournalID)
        REFERENCES Journals(JournalID)
);

-- Skapa Personnels bookningar "Här kopplas en personnel med vissa bookningar"
CREATE TABLE BookingStaff (
    BookingID INT NOT NULL,
    StaffID INT NOT NULL,
    Role VARCHAR(50) NOT NULL,
    PRIMARY KEY (BookingID, StaffID),
    CONSTRAINT FKBookingStaffBooking FOREIGN KEY (BookingID)
        REFERENCES Bookings(BookingID),
    CONSTRAINT FKBookingStaffStaff FOREIGN KEY (StaffID)
        REFERENCES Staff(StaffID)
);


-- UTVäcklingar

----- 1: Lägg till CONSTRAIN för att Rolen ska aldrig vara tom eller null i tabellen "Roles"
ALTER TABLE Roles 
ADD CONSTRAINT CHK_RoleName_NotEmpty 
CHECK (RoleName <> '');

----- 2: Lägg till CONSTRAIN för att Date ska aldrig vara i framtiden i tabellen "JournalDetails"

ALTER TABLE JournalDetails 
ADD CONSTRAINT CHK_NoteDate_Valid 
CHECK (NoteDate <= CURRENT_DATE);

----- 3: Lägg till CONSTRAIN för att patienten är äntingen Active eller InActive alltså True eller False  i tabellen "Patients"

ALTER TABLE Patients 
ADD CONSTRAINT CHK_Patient_IsActive
CHECK (IsActive IN (0,1));

----- 3: Lägg till CONSTRAIN för att personnel är äntingen Active eller InActive alltså True eller False  i tabellen "Staff"

ALTER TABLE Staff
ADD CONSTRAINT CHK_Staff_IsActive
CHECK (IsActive IN (0,1));


----- 1: CHECK längden av personnummer i Tabellen Patients

ALTER TABLE Patients
ADD CONSTRAINT CHK_Patient_PersonalNumber_Length
CHECK (CHAR_LENGTH(PersonalNumber) = 12);


----- 2: Lägg till Booknings tid "BookingTime" i tabellen Bookings

ALTER TABLE Bookings
ADD BookingTime TIME NOT NULL;


----- 4: Lägg till Note tid "NoteTime" i tabellen JournalDetails

ALTER TABLE JournalDetails
ADD NoteTime TIME NOT NULL DEFAULT CURRENT_TIME;


