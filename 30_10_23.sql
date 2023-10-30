--Task 1

CREATE DATABASE Masters

USE Masters

CREATE TABLE [Roles] (
    [RoleID] INT IDENTITY PRIMARY KEY,
    [Name] VARCHAR(255) NOT NULL
)

CREATE TABLE [Users] (
    [Username] NVARCHAR(255) PRIMARY KEY NOT NULL,
    [Password] VARCHAR(255) NOT NULL,
    [RoleID] INT REFERENCES [Roles]([RoleID])
)

INSERT INTO [Roles] ([Name]) VALUES
    ('Admin'),
    ('Moderator'),
    ('User')

INSERT INTO [Users] ([Username], [Password], [RoleID]) VALUES
    ('user1', 'password1', 1),  
    ('user2', 'password2', 2),  
    ('user3', 'password3', 3)


SELECT Users.Username, Roles.Name [Role]
FROM Users
INNER JOIN [Roles] ON Users.RoleID = Roles.RoleID


--Task 2

CREATE DATABASE Warehouse

USE Warehouse

CREATE TABLE [Categories] (
    [CategoryID] INT IDENTITY PRIMARY KEY,
    [Name] NVARCHAR(255) NOT NULL
)

CREATE TABLE [Products] (
    [ProductID] INT IDENTITY PRIMARY KEY,
    [Name] NVARCHAR(255) NOT NULL,
    [Price] DECIMAL(10, 2) NOT NULL,
    [Cost] DECIMAL(10, 2) NOT NULL,
    [CategoryID] INT REFERENCES [Categories] ([CategoryID])
)

CREATE TABLE [Colors] (
    [ColorID] INT IDENTITY PRIMARY KEY,
    [Name] NVARCHAR(255) NOT NULL
)


CREATE TABLE [ProductColors] (
    [ProductColorID] INT IDENTITY PRIMARY KEY,
    [ProductID] INT REFERENCES [Products] ([ProductID]),
    [ColorID] INT REFERENCES [Products] ([ProductID])
)


INSERT INTO [Categories] [(Name]) VALUES
    ('Electronics'),
    ('Clothing'),
    ('Home Appliances')

INSERT INTO [Colors] ([Name]) VALUES
    ('Red'),
    ('Blue'),
    ('Green')

INSERT INTO [Products] ([Name], [Price], [Cost], [CategoryID]) VALUES
    ('Laptop', 999.99, 799.99, 1),
    ('T-Shirt', 19.99, 9.99, 2),  
    ('Refrigerator', 699.99, 499.99, 3)

INSERT INTO [ProductColors] ([ProductID], [ColorID]) VALUES
    (1, 1), 
    (1, 2),  
    (2, 2),  
    (3, 3)



SELECT p.[Name] [ProductName], c.[Name] [CategoryName], cl.[Name] [ColorName]
FROM [Products] p JOIN [Categories] c ON p.[CategoryID] = c.[CategoryID]
JOIN [ProductColors] pc ON p.[ProductID] = pc.[ProductID]
JOIN [Colors] cl ON pc.[ColorID] = cl.[ColorID]
