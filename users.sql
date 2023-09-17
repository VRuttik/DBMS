-- Create the users table with a text column for gender

CREATE TABLE users (  
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,  email VARCHAR(150) NOT NULL,
  password VARCHAR(100) NOT NULL,
  contact VARCHAR(15),  address TEXT,
  dob DATE,
  gender TEXT CHECK (gender IN ('M', 'F', 'O')),
  status BOOLEAN);

-- Insert sample data into the users tableINSERT INTO users (name, email, password, contact, address, dob, gender, status) 
VALUES('John Doe', 'john@example.com', 'hashed_password_1', '1234567890', '123 Main St, City, Country', '1990-01-15', 'M', 1),
  ('Jane Smith', 'jane@example.com', 'hashed_password_2', '9876543210', '456 Elm St, Town, Country', '1995-05-20', 'F', 1),
  ('Sam Johnson', 'sam@example.com', 'hashed_password_3', '5555555555', '789 Oak St, Village, Country', '1985-11-10', 'M', 0),
  ('Emily Brown', 'emily@example.com', 'hashed_password_4', '4444444444', '101 Pine St, Town, Country', '2000-08-05', 'F', 1),
  ('Alex Lee', 'alex@example.com', 'hashed_password_5', '3333333333', '222 Cedar St, City, Country', '1992-03-30', 'O', 0),
  ('Grace Wilson', 'grace@example.com', 'hashed_password_6', '2222222222', '789 Birch St, Village, Country', '1998-07-12', 'F', 1),
  ('Michael Brown', 'michael@example.com', 'hashed_password_7', '6666666666', '555 Redwood St, Town, Country', '1980-12-25', 'M', 0),
  ('Sophia Davis', 'sophia@example.com', 'hashed_password_8', '7777777777', '888 Maple St, City, Country', '1997-04-18', 'F', 1),
  ('William Johnson', 'william@example.com', 'hashed_password_9', '9999999999', '999 Cedar St, Village, Country', '1993-09-03', 'M', 0),
  ('Olivia Anderson', 'olivia@example.com', 'hashed_password_10', '1111111111', '444 Birch St, Town, Country', '1987-06-08', 'F', 1);

SELECT * FROM users;
-- Select and display specific columns with aliases-
SELECT  id AS ID,  name AS Name,  email AS Email,  contact AS ContactFROM  users;

-- Select and display specific columns with aliases and a condition
SELECT
  id AS ID,
  name AS Name,
  email AS Email,
  contact AS Contact
FROM
  users
WHERE
  gender = 'F';

-- Delete a user by email
DELETE FROM users
WHERE email = 'jane@example.com';

-- Update the contact number for a user by name
UPDATE users
SET contact = '5555555555'
WHERE name = 'John Doe';

-- Select all columns from the users table
SELECT * FROM users;

-- Select distinct combinations of names and email addresses from the users table
SELECT DISTINCT name, email
FROM users;

-- Find users with the name "John Doe"
SELECT *
FROM users
WHERE name = 'John Doe';

-- Find users whose gender is not 'M'
SELECT *
FROM users
WHERE gender != 'M';

-- Find users born after January 1, 1990
SELECT *
FROM users
WHERE dob > '1990-01-01';

-- Find users with a "status" value of 0 (false)
SELECT *
FROM users
WHERE status < 1;

-- Find users with DOB between January 1, 1990, and December 31, 1995
SELECT *
FROM users
WHERE dob BETWEEN '1990-01-01' AND '1995-12-31';

-- Find users with a "status" value between 0 and 1 (inclusive)
SELECT *
FROM users
WHERE status BETWEEN 0 AND 1;

-- Find users with names starting with letters 'A' to 'M'
SELECT *
FROM users
WHERE name BETWEEN 'A' AND 'Mzzz';

-- Find users whose names start with "Joh"
SELECT *
FROM users
WHERE name LIKE 'Joh%';

-- Find users whose names end with "son"
SELECT *
FROM users
WHERE name LIKE '%son';

-- Find users whose names contain "mi"
SELECT *
FROM users
WHERE name LIKE '%mi%';

-- Find users whose names start with "Joh" and end with "son"
SELECT *
FROM users
WHERE name LIKE 'Joh%' AND name LIKE '%son';

-- Find users whose names have 'e' at the 3rd position
SELECT *
FROM users
WHERE name LIKE '__e%';

-- Find users whose names do not contain 'x'
SELECT *
FROM users
WHERE name NOT LIKE '%x%';

-- Combine names of male and female users
SELECT name
FROM users
WHERE gender = 'M'
UNION
SELECT name
FROM users
WHERE gender = 'F';

-- Find names that are common between male and female users
SELECT name
FROM users
WHERE gender = 'M'
INTERSECT
SELECT name
FROM users
WHERE gender = 'F';

-- Find names of male users who are not female users
SELECT name
FROM users
WHERE gender = 'M'
EXCEPT
SELECT name
FROM users
WHERE gender = 'F';

-- Count the total number of users
SELECT COUNT(*) as TotalUsers
FROM users;

-- Calculate the average age of users
SELECT AVG(YEAR(CURRENT_DATE) - YEAR(dob)) as AverageAge
FROM users;

-- Calculate the total count of active users (status=1)
SELECT SUM(status) as ActiveUsers, SUM(1 - status) as InactiveUsers
FROM users;

-- Find the oldest and youngest users
SELECT MIN(dob) as OldestUserDOB, MAX(dob) as YoungestUserDOB
FROM users;

-- Find the average age of female users with a minimum count of 2
SELECT gender, AVG(YEAR(CURRENT_DATE) - YEAR(dob)) as AverageAge
FROM users
WHERE gender = 'F'
GROUP BY gender
HAVING COUNT(*) >= 2;

-- Find the maximum length of contact numbers for active users
SELECT MAX(LENGTH(contact)) as MaxContactLength
FROM users
WHERE status = 1;
