-- LAPTOP-3RMHIUU8\HP-VICTUS-16

-- Creating / Using Database

CREATE DATABASE tasktrek_todo_list_manager;

USE tasktrek_todo_list_manager;

-- Table 1

CREATE TABLE tt_admin_details (
	Id INT PRIMARY KEY IDENTITY,
	Username VARCHAR(50) NOT NULL UNIQUE,
	Password VARCHAR(50) NOT NULL
);

-- Table 2

CREATE TABLE tt_users_details (
    Id INT PRIMARY KEY IDENTITY,
    Username VARCHAR(50) NOT NULL UNIQUE,
	Email VARCHAR(250) NOT NULL,
    Password VARCHAR(50) NOT NULL,
);

-- Table 3

CREATE TABLE tt_tasks (
    TaskId INT PRIMARY KEY IDENTITY,
    UserId INT FOREIGN KEY REFERENCES tt_users_details(Id),
    Task TEXT NOT NULL,
    TaskCategory VARCHAR(50) NOT NULL,
    IsCompleted VARCHAR(10) DEFAULT 'No',
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Table 4

CREATE TABLE tt_users_feedback (
    Id INT PRIMARY KEY IDENTITY,
    Username VARCHAR(50) NOT NULL,
	Rating VARCHAR(30) NOT NULL,
    Feedback TEXT NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE()
);

-- Synonyms (1 for each table)

CREATE SYNONYM admin FOR tt_admin_details;
CREATE SYNONYM users FOR tt_users_details;
CREATE SYNONYM tasks FOR tt_tasks;
CREATE SYNONYM feedback FOR tt_users_feedback;

-- Procedure 1

CREATE PROCEDURE registerNewUser
	@Username VARCHAR(50),
	@Email VARCHAR(150),
	@Password VARCHAR(50)
AS
BEGIN
	INSERT INTO users
	(Username, Email, Password)
	VALUES
	(@Username, @Email, @Password);
END;

-- Procedure 2

CREATE PROCEDURE verifyUserLogin
	@Username VARCHAR(50),
	@Password VARCHAR(50)
AS
BEGIN
	SELECT * FROM users
	WHERE
	Username = @Username
	AND
	Password = @Password;
END;

-- Procedure 3

CREATE PROCEDURE verifyAdminLogin
	@Username VARCHAR(50),
	@Password VARCHAR(50)
AS
BEGIN
	SELECT * FROM admin
	WHERE
	Username = @Username
	AND
	Password = @Password;
END;

-- Procedure 4

CREATE PROCEDURE addUsersFeedback
	@Username VARCHAR(50),
	@Rating VARCHAR(30),
	@Feedback TEXT
AS
BEGIN
	INSERT INTO feedback 
	(Username, Rating, Feedback)
	VALUES
	(@Username, @Rating, @Feedback);
END;

-- Procedure 5

CREATE PROCEDURE displayLoggedInUserDetails
	@Username VARCHAR(50)
AS
BEGIN
	SELECT * FROM users 
	WHERE 
	Username = @Username;
END;

-- Procedure 6

CREATE PROCEDURE deleteUserAccount
	@Username VARCHAR(50)
AS
BEGIN
	DECLARE @UserId INT;

	SELECT @UserId = Id FROM users WHERE Username = @Username;

	DELETE FROM tasks WHERE UserId = @UserId;

	DELETE FROM users WHERE Username = @Username;
END;

-- Procedure 7

CREATE PROCEDURE updateUserAccount
	@Id INT,
	@Username VARCHAR(50),
	@Email VARCHAR(250),
	@Password VARCHAR(50)
AS
BEGIN
	UPDATE users SET
	Username = @Username, 
	Email = @Email, 
	Password = @Password
	WHERE
	Id = @Id
END;

-- Procedure 8

CREATE PROCEDURE addUsersTask
	@UserId INT,
	@TaskCategory VARCHAR(50),
	@Task TEXT
AS
BEGIN
	INSERT INTO tasks 
	(UserId, TaskCategory, Task)
	VALUES
	(@UserId, @TaskCategory, @Task);
END;

-- Procedure 9

CREATE PROCEDURE displayLoggedInUserTasks
	@UserId INT
AS
BEGIN
	SELECT 
		TaskId, 
		Task, 
		TaskCategory, 
		IsCompleted, 
		CreatedAt 
	FROM 
		tasks 
	WHERE 
		UserId = @UserId;
END;

-- Procedure 10

CREATE PROCEDURE deleteUserTask
	@TaskId INT
AS
BEGIN
	DELETE FROM tasks 
	WHERE
	TaskId = @TaskId
END;

-- Procedure 11

CREATE PROCEDURE editUserTask
	@TaskId INT,
	@TaskCategory VARCHAR(50),
	@Task TEXT,
	@IsCompleted VARCHAR(10)
AS
BEGIN
	UPDATE tasks 
	SET
	Task = @Task,
	TaskCategory = @TaskCategory,
	IsCompleted = @IsCompleted
	WHERE 
	TaskId = @TaskId
END;

-- Procedure 12

CREATE PROCEDURE showAllAdminDetails
AS
BEGIN
	SELECT Id, Username FROM admin ORDER BY Id;
END;

-- Procedure 13

CREATE PROCEDURE addNewAdmin
	@Username VARCHAR(50),
	@Password VARCHAR(50)
AS
BEGIN
	INSERT INTO admin
	(Username, Password)
	VALUES
	(@Username, @Password);
END;

-- Procedure 14

CREATE PROCEDURE displayLoggedInAdminDetails
	@Username VARCHAR(50)
AS
BEGIN
	SELECT * FROM admin WHERE Username = @Username;
END;

-- Procedure 15

CREATE PROCEDURE deleteAdminAccount
	@Username VARCHAR(50)
AS
BEGIN
	DELETE FROM admin
	WHERE
	Username = @Username;
END;

-- Procedure 16

CREATE PROCEDURE updateAdminAccount
	@Id INT,
	@Username VARCHAR(50),
	@Password VARCHAR(50)
AS
BEGIN
	UPDATE admin SET
	Username = @Username, Password = @Password
	WHERE
	Id = @Id
END;

-- Procedure 17

CREATE PROCEDURE displayUserFeedbacks
AS
BEGIN
	SELECT * FROM feedback;
END;

-- Procedure 18

CREATE PROCEDURE deleteUserFeedback
	@Id INT
AS
BEGIN
	DELETE FROM feedback 
	WHERE
	Id = @Id
END;

-- Procedure 19

CREATE PROCEDURE displayAllUserTasks
AS
BEGIN
	SELECT 
		tt_tasks.TaskId,
		tt_users_details.Username,
		tt_tasks.UserId,
		tt_tasks.Task,
		tt_tasks.TaskCategory,
		tt_tasks.IsCompleted,
		tt_tasks.CreatedAt
	FROM
		tt_users_details
	INNER JOIN 
		tt_tasks
	ON 
		tt_tasks.UserId = tt_users_details.Id;
END;

-- Procedure 20

CREATE PROCEDURE displayAllUsers 
AS
BEGIN
	SELECT * FROM users;
END;

-- Procedure 21

CREATE PROCEDURE searchUserByUsername
	@Username VARCHAR(50)
AS
BEGIN
	SELECT * FROM users WHERE Username LIKE @Username;
END;

-- Procedure 22

CREATE PROCEDURE emptyEntireDatabase
AS
BEGIN
	TRUNCATE TABLE tt_admin_details;
	TRUNCATE TABLE tt_tasks;
	TRUNCATE TABLE tt_users_feedback;
	DELETE FROM tt_users_details;
	DBCC CHECKIDENT ('tt_users_details', RESEED, 0);
END;