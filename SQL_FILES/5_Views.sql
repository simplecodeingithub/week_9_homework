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
INNER JOIN LibraryUsers lu ON lu.UserID = bb.UserID  -- Corrected join condition
WHERE bb.ReturnDate IS NULL;

select * from vBorrowedbooks;

-- To get the number of books borrowed by each user
SELECT UserID, COUNT(BookID) AS BookCount
FROM vBorrowedBooks
GROUP BY UserID;


