USE librarydb;

CREATE VIEW vBorrowedbooks AS
SELECT 
    bb.BorrowID,
    b.BookID,
    b.Title,
    bb.UserID,
    lu.firstname,
    lu.lastname,
    bb.BorrowDate,
    bb.DueDate
FROM BorrowingBooks bb
INNER JOIN Books b ON bb.BookID = b.BookID
INNER JOIN LibraryUsers lu ON lu.UserID = lu.UserID
WHERE bb.ReturnDate IS NULL;

-- shows all borrowed books with user details and borrow information
ALTER VIEW vBorrowedBooks AS
SELECT 
    bb.BorrowID,
    b.BookID,
    b.Title,
    bb.UserID,
    lu.firstname,
    lu.lastname,
    bb.BorrowDate,
    bb.DueDate
FROM BorrowingBooks bb
INNER JOIN Books b ON bb.BookID = b.BookID
INNER JOIN LibraryUsers lu ON lu.UserID = bb.UserID  
WHERE bb.ReturnDate IS NULL;

select * from vBorrowedbooks;



CREATE VIEW BorrowingWithStatus AS
SELECT bb.*, bs.StatusDescription
FROM BorrowingBooks bb
JOIN BorrowStatus bs ON bb.StatusID = bs.StatusID; -- inner join

SELECT * FROM BorrowingWithStatus;


