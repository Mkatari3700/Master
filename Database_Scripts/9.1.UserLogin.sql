﻿CREATE TABLE [dbo].[UserLogin]
(
	[UserID] INT NOT NULL PRIMARY KEY IDENTITY, 
	[UserName] NVARCHAR(MAX) NOT NULL, 
	[Password] NVARCHAR(MAX) NOT NULL, 
    [Email] NVARCHAR(MAX) NULL, 
    [DOB] DATETIME NULL, 
    [PhoneNo] BIGINT NULL, 
    [CreatedDate] DATETIME NOT NULL, 
    [StatusFlag] BIT NULL DEFAULT 1
)

---
