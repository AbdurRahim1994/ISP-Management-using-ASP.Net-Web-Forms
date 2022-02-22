CREATE DATABASE ASP_Final_Project
GO
SELECT * FROM tblUser
GO
CREATE TABLE tblUser
(
	id INT PRIMARY KEY IDENTITY,
	name VARCHAR(50) NOT NULL,
	email VARCHAR(60) NOT NULL,
	contact VARCHAR(20) NOT NULL,
	dateOfBirth DATE NOT NULL,
	gender VARCHAR(10) NOT NULL,
	userName NVARCHAR(100) NOT NULL,
	password NVARCHAR(50) NOT NULL,
	retryAttempts INT,
	isLocked BIT,
	lockedDateTime DATETIME
)
GO

ALTER PROC spRegisterUser 
 @name VARCHAR(50), 
 @email NVARCHAR(60),
 @contact VARCHAR(20) ,
 @dateOfBirth DATE ,
 @gender VARCHAR(10) ,
 @userName NVARCHAR(100),
 @password NVARCHAR(50)
AS
BEGIN
	DECLARE @Count INT
	DECLARE @ReturnCode INT

	SELECT @Count = COUNT(userName)
	FROM tblUser
	WHERE userName = @userName

	IF @Count > 0
	BEGIN
		SET @ReturnCode = - 1
	END
	ELSE
	BEGIN
		SET @ReturnCode = 1
		INSERT INTO tblUser(name,email,contact,dateOfBirth,gender,userName,password) 
		VALUES (@name,@email,@contact,@dateOfBirth,@gender,@userName,@password)
	END
		SELECT @ReturnCode AS ReturnValue
END
GO

ALTER PROC spAuthenticateUser
@userName NVARCHAR(100),
@password NVARCHAR(50)
AS
BEGIN
 DECLARE @AccountLocked BIT
 DECLARE @Count INT
 DECLARE @RetryCount INT
 
 SELECT @AccountLocked = isLocked
 FROM tblUser WHERE userName = @userName
  
 --If the account is already locked
 IF(@AccountLocked = 1)
	 BEGIN
	  SELECT 1 AS AccountLocked, 0 AS Authenticated, 0 AS RetryAttempts
	 END
 ELSE
	 BEGIN
	  -- Check if the username and password match
	  SELECT @Count = COUNT(userName) FROM tblUser
	  WHERE userName = @userName and password = @password
  
	  -- If match found
	  IF(@Count = 1)
	  BEGIN
	   -- Reset RetryAttempts 
	   UPDATE tblUser SET RetryAttempts = 0
	   WHERE userName = @userName
       
	   SELECT 0 AS AccountLocked, 1 AS Authenticated, 0 AS RetryAttempts
	  END
  ELSE
	  BEGIN
	   -- If a match is not found
	   SELECT @RetryCount = IsNULL(retryAttempts, 0)
	   FROM tblUser
	   WHERE userName = @userName
   
	   SET @RetryCount = @RetryCount + 1
   
	   IF(@RetryCount <= 3)
	   BEGIN
		-- If re-try attempts are not completed
		UPDATE tblUser SET retryAttempts = @RetryCount
		WHERE userName = @userName
    
		SELECT 0 AS AccountLocked, 0 AS Authenticated, @RetryCount AS RetryAttempts
	   END
   ELSE
	   BEGIN
		-- If re-try attempts are completed
		UPDATE tblUser set retryAttempts = @RetryCount,
		isLocked = 1, lockedDateTime = GETDATE()
		WHERE userName = @userName

		SELECT 1 AS AccountLocked, 0 AS Authenticated, 0 AS RetryAttempts
	   END
  END
 END
END
GO

ALTER PROC spGetAllLocakedUserAccounts
AS
BEGIN
 SELECT userName, email, contact, lockedDateTime,
 DATEDIFF(HOUR, lockedDateTime, GETDATE()) as HoursElapsed
 FROM tblUser
 WHERE isLocked = 1
END
GO

CREATE PROC spEnableUserAccount
@userName NVARCHAR(100)
AS 
BEGIN
	UPDATE tblUser
	SET retryAttempts = 0, isLocked = NULL, lockedDateTime = NULL
	WHERE userName = @userName
END
GO

UPDATE tblUser 
SET retryAttempts = null, isLocked = 0, lockedDateTime = null
WHERE isLocked = 1
and DATEDIFF(HOUR,lockedDateTime,GETDATE()) > 24