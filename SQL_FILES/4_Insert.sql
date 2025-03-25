USE librarydb;

INSERT INTO MembershipType(MembershipType)
VALUES ('visitor'),
('member');

INSERT INTO ActivityStatus(ActivityStatus)
VALUES ('active'),
('inactive');

Insert into LibraryUsers(FirstName, LastName, Email, Phone, JoinDate, MembershipTypeID, ActivityStatusID )
values('Sheshank', 'Gowda', 'Sheshank@gmail.com', '9876543210', '2024-06-15', 2, 1),
('Lisa', 'Simpson', 'Lisasimp@gmail.com', '123-456-7890', '2010-09-22', 2, 1),
('Alice', 'Johnson', 'alice.johnson@email.com', '9234567890', '2023-06-15', 2, 2),
('Bob', 'Smith', 'bob.smith@email.com', '9876543210', '2022-09-22', 2, 1),
('Charlie', 'Davis', 'charlie.davis@email.com', '555-123-4567', '2024-01-05', 1, 1);

Insert into LibraryUsers(FirstName, LastName, Email, Phone, JoinDate, MembershipTypeID, ActivityStatusID )
values('Chaitra', 'Gowda', 'Chaitra@gmail.com', '9876543212', '2022-08-20', 2, 1);

Insert into LibraryUsers(FirstName, LastName, Email, Phone, JoinDate, MembershipTypeID, ActivityStatusID )
values('Bart', 'Simpson', 'Bartsimps@gmail.com', '9176543212', '2025-08-22', 2, 1);


INSERT INTO Address(UserID, FlatNo, Street, City, PostalCode, Country)
VALUES(1, 40, 'StagsWay', 'Isleworth', 'TW7 5PG', 'UK'),
(2, 78, 'St. John’s Road', 'Isleworth', 'TW7 6NL', 'UK'),
(1, 'H45', 'High Street', 'Hounslow', 'TW3 1ES', 'UK'),
(3, 30, 'Thornbury Road', 'Osterley', 'TW7 4LN', 'UK'),
(3, 100, 'Oxford Street', 'London', 'W1D 1LL', 'UK'),
(4, 23, 'Commerce Road', 'Brentford', 'TW8 8LE', 'UK'),
(5, 'B12', 'Kingsley Road', 'Hounslow', 'TW3 1PA', 'UK');

INSERT INTO Authors(Firstname, Lastname)
VALUES ('F. Scott', 'Fitzgerald'),
('Jane', 'Austen'),
('J.D.', 'Salinger'),
('Herman', 'Melville'),
('J.R.R.', 'Tolkien'),
('J.K', 'Rowling');

INSERT INTO Categories(CategoryName)
VALUES ('Fiction'),
('Classic'),
('Modern'),
('Horror'),
('Fantasy');

INSERT INTO Books(Title, AuthorID, CategoryID, PublishedYear, CopiesAvailable) 
VALUES ('The Great Gatsby', 1, 1, 1925, 3),
('The Hobbit', 5, 2, 1937, 6),
('Pride and Prejudice', 2, 1, 1813, 4),
('Moby-Dick', 4, 2, 1851, 5),
('The Catcher in the Rye', 3, 3, 1951, 2),
('Harry Potter and the Philosopher Stone', 6, 1, 1997, 10);

INSERT INTO BorrowStatus (StatusDescription)
VALUES ('Borrowed'),
('Returned'),
('Overdue');

INSERT INTO BorrowingBooks(BookID, UserID, BorrowDate, ReturnDate, StatusID)
VALUES(1, 1, '2025-03-21 10:00:00', NULL, 1),
(2, 2, '2025-02-10 11:00:00', '2025-03-21', 2),
(3, 3, '2025-03-12 12:00:00', NULL, 1),
(4, 4, '2025-03-14 13:00:00', NULL, 3),
(5, 5, '2025-02-10 14:00:00', '2025-03-01', 2),
(6, 6, '2025-03-20 15:00:00', NULL, 1);

INSERT INTO BorrowingBooks(BookID, UserID, BorrowDate, ReturnDate, StatusID)
VALUES (4, 1, '2025-02-20 10:00:00', NULL, 1);

INSERT INTO FinesTable (BorrowID, due_date, return_date)
VALUES
(8, '2025-02-24', '2025-03-21'),  -- fine for borrowid 2,25 days overdue so 25 days * 0.5
(11, '2025-02-24', '2025-03-01');  -- 5 days overdue, 5 days * 0.5

INSERT INTO FinesTable (BorrowID, due_date, return_date)
VALUES(17, '2025-02-24', '2025-03-20');