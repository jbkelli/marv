-- Library Management System Database

-- 1. Create the database
CREATE DATABASE LibraryDB;
USE LibraryDB;

-- 2. Create tables

-- Members table
CREATE TABLE Members (
    MemberID AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    JoinDate DATE NOT NULL
);

-- Books table
CREATE TABLE Books (
    BookID AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(200) NOT NULL,
    Author VARCHAR(100) NOT NULL,
    ISBN VARCHAR(20) NOT NULL UNIQUE,
    PublishedYear INT,
    CopiesAvailable INT DEFAULT 1
);

-- Staff table (One-to-One with Members for staff who are also members)
CREATE TABLE Staff (
    StaffID AUTO_INCREMENT PRIMARY KEY,
    MemberID INT UNIQUE,
    Position VARCHAR(50),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Loans table (Many-to-One: Many loans per member, Many loans per book)
CREATE TABLE Loans (
    LoanID AUTO_INCREMENT PRIMARY KEY,
    MemberID INT NOT NULL,
    BookID INT NOT NULL,
    LoanDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Genres table
CREATE TABLE Genres (
    GenreID AUTO_INCREMENT PRIMARY KEY,
    GenreName VARCHAR(50) NOT NULL UNIQUE
);

-- BookGenres table (Many-to-Many: Books can have multiple genres)
CREATE TABLE BookGenres (
    BookID INT NOT NULL,
    GenreID INT NOT NULL,
    PRIMARY KEY (BookID, GenreID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (GenreID) REFERENCES Genres(GenreID)
);

-- Relationship constraints are included above (PRIMARY KEY, FOREIGN KEY, UNIQUE, NOT NULL)