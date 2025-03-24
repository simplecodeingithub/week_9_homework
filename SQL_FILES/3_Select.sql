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
--------------------

SELECT * 
FROM LibraryUsers 
WHERE UserID IN (1, 4, 5, 6);

SELECT firstname,lastname
from LibraryUsers;

select firstname, lastname ,email
from LibraryUsers
where joindate = '2024-06-15';

-- query to display lastname and their count which appears more than once ,group by lastname and having count greater than 1
select lastname as Surname,
	count(*) as count_of_lastname
from LibraryUsers
-- where lastname = 'Gowda'
group by lastname
having  count(*) > 1;

SELECT * 
FROM BorrowingBooks 
WHERE BorrowID IN (8, 11);

-- Find how many users live in each city
SELECT City, count(UserId) as TotalUsers
FROM Address
group by City
order by TotalUsers asc;

-- Joins
select lu.firstname, lu.lastname, a.flatNo, a.street, a.city, a.postalcode 
from LibraryUsers as lu
left join Address as a on lu.UserID = a.UserId; 

select lu.firstname, lu.lastname, mt.MembershipType, ast.ActivityStatus
from LibraryUsers as lu
left join MembershipTypeTable as mt on lu.MembershipTypeID = mt.MembershipTypeID
left join ActivityStatusTable as ast on lu.ActivityStatusID = ast.ActivityStatusID;

select lu.firstname, lu.lastname
from LibraryUsers as lu
join ActivityStatusTable as ast on lu.ActivityStatusID = ast.ActivityStatusID
where ast.ActivityStatus = 'inactive';

-- Using COUNT with GROUP BY for Active and Inactive Members
select ast.ActivityStatus, 
    COUNT(lu.UserID) AS NumberOfUsers
from LibraryUsers AS lu
JOIN ActivityStatusTable AS ast ON lu.ActivityStatusID = ast.ActivityStatusID
GROUP BY ast.ActivityStatus;

select *
from Books
where CategoryId > 1;
-- group by Title
-- having count(*) > 1;

SELECT * 
FROM Books 
WHERE BookID IN (2, 3, 4, 5);

-- Count the number of books in each category-join tables
select c.CategoryName, count(b.BookId) as TotalBooks
from Books as b
join Categories c on c.CategoryID = b.CategoryID
group by c.CategoryID
order by TotalBooks desc;
