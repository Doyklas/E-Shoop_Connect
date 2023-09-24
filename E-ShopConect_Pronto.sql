CREATE DATABASE connect;

USE connect; 
-- DROP DATABASE connect;
CREATE TABLE User(
	userId INT NOT NULL UNIQUE,
	name_user VARCHAR(50),
	phone_user CHAR(11) UNIQUE,
    
	PRIMARY KEY(userId)
);

CREATE TABLE BankCard(
	cardNumber VARCHAR(25) NOT NULL UNIQUE,
	bank VARCHAR(40) NOT NULL,
	expiryDate DATE NOT NULL,
    
	PRIMARY KEY(cardNumber)
);

CREATE TABLE Store(
	sid INT NOT NULL UNIQUE,
	name_store VARCHAR(50),
	startTime TIME,
	customerGrade INT NOT NULL,
	streetAddr VARCHAR(40) NOT NULL,
	city VARCHAR(20) NOT NULL,
	province VARCHAR(40) NOT NULL,
    
	PRIMARY KEY(sid)
);

CREATE TABLE Order_(
	orderNumber INT NOT NULL UNIQUE,
	creationTime TIME NOT NULL,
	paymentStatus VARCHAR(40) NOT NULL,
	totalAmount FLOAT NOT NULL,
    
	PRIMARY KEY(orderNumber)
);

CREATE TABLE Brand(
	brandName VARCHAR(20) NOT NULL UNIQUE,
	PRIMARY KEY (brandName)
);

CREATE TABLE ServicePoint(
	spid INT NOT NULL UNIQUE,
	streetAddr VARCHAR(40),
	city VARCHAR(30),
	province VARCHAR(20),
	startTime VARCHAR(20),
	endTime VARCHAR(20),
    
	PRIMARY KEY(spid)
);

CREATE TABLE Buyer(
	userId INT NOT NULL UNIQUE,
	
	PRIMARY KEY (userId),

	FOREIGN KEY(userId) REFERENCES User(userId)
);

CREATE TABLE Seller(
	userId INT NOT NULL UNIQUE,
	
	PRIMARY KEY (userId),

	FOREIGN KEY(userId) REFERENCES User(userId)
);

CREATE TABLE Credit_Card(
	cardNumber CHAR(16) NOT NULL UNIQUE,
	UserId INT NOT NULL UNIQUE,
	organization_credit VARCHAR(25) NOT NULL,
    
	PRIMARY KEY(cardNumber),
   
	FOREIGN KEY(UserId) REFERENCES User(UserId),
	FOREIGN KEY(organization_credit) REFERENCES Bank_Card(cardNumber)
);

CREATE TABLE Debit_Card(
	cardNumber CHAR(16) NOT NULL UNIQUE,
	userId INT NOT NULL UNIQUE,
	organization_debit VARCHAR(25) NOT NULL,
    
	PRIMARY KEY(cardNumber),
   
	FOREIGN KEY(userId) REFERENCES User(userId),
	FOREIGN KEY(organization_debit) REFERENCES Bank_Card(cardNumber)
);

CREATE TABLE Product(
	pid INT NOT NULL UNIQUE,
	sid INT NOT NULL UNIQUE,
	name_product VARCHAR(20) NOT NULL,
	brand VARCHAR(20) NOT NULL,
	type_product VARCHAR(20) NOT NULL,
	amount INT NOT NULL,
	price DEC(6,2),
	color VARCHAR(20),
	modelNumber INT NOT NULL,
    
	PRIMARY KEY(pid),
	
	FOREIGN KEY(sid) REFERENCES Store(sid),
	FOREIGN KEY(brand) REFERENCES Brand(brandName)
);

CREATE TABLE Order_Item(
	itemId CHAR(10) NOT NULL UNIQUE,
	pid INT NOT NULL UNIQUE,
	price DEC(6, 2) NOT NULL,
	creation_time TIME,
    
	PRIMARY KEY(itemId),
    
	FOREIGN KEY(pid) REFERENCES Product(pid)
);

CREATE TABLE Address(
	addId CHAR(10) NOT NULL UNIQUE,
	userId INT NOT NULL UNIQUE,
	name_add VARCHAR(40) NOT NULL,
	city VARCHAR(30),
	postalCode CHAR(8) NOT NULL,
	streetAddr VARCHAR(40) NOT NULL,
	province VARCHAR(20),
	contact_Phone_Number CHAR(11),
    
	PRIMARY KEY(addId),
    
	FOREIGN KEY(userId) REFERENCES User(userId)
);

CREATE TABLE Comments(
	creationTime DATETIME NOT NULL,
	userId INT NOT NULL UNIQUE,
	pid INT NOT NULL UNIQUE,
	grade DEC(6,2),
	content VARCHAR(500),
    
	PRIMARY KEY(creationTime, UserId, pid),
    
	FOREIGN KEY(userId) REFERENCES Buyer(userId),
   
	FOREIGN KEY(pid) REFERENCES Product(pid)
);

CREATE TABLE Save_to_Shopping_Cart(
	userId INT NOT NULL UNIQUE,
	pid INT NOT NULL UNIQUE,
	add_Time DATETIME,
	quantity INT,
    
	PRIMARY KEY(UserId, pid),
    
	FOREIGN KEY(userId) REFERENCES Buyer(userId),
	FOREIGN KEY(pid) REFERENCES Product(pid)
);

CREATE TABLE Contain(
	orderNumber INT NOT NULL UNIQUE,
	itemId CHAR(10) NOT NULL UNIQUE,
	quantity INT,
    
	PRIMARY KEY(orderNumber, itemId),
   
	FOREIGN KEY(orderNumber) REFERENCES Order_(orderNumber),
	FOREIGN KEY(itemId) REFERENCES Order_Item(itemId)
);

CREATE TABLE Payment(
	orderNumber INT NOT NULL UNIQUE,
	creditcardNumber VARCHAR(25) NOT NULL UNIQUE,
	quantity INT,
    
	PRIMARY KEY(orderNumber, creditcardNumber),
    
	FOREIGN KEY(orderNumber) REFERENCES Order_(orderNumber),
	FOREIGN KEY(creditcardNumber) REFERENCES Bank_Card(cardNumber)
);

CREATE TABLE Deliver_To(
	addId CHAR(10) NOT NULL UNIQUE,
	orderNumber INT NOT NULL UNIQUE,
	TimeDelivered DATE,
    
	PRIMARY KEY(addId, orderNumber),
   
	FOREIGN KEY(addId) REFERENCES Address(addId),
	FOREIGN KEY(orderNumber) REFERENCES Order_(orderNumber)
);

CREATE TABLE Manage(
	UserId INT NOT NULL UNIQUE,
	sid INT NOT NULL UNIQUE,
	SetUpTime DATE,
    
	PRIMARY KEY(UserId, sid),
    
	FOREIGN KEY(UserId) REFERENCES Seller(UserId),
	FOREIGN KEY(sid) REFERENCES Store(sid)
);

CREATE TABLE After_Sales_Service_At(
	brandName VARCHAR(20) NOT NULL UNIQUE,
	spid INT NOT NULL UNIQUE,

   
	PRIMARY KEY(brandName, spid),
   
	FOREIGN KEY(brandName) REFERENCES Brand(brandName),
	FOREIGN KEY(spid) REFERENCES ServicePoint(spid)
);
