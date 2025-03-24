USE librarydb;

create table MembershipTypeTable (
	MembershipTypeID int not null primary key auto_increment,
	MembershipType enum('visitor', 'member') not null
);

RENAME TABLE MembershipTypeTable TO MembershipType;

create table ActivityStatusTable(
	ActivityStatusID int not null primary key auto_increment,
	ActivityStatus enum ('active', 'inactive') not null
);

RENAME TABLE ActivityStatusTable TO ActivityStatus;

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






