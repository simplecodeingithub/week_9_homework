USE librarydb;

select *
from MembershipTypeTable;

select *
from ActivityStatusTable;

select *
from LibraryUsers;

select *
from Address;

select * 
from Authors;

select * 
from Categories;

select * 
from Books;

select *
from BorrowStatus;

select * 
from BorrowingBooks;

select *
from FinesTable;

SELECT * 
FROM Notifications;

--

SELECT * 
FROM LibraryUsers 
WHERE UserID IN (1, 4, 5, 6);

SELECT firstname,lastname
from LibraryUsers;

-- where - filters select users who joined on give date
select firstname, lastname ,email
from LibraryUsers
where joindate = '2024-06-15';

-- Count the number of users with the same lastname (which appear more than once)
select lastname as Surname,
	count(*) as count_of_lastname
from LibraryUsers
-- where lastname = 'Gowda'
group by lastname
having  count(*) > 1;

SELECT * 
FROM BorrowingBooks 
WHERE BorrowID IN (8, 11);

-- To get the number of books borrowed by each user
SELECT UserID, COUNT(BookID) AS BookCount
FROM vBorrowedBooks
GROUP BY UserID;

-- Find how many users live in each city
SELECT City, count(UserId) as TotalUsers
FROM Address
group by City
order by TotalUsers asc;

-- get the user who is having more than one address
SELECT lu.firstname, lu.lastname, COUNT(a.AddressID) AS AddressCount
FROM LibraryUsers AS lu
LEFT JOIN Address AS a ON lu.UserID = a.UserID
GROUP BY lu.UserID, lu.firstname, lu.lastname
HAVING COUNT(a.AddressID) > 1
ORDER BY AddressCount DESC;

-- Join LibraryUsers table with Address table to get address details
select lu.firstname, lu.lastname, a.flatNo, a.street, a.city, a.postalcode 
from LibraryUsers as lu
right outer join Address as a on lu.UserID = a.UserId;


-- Grouping by User to show only distinct users, even if they have multiple addresses
SELECT lu.firstname, lu.lastname, COUNT(a.addressID) AS NumberOfAddresses
FROM LibraryUsers AS lu
RIGHT OUTER JOIN Address AS a ON lu.UserID = a.UserID
GROUP BY lu.firstname, lu.lastname;


select lu.firstname, lu.lastname, mt.MembershipType, ast.ActivityStatus
from LibraryUsers as lu
left join MembershipTypeTable as mt on lu.MembershipTypeID = mt.MembershipTypeID
left join ActivityStatusTable as ast on lu.ActivityStatusID = ast.ActivityStatusID;

-- Retrieve firstname and lastname of users who are inactive ,specifically inactive so using Inner Join
select lu.firstname, lu.lastname
from LibraryUsers as lu
inner join ActivityStatusTable as ast on lu.ActivityStatusID = ast.ActivityStatusID
where ast.ActivityStatus = 'inactive';

-- Count the number of users for each activity status, includes both Active and Inactive Members from right outer 
select ast.ActivityStatus, 
    COUNT(lu.UserID) AS NumberOfUsers
from LibraryUsers AS lu
RIGHT OUTER JOIN ActivityStatusTable AS ast ON lu.ActivityStatusID = ast.ActivityStatusID
GROUP BY ast.ActivityStatus;

select *
from Books
where CategoryId > 1;
-- group by Title
-- having count(*) > 1;

SELECT * 
FROM Books 
WHERE BookID IN (2, 3, 4, 5);




-- List all users and the books they have borrowed,including users who haven’t borrowed any books
SELECT DISTINCT lu.firstname, lu.lastname, b.Title
FROM LibraryUsers AS lu
LEFT OUTER JOIN BorrowingBooks AS bb ON lu.UserID = bb.UserID
LEFT OUTER JOIN Books AS b ON bb.BookID = b.BookID;


-- Count the number of books in each category-join tables
select c.CategoryName, count(b.BookId) as TotalBooks
from Books as b
left outer join Categories c on c.CategoryID = b.CategoryID
group by c.CategoryID
order by TotalBooks desc;
