-- DDL create tables
CREATE TABLE Product(
    Product_Id VARCHAR2(20) CONSTRAINT PK_product PRIMARY KEY(),
    Product_Name VARCHAR2(20) CONSTRAINT NOT NULL,
    Category VARCHAR2(20) CONSTRAINT NOT NULL,
    Price NUMBER CONSTRAINT CHK_product CHECK (Price > 0),
)

CREATE TABLE Customer(
    Customer_Id VARCHAR2(20) CONSTRAINT PK_product PRIMARY KEY(),
    Customer_Name VARCHAR2(20) CONSTRAINT NOT NULL,
    Customer_Tel NUMBER,
)

CREATE TABLE Orders(
    Quantity NUMBER,
    Total_amount NUMBER,
    OrderDate DATA DEFAULT SYSDATE; 
    CONSTRAINT FK_customer FOREIGN KEY (Customer_Id) REFERENCES Customer(Customer_Id),
    CONSTRAINT FK_product FOREIGN KEY (Product_Id) REFERENCES Product(Product_Id)
)

-- DML insert data into a table

INSERT INTO Product(Product_Id, Product_Name, Category, Price) 
VALUES ("P01","Samsung Galaxy S20","Smartphone",3299),
       ("P02","ASUS Notebook","PC",4599);


INSERT INTO Customer(Customer_Id, Customer_Name, Customer_Tel) 
VALUES ("C01","ALI",71321009),
       ("C02","ASMA",77345823);


INSERT INTO Orders(Customer_Id, Product_Id, OrderDate, Quantity, Total_amount) 
VALUES (SELECT Customer_Id FROM Customer,SELECT Product_Id FROM Product, NULL, 2, 9198),
       (SELECT Customer_Id FROM Customer,SELECT Product_Id FROM Product, 28/05/2020, 1, 3299);      