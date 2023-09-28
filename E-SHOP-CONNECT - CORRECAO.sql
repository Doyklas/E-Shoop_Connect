-- Criação do banco de dados
CREATE DATABASE eshop_connect_a;


-- Ativar o uso do Banco de Dados
USE eshop_connect_a;


-- Tabela users
CREATE TABLE users(
    pk_userid        INT NOT NULL,
    name            VARCHAR(50) NOT NULL,
    phoneNumber        CHAR(12) NOT NULL,
    
    PRIMARY KEY (pk_userid    )
);

 

-- Tabela Buyer 
CREATE TABLE buyer(
    pk_userid        INT NOT NULL,
    
    PRIMARY KEY (pk_userid),
    FOREIGN KEY (pk_userid) REFERENCES users(pk_userid)
);

 

-- Tabela Seller
CREATE TABLE seller(
    pk_userid        INT NOT NULL,
    
    PRIMARY KEY (pk_userid),
    FOREIGN KEY (pk_userid) REFERENCES users(pk_userid)
);

 

-- Tabela Bank Card
CREATE TABLE bankCard(
    pk_cardNumber VARCHAR(25) NOT NULL,
    expiryDate DATE,
    bank VARCHAR(20),
    
    PRIMARY KEY(pk_cardNumber)
);

 

-- Tabela Credit Card
CREATE TABLE creditCard(
    pk_cardNumber        VARCHAR(25) NOT NULL,
    fk_userid            INT NOT NULL,
    organization        VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (pk_cardNumber),
    FOREIGN KEY(pk_cardNumber) REFERENCES bankCard(pk_cardNumber),
    FOREIGN KEY (fk_userid) REFERENCES users(pk_userid)
);

 

-- Tabela Debit Card
CREATE TABLE debitCard(
    pk_cardNumber        VARCHAR(25) NOT NULL,
    fk_userid            INT NOT NULL,
    organization        VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (pk_cardNumber),
    FOREIGN KEY(pk_cardNumber) REFERENCES bankCard(pk_cardNumber),
    FOREIGN KEY (fk_userid) REFERENCES users(pk_userid)
);

 

-- Tabela Store
CREATE TABLE store(
    pk_sid             INT NOT NULL,
    name             VARCHAR(20),
    province         VARCHAR(20),
    city             VARCHAR(20),
    streetaddr         VARCHAR(20),
    customerGrade     INT,
    startDate         DATE,

 

    PRIMARY KEY(pk_sid)
);
-- Tabela Brand
CREATE TABLE brand(
    pk_brandName VARCHAR(20) NOT NULL,
    
    PRIMARY KEY (pk_brandName)
);

 

-- Tabela Product
CREATE TABLE Product(
    pk_pid                 INT NOT NULL,
    fk_sid                 INT NOT NULL,
    fk_brand             VARCHAR(50) NOT NULL,
    name                 VARCHAR(100),
    type                 VARCHAR(50),
    modelNumber         VARCHAR(50),
    color                 VARCHAR(50),
    amount                 INT,
    price                 INT,
    PRIMARY KEY(pk_pid),
    FOREIGN KEY(fk_sid) REFERENCES store(pk_sid),
    FOREIGN KEY(fk_brand) REFERENCES brand(pk_brandName)
);

 

CREATE TABLE orderItem(
    pk_itemid         INT NOT NULL,
    fk_pid             INT NOT NULL,
    price             DECIMAL(10,2),
    creationTime     DATE,
    PRIMARY KEY(pk_itemid),
    FOREIGN KEY(fk_pid) REFERENCES product(pk_pid)
);

 

CREATE TABLE orders(
    pk_orderNumber         INT NOT NULL,
    paymentState         VARCHAR(12),
    creationTime         DATE,
    totalAmount         DECIMAL(10,2),
    PRIMARY KEY (pk_orderNumber)
);

 

