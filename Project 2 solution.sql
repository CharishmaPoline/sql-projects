create database project2
-- Create Roles table
CREATE TABLE Role (
    id INT PRIMARY KEY,
    role_name VARCHAR(100)
);
select * from Role
-- Insert data into Roles table
INSERT INTO Role (id, role_name) VALUES
(1, 'Admin'),
(2, 'User');
-- Create User_Accounts table
CREATE TABLE User_Accounts (
    id INT PRIMARY KEY,
    user_name VARCHAR(100),
    email VARCHAR(254),
    password VARCHAR(200),
    password_salt VARCHAR(50) NULL,
    password_hash_algorithm VARCHAR(50) NULL
);
select * from User_Accounts
-- Insert data into User_Accounts table
INSERT INTO User_Accounts (id, user_name, email, password) VALUES
(1, 'JohnDoe', 'john.doe@example.com', 'hashed_password1'),
(2, 'JaneSmith', 'jane.smith@example.com', 'hashed_password2');
-- Create Status_Accounts table
CREATE TABLE Status_Accounts (
    id INT PRIMARY KEY,
    status_name VARCHAR(100),
    is_user_working BIT
);
select * from Status_Accounts
-- Insert data into Status_Accounts table
INSERT INTO Status_Accounts (id, status_name, is_user_working) VALUES
(1, 'Active', 1),
(2, 'Inactive', 0);
-- Create User_Has_Status table
CREATE TABLE User_Has_Status (
    id INT PRIMARY KEY,
    status_start_time DATETIME,
    status_end_time DATETIME NULL,
    user_account_id INT,
    status_id INT,
    FOREIGN KEY (user_account_id) REFERENCES User_Accounts(id),
    FOREIGN KEY (status_id) REFERENCES Status_Accounts(id)
);
Select * from User_Has_Status
-- Insert data into User_Has_Status table
INSERT INTO User_Has_Status (id, status_start_time, user_account_id, status_id) VALUES
(1, '2024-03-12 12:00:00', 1, 1),
(2, '2024-03-11 08:00:00', 2, 2);
-- Create User_Roles table
CREATE TABLE User_Roles (
    id INT PRIMARY KEY,
    role_start_time DATETIME,
    role_end_time DATETIME NULL,
    user_account_id INT,
    role_id INT,
    FOREIGN KEY (user_account_id) REFERENCES User_Accounts(id),
    FOREIGN KEY (role_id) REFERENCES Role(id)
);
select * from User_Roles
-- Insert data into User_Roles table
INSERT INTO User_Roles (id, role_start_time, user_account_id, role_id) VALUES
(1, '2024-03-12 12:00:00', 1, 1),
(2, '2024-03-11 08:00:00', 2, 2);
-------2) Delete all the data from each of the tables.-------
-- Delete data from User_Roles table
DELETE FROM User_Roles;

-- Delete data from Roles table
DELETE FROM Roles;

-- Delete data from User_Accounts table
DELETE FROM User_Accounts;

-- Delete data from User_Has_Status table
DELETE FROM User_Has_Status;

-- Delete data from Status_Accounts table
DELETE FROM Status_Accounts;
