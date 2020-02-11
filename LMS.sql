USE master

go
CREATE DATABASE LIBRARY_MANAGEMENT_SYSTEM
GO
USE LIBRARY_MANAGEMENT_SYSTEM
GO

CREATE TABLE LIBRARY_BRANCH (
	BranchID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BranchName VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL
);

CREATE TABLE PUBLISHER (
	PublisherName VARCHAR(50) PRIMARY KEY NOT NULL,
	Address VARCHAR(50),
	Phone VARCHAR(50)
);

CREATE TABLE BOOKS (
	BookID INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Title VARCHAR(50) NOT NULL,
	PublisherName VARCHAR(50) NOT NULL CONSTRAINT fk_PublisherName FOREIGN KEY REFERENCES PUBLISHER(PublisherName) ON UPDATE CASCADE ON DELETE CASCADE
);


CREATE TABLE BOOK_COPIES (
	BookID INT NOT NULL CONSTRAINT fk_BookID_Copies FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID FOREIGN KEY REFERENCES LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	Number_Of_Copies INT NOT NULL
	);

CREATE TABLE BOOK_AUTHORS (
	BookID INT NOT NULL CONSTRAINT fk_BookID_Authors FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	AuthorName VARCHAR(50) NOT NULL
);


CREATE TABLE BORROWER (
	CardNo INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	Name VARCHAR(50) NOT NULL,
	Address VARCHAR(50) NOT NULL,
	Phone VARCHAR(50) NOT NULL
);