CREATE TABLE comments(
    creationTime             TIME NOT NULL,
    fk_userid                 INT NOT NULL,
    fk_pid                     INT NOT NULL,
    grade                     FLOAT,
    content                 VARCHAR(100),
    PRIMARY KEY(creationTime,fk_userid,fk_pid), -- Chave composta
    FOREIGN KEY(fk_userid) REFERENCES users(pk_userid),
    FOREIGN KEY(fk_pid) REFERENCES product(pk_pid)
);

 

CREATE TABLE servicePoint(
    pk_spid         INT NOT NULL,
    streetaddr         VARCHAR(40),
    city             VARCHAR(30),
    province         VARCHAR(20),
    startTime         TIME,
    endTime         TIME,
    PRIMARY KEY(pk_spid)
);

 

-- Tabela Save_to_ShoppingCart
CREATE TABLE Save_to_Shopping_Cart(
    pk_userid             INT NOT NULL,
    pk_pid                 INT NOT NULL,
    addTime             TIME,
    quantity             INT,
    PRIMARY KEY (pk_userid,pk_pid),
    FOREIGN KEY(pk_userid) REFERENCES buyer(pk_userid),
    FOREIGN KEY(pk_pid) REFERENCES product(pk_pid)
);

 

-- Tabela Contain
CREATE TABLE contain(
    pk_orderNumber             INT NOT NULL,
    fk_itemid                 INT NOT NULL,
    quantity                 INT,
    PRIMARY KEY (pk_orderNumber,fk_itemid),
    FOREIGN KEY(pk_orderNumber) REFERENCES orders(pk_orderNumber),
    FOREIGN KEY(fk_itemid) REFERENCES orderItem(pk_itemid)
);

 

-- Tabela Payment
CREATE TABLE payment(
    fk_orderNumber             INT NOT NULL,
    fk_cardNumber             VARCHAR(25) NOT NULL,
    payTime                 DATETIME,
    PRIMARY KEY(fk_orderNumber,fk_cardNumber),
    FOREIGN KEY(fk_orderNumber) REFERENCES orders(pk_orderNumber),
    FOREIGN KEY(fk_cardNumber) REFERENCES bankCard(pk_cardNumber)
);

 

-- Tabela Address
CREATE TABLE Address(
    pk_addrid                 INT NOT NULL,
    fk_userid                 INT NOT NULL,
    name                     VARCHAR(50),
    contactPhoneNumber         VARCHAR(20),
    province                 VARCHAR(100),
    city                     VARCHAR(100),
    streetaddr                 VARCHAR(100),
    postCode                 VARCHAR(12),
    PRIMARY KEY(pk_addrid),
    FOREIGN KEY(fk_userid) REFERENCES users(pk_userid)
);

 

-- Tabela Deliver To
CREATE TABLE deliver_To(
    fk_addrid                 INT NOT NULL,
    fk_orderNumber             INT NOT NULL,
    timeDelivered             DATE,
    PRIMARY KEY(fk_addrid,fk_orderNumber),
    FOREIGN KEY(fk_addrid) REFERENCES address(pk_addrid),
    FOREIGN KEY(fk_orderNumber) REFERENCES orders(pk_orderNumber)
);

 

-- Tabela Manage
CREATE TABLE Manage(
    fk_userid                 INT NOT NULL,
    fk_sid                     INT NOT NULL,
    setUpTime                 DATE,
    PRIMARY KEY(fk_userid,fk_sid),
    FOREIGN KEY(fk_userid) REFERENCES seller(pk_userid),
    FOREIGN KEY(fk_sid) REFERENCES store (pk_sid)
);

 

-- Tabela After Sales Service At
CREATE TABLE After_Sales_Service_At(
    fk_brandName             VARCHAR(20) NOT NULL,
    fk_spid                 INT NOT NULL,
    PRIMARY KEY(fk_brandName, fk_spid),
    FOREIGN KEY(fk_brandName) REFERENCES brand (pk_brandName),
    FOREIGN KEY(fk_spid) REFERENCES servicePoint(pk_spid)
);