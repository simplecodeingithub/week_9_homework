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
JOIN Books b ON bb.BookID = b.BookID
JOIN LibraryUsers lu ON lu.UserID = lu.UserID
WHERE bb.ReturnDate IS NULL;

select * from vBorrowedbooks;