CREATE TABLE BOOK_LOANS (
	BookID INT NOT NULL CONSTRAINT fk_BookID_Loans FOREIGN KEY REFERENCES BOOKS(BookID) ON UPDATE CASCADE ON DELETE CASCADE,
	BranchID INT NOT NULL CONSTRAINT fk_BranchID_Loans FOREIGN KEY REFERENCES  LIBRARY_BRANCH(BranchID) ON UPDATE CASCADE ON DELETE CASCADE,
	CardNo INT NOT NULL CONSTRAINT fk_CardNo FOREIGN KEY REFERENCES Borrower(CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	DateOut DATE NOT NULL,
	DateDue DATE NOT NULL
);

  
  --INSERT INFO

INSERT INTO LIBRARY_BRANCH
	(BranchName, Address)
	VALUES
	('Sharpstown', '84 Richmond Road'),
	('Central', '38 York Road'),
	('Kilburn', '17 Springfield Road'),
	('Swiss Cottage', '67 Highfield Road')
;

INSERT INTO PUBLISHER
	(PublisherName, Address, Phone)
	VALUES
	('HC', '57 Grange Road', '234-4324'),
	('Penguin Books', '1 Park Road', '234-3456'),
	('Random House', '9095 Alexander Road', '654-3457')
;

INSERT INTO BOOKS
	(Title, PublisherName)
	VALUES
	('The Lost Tribe', 'Penguin Books'),
	('The Shining', 'HC'),
	('IT', 'HC'),
	('1984', 'Random House' ),
	('The Ambassadors', 'HC'),
	('On the Road', 'Penguin Books' ),
	('Ulysses', 'HC'),
	('Do Androids Dream of Electric Sheep?', 'HC' ),
	('The Hitchhiker''s Guide to the Galaxy','Random House' ),
	('To Kill a Mockingbird', 'HC'),
	('A Clockwork Orange', 'Penguin Books' ),
	('Where the Wild Things Are', 'Random House'),
	('One Flew Over the Cuckoo''s Nest', 'HC'),
	('Brave New World', 'Random House' ),
	('Fahrenheit 451', 'HC'),
	('A Confederacy of Dunces', 'HC' ),
	('Zen and the Art of Motorcycle Maintenance', 'Penguin Books' ),
	('The Restaurant at the End of the Universe', 'HC'),
	('Lord Of The Flies', 'Random House'),
	('Hard-Boiled Wonderland and the End of the World', 'Random House')
;

INSERT INTO BOOK_COPIES
	(BookID, BranchID, Number_Of_Copies)
	VALUES
	(1, 1, 2),
	(2, 1, 3),
	(3, 1, 2),
	(4, 1, 4),
	(5, 1, 4),
	(6, 1, 3),
	(7, 1, 2),
	(8, 1, 3),
	(9, 1, 2),
	(10, 1, 3),
	(11, 2, 2),
	(12, 2, 2),
	(13, 2, 2),
	(2, 2, 2),
	(3, 2, 3),
	(16, 2, 2),
	(17, 2, 2),
	(17, 2, 3),
	(18, 2, 2),
	(19, 2, 3),
	(20, 2, 3)
;

INSERT INTO BOOK_AUTHORS
	(BookID, AuthorName)
	VALUES
	(1, 'James Joyce'),
	(2, 'Stephen King'),
	(3, 'Stephen King'),
	(4, 'George Orwell'),
	(5, 'Douglas Adams'),
	(6, 'Aldous Huxley'),
	(7, 'Haruki Murakami'),
	(8, 'Philip K. Dick'),
	(9, 'Robert M. Persig'),
	(10, 'Ken Kesey'),
	(11, 'Maurice Sendak'),
	(12, 'Anthony Burgess')
;

INSERT INTO BORROWER
	(Name, Address, Phone)
	VALUES
	('Jim Smith', '57 Grange Road', '432-5211'),
	('Sam Booker', '997 Mill Road', '234-5312'),
	('Bill Brasky', '66 Park Avenue', '421-4346'),
	('Jen Brinkley', '32 St. John’s Road', '234-3456'),
	('Fred Durst', '56 Chester Road', '245-6787'),
	('Greg Williams', '43 South Street', '234-5264'),
	('Velma Chris', '56 Chester Road', '543-7643'),
	('Karen Shaw', '9848 London Road', '534-2567')
;

select * from BOOK_LOANS
INSERT INTO BOOK_LOANS
	(BookID, BranchID, CardNo, DateOut, DateDue)
	VALUES
	(2, 1, 1 , '02-02-19', '02-11-20'),
	(11, 1, 1 , '02-02-19', '02-11-20'),
	(1, 1, 1 , '02-02-19', '02-19-19'),
	(5, 1, 1 , '02-02-19', '02-19-19'),
	(18, 1, 1 , '02-02-19', '02-19-19'),
	(3, 1, 3 , '02-02-19', '02-19-19'),
	(4, 1, 3 , '02-02-19', '02-19-19'),
	(5, 1, 3 , '02-03-19', '02-19-19'),
	(6, 1, 3 , '02-12-19', '02-19-19'),
	(7, 1, 3 , '02-02-19', '02-19-19'),
	(8, 2, 5 , '02-02-19', '02-19-19'),
	(2, 1, 6 , '02-02-19', '02-19-19'),
	(12, 4, 2 , '02-02-19', '02-19-19'),
	(1, 1, 3 , '02-02-19', '02-19-19'),
	(12, 1, 7 , '02-02-19', '02-19-19'),
	(2, 2, 1 , '02-02-19', '02-10-20'),
	(6, 1, 2 , '02-02-19', '02-19-19'),
	(18, 2, 3 , '02-02-19', '02-19-19'),
	(15, 3, 3 , '02-02-19', '02-19-19'),
	(14, 4, 7 , '02-02-19', '02-19-19'),
	(13, 3, 7 , '02-02-19', '02-19-19'),
	(9, 2, 7 , '02-02-19', '02-19-19'),
	(3, 1, 5 , '02-02-19', '02-19-19'),
	(2, 2, 5 , '02-02-19', '02-19-19'),
	(5, 3, 3, '02-02-19', '02-19-19'),
	(4, 4, 1 , '02-02-19', '02-19-19'),
	(3, 2, 1 , '02-12-19', '02-19-19'),
	(2, 1, 1 , '02-02-19', '02-19-19'),
	(11, 1, 2 , '02-02-19', '02-19-19'),
	(12, 2, 3 , '02-02-19', '02-19-19'),
	(2, 3, 7 , '02-02-19', '02-19-19'),
	(12, 4, 7 , '02-02-19', '02-11-20'),
	(15, 1, 7 , '02-02-19', '02-19-19'),
	(14, 2, 7 , '02-02-19', '02-19-19'),
	(15, 2, 7 , '02-02-19', '02-19-19'),
	(1, 2, 6 , '02-02-19', '02-19-19'),
	(2, 1, 6 , '02-02-19', '02-19-19'),
	(3, 1, 6 , '02-02-19', '02-19-19'),
	(4, 1, 6 , '02-02-19', '02-19-19'),
	(5, 1, 6 , '02-02-19', '02-19-19'),
	(6, 1, 6 , '02-02-19', '02-19-19'),
	(7, 1, 6 , '02-02-19', '02-19-19'),
	(8, 1, 5, '02-02-19', '02-19-19'),
	(12, 1, 2 , '02-02-19', '02-19-19'),
	(13, 1, 3 , '02-02-19', '02-19-19'),
	(14, 1, 8 , '02-02-19', '02-19-19'),
	(15, 1, 8 , '02-02-19', '02-19-19'),
	(16, 1, 8 , '02-02-19', '02-19-19'),
	(4, 1, 8 , '02-02-19', '02-19-19'),
	(3, 1, 8 , '02-02-19', '02-19-19'),
	(2, 1, 8 , '02-02-19', '02-19-19')
;


-- STORED PROCEDURES--

--1.)How many copies of the book titled "The Lost Tribe" are owned by the library
   --branch whose name is "Sharpstown"?

