TITLE
=====
SQL Query Practice on Stored Procedures and Cursors

DESCRIPTION
===========
Three tables are provided to load data into the local machine, and we are free 
to add as many tuples as we want. After that, we are given 5 problem statements. 
To solve these, we have to write SQL queries using stored procedures and cursors.

DATABASE SCHEMA
===============
There are 3 tables: Shows, Subscribers, and WatchHistory.

- Shows table stores: ShowID, Title, Genre, ReleaseYear
- Subscribers table stores: SubscriberID, SubscriberName, SubscriptionDate
- WatchHistory table stores: HistoryID, ShowID, SubscriberID, WatchTime

SAMPLE DATA
===========
We have to add data in the following formats:

- Shows table → (ShowID, Title, Genre, ReleaseYear)
- Subscribers table → (SubscriberID, SubscriberName, SubscriptionDate)
- WatchHistory table → (HistoryID, ShowID, SubscriberID, WatchTime)

QUESTIONS AND SOLUTIONS
=======================

1) ListAllSubscribers()
------------------------
This procedure uses a cursor. The cursor loops through each row in Subscribers 
and prints subscriber names.

2) GetWatchHistoryBySubscriber(IN sub_id INT)
---------------------------------------------
This procedure uses INNER JOIN to fetch the watch history of the given subscriber.

3) AddSubscriberIfNotExists(IN subName VARCHAR(100))
----------------------------------------------------
In this procedure, we add a subscriber if they do not already exist 
in the Subscribers table.

4) SendWatchTimeReport()
-------------------------
This procedure iterates through subscribers and calls the watch history 
procedure for those who have watched something.

5) Cursor-Based Watch History Report
------------------------------------
In this procedure, we print the watch history of each subscriber 
using a cursor and the GetWatchHistoryBySubscriber() procedure.

HOW TO RUN
==========
1) Install MySQL Workbench if it is not already installed.
2) Open MySQL Workbench.
3) Create a database with any name.
4) Insert the given sample data into the tables.
=>I have added some more data so to add all those data just copy past the below code :
-- Create Tables
CREATE DATABASE IF NOT EXISTS campus;

SHOW DATABASES;
------------------------------------------------------------------------------------------
USE campus;

-- Create Tables
-- Tables 1
CREATE TABLE Shows (
ShowID INT PRIMARY KEY,
Title VARCHAR(100),
Genre VARCHAR(50),
ReleaseYear INT
);

INSERT INTO Shows (ShowID, Title, Genre, ReleaseYear) VALUES
(1, 'Stranger Things', 'Sci-Fi', 2016),
(2, 'The Crown', 'Drama', 2016),
(3, 'The Witcher', 'Fantasy', 2019),
(4, '3 Idiots', 'Comedy-Drama', 2009),
(5, 'Dangal', 'Biography-Sports', 2016),
(6, 'Zindagi Na Milegi Dobara', 'Adventure-Drama', 2011),
(7, 'Gully Boy', 'Musical-Drama', 2019),
(8, 'Lagaan', 'Sports-Drama', 2001),
(9, 'Kabir Singh', 'Romance-Drama', 2019),
(10, 'Chak De! India', 'Sports-Drama', 2007),
(11, 'Barfi!', 'Romantic-Comedy', 2012),
(12, 'PK', 'Comedy-Drama', 2014),
(13, 'Queen', 'Drama-Comedy', 2013),
(14, 'Bajrangi Bhaijaan', 'Drama-Adventure', 2015),
(15, 'Shershaah', 'Biography-War', 2021);
 -- Tables 2
CREATE TABLE Subscribers (
SubscriberID INT PRIMARY KEY,
SubscriberName VARCHAR(100),
SubscriptionDate DATE
);

INSERT INTO Subscribers (SubscriberID, SubscriberName,
SubscriptionDate) VALUES
(1, 'Emily Clark', '2023-01-10'),
(2, 'Chris Adams', '2023-02-15'),
(3, 'Jordan Smith', '2023-03-05'),
(4, 'Ananya Chatterjee', '2023-03-12'),
(5, 'Ritwik Sen', '2023-03-20'),
(6, 'Sohini Ghosh', '2023-04-01'),
(7, 'Arjun Mukherjee', '2023-04-10'),
(8, 'Madhurima Roy', '2023-04-18'),
(9, 'Subhankar Das', '2023-05-02'),
(10, 'Ishita Banerjee', '2023-05-15'),
(11, 'Rohan Bhattacharya', '2023-06-01'),
(12, 'Tanuja Sinha', '2023-06-12'),
(13, 'Debabrata Choudhury', '2023-06-20'),
(14, 'Priyanka Sen', '2023-07-05'),
(15, 'Arpita Ghosh', '2023-07-18');

-- Table 3

CREATE TABLE WatchHistory (
HistoryID INT PRIMARY KEY,
ShowID INT,
SubscriberID INT,
WatchTime INT, -- Duration in minutes
FOREIGN KEY (ShowID) REFERENCES Shows(ShowID),
FOREIGN KEY (SubscriberID) REFERENCES
Subscribers(SubscriberID)
);

INSERT INTO WatchHistory (HistoryID, SubscriberID, ShowID, WatchTime) VALUES
(1, 1, 1, 100),
(2, 1, 2, 10),
(3, 2, 1, 20),
(4, 2, 2, 40),
(5, 2, 3, 10),
(6, 3, 2, 10),
(7, 3, 1, 10),
(8, 4, 4, 120),
(9, 4, 5, 80),
(10, 5, 6, 90),
(11, 5, 7, 60),
(12, 6, 8, 110),
(13, 6, 9, 50),
(14, 7, 10, 70),
(15, 7, 11, 40),
(16, 8, 12, 100),
(17, 8, 13, 30),
(18, 9, 14, 60),
(19, 9, 15, 90),
(20, 10, 1, 50),
(21, 10, 5, 40),
(22, 11, 3, 30),
(23, 11, 7, 20),
(24, 12, 2, 70),
(25, 12, 4, 50),
(26, 13, 6, 90),
(27, 13, 8, 60),
(28, 14, 9, 80),
(29, 14, 11, 40),
(30, 15, 12, 70),
(31, 15, 15, 100);
------------------------------------------------------------------------------------------------------------------------
5) Copy the queries from Q1 to Q5 based on which procedure you want to run, 
   then execute them.
