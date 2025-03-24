USE librarydb;

create table MembershipTypeTable (
	MembershipTypeID int not null primary key auto_increment,
	MembershipType enum('visitor', 'member') not null
);

-- RENAME TABLE MembershipType TO MembershipTypeTable;

create table ActivityStatusTable(
	ActivityStatusID int not null primary key auto_increment,
	ActivityStatus enum ('active', 'inactive') not null
);

-- RENAME TABLE ActivityStatus TO ActivityStatusTable;

CREATE TABLE LibraryUsers (
    UserID INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    JoinDate DATE,
    MembershipTypeID INT,
    ActivityStatusID INT,
    FOREIGN KEY (MembershipTypeID) REFERENCES MembershipTypeTable(MembershipTypeID),
    FOREIGN KEY (ActivityStatusID) REFERENCES ActivityStatusTable(ActivityStatusID)
);

CREATE TABLE Address (
    AddressID INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    UserID INT NOT NULL,
    FlatNo VARCHAR(30) NOT NULL,
    Street VARCHAR(100) NOT NULL,
    City VARCHAR(50) NOT NULL,
    PostalCode VARCHAR(20) NOT NULL,
    Country VARCHAR(50) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES LibraryUsers(UserID) ON DELETE CASCADE
);

CREATE TABLE Books (
    BookID INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
    Title VARCHAR(200) NOT NULL,
    AuthorID INT,
    CategoryID INT,
    PublishedYear INT,
    CopiesAvailable INT DEFAULT 1,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID),
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

CREATE TABLE Authors(
	AuthorID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    Firstname VARCHAR(50) NOT NULL,
    Lastname VARCHAR(50) NOT NULL
);

CREATE TABLE Categories(
	CategoryID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    CategoryName VARCHAR(50) NOT NULL
);

CREATE TABLE BorrowingBooks(
	BorrowID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    BookID INT,
    UserID INT,
    BorrowDate DATETIME DEFAULT current_timestamp,
    DueDate DATE AS (BorrowDate + INTERVAL 14 DAY) STORED,
    ReturnDate DATE NULL,
    StatusID INT, 
    foreign key(BookID) references Books(BookID),
    foreign key(UserID) references LibraryUsers(UserId),
    foreign key(StatusID) references BorrowStatus(StatusID)
    );

CREATE TABLE BorrowStatus (
    StatusID INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    StatusDescription VARCHAR(50) NOT NULL
);

CREATE TABLE BorrowingBooks(
	BorrowID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    UserID INT,
    BorrowDate DATETIME DEFAULT current_timestamp,
    DueDate DATE AS (BorrowDate + INTERVAL 14 DAY) STORED,
    ReturnDate DATE NULL,
    StatusID INT, 
    foreign key(BookID) references Books(BookID),
    foreign key(UserID) references LibraryUsers(UserId),
    foreign key(StatusID) references BorrowStatus(StatusID)
    );

CREATE TABLE FinesTable (
   FineId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
   BorrowID INT NOT NULL,
   due_date DATE NOT NULL,
   return_date DATE NOT NULL,
   overdue_days INT GENERATED ALWAYS AS (DATEDIFF(return_date, due_date)),
   late_fee DECIMAL(5,2) GENERATED ALWAYS AS (overdue_days * 0.5),
   FOREIGN KEY (BorrowID) REFERENCES BorrowingBooks(BorrowID) ON DELETE CASCADE
);

-- Modify return_date to allow NULL values
ALTER TABLE FinesTable
MODIFY COLUMN return_date DATE DEFAULT NULL;