SELECT Number_Of_Copies 'Number of Copies' FROM LIBRARY_BRANCH
INNER JOIN BOOK_COPIES
ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID
INNER JOIN BOOKS
ON BOOK_COPIES.BookID = BOOKS.BookID
WHERE Title = 'The Lost Tribe';

--2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch?

SELECT BranchName Branch, Number_Of_Copies 'Number of Copies' FROM LIBRARY_BRANCH
INNER JOIN BOOK_COPIES
ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID
INNER JOIN BOOKS
ON BOOK_COPIES.BookID = BOOKS.BookID
WHERE Title = 'The Lost Tribe';


--3.) Retrieve the names of all borrowers who do not have any books checked out.

SELECT * FROM BORROWER
left JOIN BOOK_LOANS 
ON BORROWER.CardNo = BOOK_LOANS.CardNo 
WHERE BookID IS NULL


--4.) For each book that is loaned out from the "Sharpstown" branch and whose DueDate is today,
--retrieve the book title, the borrower's name, and the borrower's address.

SELECT Title, Name, BORROWER.Address FROM BOOK_LOANS
INNER JOIN BORROWER ON BORROWER.CardNo = BOOK_LOANS.CardNo
INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_LOANS.BranchID
INNER JOIN BOOKS on BOOKS.BookID = BOOK_LOANS.BookID
WHERE BranchName = 'Sharpstown' and DateDue = CAST(CURRENT_TIMESTAMP AS DATE)

--6.) Retrieve the names, addresses, and the number of books checked out for all
--borrowers who have more than five books checked out.

SELECT Name, BORROWER.Address, COUNT(BOOK_LOANS.CardNo) 'Books Out' FROM BORROWER
INNER JOIN BOOK_LOANS ON BOOK_LOANS.CardNo = BORROWER.CardNo
GROUP BY Name, BORROWER.Address
HAVING COUNT(BOOK_LOANS.CardNo) > 5


--7.) For each book authored (or co-authored) by "Stephen King", retrieve the title and the number of
--    copies owned by the library branch whose name is "Central".

SELECT Title, Number_Of_Copies 'Copies Owned' FROM BOOK_COPIES
INNER JOIN LIBRARY_BRANCH ON LIBRARY_BRANCH.BranchID = BOOK_COPIES.BranchID
INNER JOIN BOOKS ON BOOKS.BookID = BOOK_COPIES.BookID
INNER JOIN BOOK_AUTHORS ON BOOK_AUTHORS.BookID = BOOK_COPIES.BookID
WHERE AuthorName = 'Stephen King' AND BranchName = 'Central'
