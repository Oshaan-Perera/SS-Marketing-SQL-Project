CREATE TABLE Supplier (
Supplier_ID INT NOT NULL,
Supplier_Name VARCHAR (50) NOT NULL,
Email VARCHAR (30) NOT NULL,
Phone_Number VARCHAR (10) NOT NULL,
Address VARCHAR (50) NOT NULL,
Payment_Term VARCHAR (10) NOT NULL,
CONSTRAINT pk_1 PRIMARY KEY (Supplier_ID));

CREATE TABLE Customer (
Customer_ID INT NOT NULL,
First_Name VARCHAR (20) NOT NULL,
Last_Name VARCHAR (30) NOT NULL,
Email VARCHAR (30) NOT NULL,
Address VARCHAR (50) NOT NULL,
Phone_Number VARCHAR (10) NOT NULL,
CONSTRAINT pk_2 PRIMARY KEY (Customer_ID));

CREATE TABLE Employee (
Employee_ID INT NOT NULL,
Department VARCHAR (20) NOT NULL,
Email VARCHAR (30) NOT NULL,
Phone_Number VARCHAR (10) NOT NULL,
First_Name VARCHAR (20) NOT NULL,
Last_Name VARCHAR (30) NOT NULL,
Position VARCHAR (20) NOT NULL,
CONSTRAINT pk_3 PRIMARY KEY (Employee_ID));

CREATE TABLE Delivery (
Delivery_ID INT NOT NULL,
Delivery_Status VARCHAR (15) NOT NULL,
Vehicle_Number VARCHAR (12) NOT NULL,
Delivery_Date DATE NOT NULL,
Number_of_Packages INT NOT NULL,
CONSTRAINT pk_4 PRIMARY KEY (Delivery_ID));

CREATE TABLE "Order" (
Order_ID INT NOT NULL,
Order_Priority VARCHAR (10) NOT NULL,
Order_Date DATE NOT NULL,
Payment_Status VARCHAR (10) NOT NULL,
Delivery_ID INT,
Customer_ID INT,
Employee_ID INT,
CONSTRAINT pk_5 PRIMARY KEY (Order_ID),
CONSTRAINT fk_1 FOREIGN KEY (Delivery_ID) REFERENCES Delivery (Delivery_ID),
CONSTRAINT fk_2 FOREIGN KEY (Customer_ID) REFERENCES Customer (Customer_ID),
CONSTRAINT fk_3 FOREIGN KEY (Employee_ID) REFERENCES Employee (Employee_ID));

CREATE TABLE Product (
Product_ID INT NOT NULL,
Product_Name VARCHAR (20) NOT NULL,
Category VARCHAR (20) NOT NULL,
Unit_Price DECIMAL (4,2) NOT NULL,
Stock_Level INT NOT NULL,
Supplier_ID INT,
CONSTRAINT pk_6 PRIMARY KEY (Product_ID),
CONSTRAINT fk_4 FOREIGN KEY (Supplier_ID) REFERENCES Supplier (Supplier_ID));

CREATE TABLE Product_Order (
Product_ID INT,
Order_ID INT,
Total_Amount DECIMAL (10,2) NOT NULL,
Quantity INT NOT NULL,
CONSTRAINT pk_7 PRIMARY KEY (Product_ID, Order_ID),
CONSTRAINT fk_5 FOREIGN KEY (Product_ID) REFERENCES Product (Product_ID),
CONSTRAINT fk_6 FOREIGN KEY (Order_ID) REFERENCES "Order" (Order_ID));


INSERT INTO Supplier (Supplier_ID, Supplier_Name, Email, Phone_Number, Address, Payment_Term)
VALUES 
(567, 'Lanka Brass Suppliers', 'lanka@brass.lk', '0111234567', '43 Singha Mawatha, Colombo 05', 'Net 30'),
(679, 'Metal Works Pvt Ltd', 'sales@metalworks.lk', '0123344556', '262/B Low Level Road, Wellampitiya', 'Net 15'),
(545, 'Royal Alloys', 'info@royalloys.lk', '0113335577', '55/1/A Flower Road, Matara', 'Net 75'), 
(317, 'BrassCo', 'contact@brassco.lk', '0116196191', 'Main Street, Colombo 03', 'Net 30'),
(515, 'Precision Metals', 'sales@precision.lk', '0113344556', 'Badulla Road, Kurunegala', 'Net 20'),
(628, 'Alloy Traders', 'support@alloys.lk', '0117766554', '37 Suhada Mawatha, Negombo', 'Net 7'),
(425, 'Vishva Brass', 'order@vishva.lk', '0112233445', '3rd Floor, Unity Building, Galle', 'Net 30'),
(388, 'Midland Suppliers', 'mid@sup.lk', '0114455667', '1st Lane, Gampaha', 'Net 45'),
(931, 'Central Metals', 'info@centralmetals.lk', '0115566778', '63 Alwis Place, Colombo 05', 'Net 20'),
(105, 'United Brass Traders', 'contact@ubt.lk', '0119988998', '67/2 Lesly Avenue, Colombo 07', 'Net 40');


INSERT INTO Customer (Customer_ID, First_Name, Last_Name, Email, Address, Phone_Number)
VALUES 
(4571, 'Jagath', 'Hardware', 'jagathhd@gmail.com', '43 Main Junction, Gampaha', '0712312323'),
(8314, 'Nimesha', 'Fernando', 'nimesha@gmail.com', 'Dikwela Road, Colombo 06', '0756987566'),
(8759, 'Dilma', 'Traders', 'jane@yahoo.com', '24/1 Cemetery Road, Negombo', '0736999889'),
(6577, 'Ruwan', 'Perera', 'ruwan@live.com', 'Lake Street, Kandy', '0756789012'),
(1022, 'Amal', 'Silva', 'amal@ss.lk', '687/2A Janadipathi Mawatha, Matara', '0745678901'),
(6147, 'Kasun', 'Gunasekara', 'kasun@mail.com', 'Fort Road, Jaffna', '0766565978'),
(8965, 'Anjali', 'Wickramasinghe', 'anjali@abc.lk', '877 Square Road, Colombo 06', '0797859632'),
(2369, 'Chaminda', 'Jayasinghe', 'chaminda@ocean.lk', 'Sports Complex, Galle', '0786878698'),
(6523, 'NC', 'Hardware', 'ncparts@client.lk', '38 Marine Drive, Kandy', '0792678941'),
(7425, 'Shehani', 'Rajapaksha', 'shehani@site.lk', 'Temple Road, Polonnaruwa', '0701234567'),
(3002, 'Nadeesha', 'Senanayake', 'nadeesha@live.com', '68/5C/56 Hill Street Colombo 09', '0712345678'),
(2025, 'Dineth', 'Mendis', 'dineth@outlook.com', 'City Hall, Kurunegala', '0723456789'),
(8751, 'Saman', 'Fernando', 'saman@ss.lk', '87 Galle Road, Kalutara', '0734567890');


INSERT INTO Employee (Employee_ID, Department, Email, Phone_Number, First_Name, Last_Name, Position)
VALUES
(52210180, 'Operations', 'manoj@ss.lk', '0711111000', 'Manoj', 'Perera', 'Operations Associate'),
(26967235, 'Logistics', 'sasha@ss.lk', '0722222000', 'Sasha', 'Fernando', 'Logistics Manager'),
(21368742, 'Accounts', 'nuwan@ss.lk', '0733333000', 'Nuwan', 'Silva', 'Accountant'),
(75243214, 'Operations', 'kamal@ss.lk', '0744444000', 'Kamal', 'Jayasekara', 'Operations Executive'),
(56879871, 'Sales', 'ishara@ss.lk', '0755555000', 'Ishara', 'Gunaratne', 'Sales Manager'),
(42310981, 'Quality', 'hasini@ss.lk', '0766666000', 'Hasini', 'Wickramasinghe', 'QA Officer'),
(68711002, 'Operations', 'dilan@ss.lk', '0777777000', 'Dilan', 'Bandara', 'Operations Manager'),
(39256711, 'Logistics', 'sajith@ss.lk', '0788888000', 'Sajith', 'Perera', 'Driver'),
(23134362, 'Operations', 'nadeesha@ss.lk', '0799999000', 'Nadeesha', 'Senanayake', 'Operations Associate'),
(23271678, 'Operations', 'tharindu@ss.lk', '0700000000', 'Tharindu', 'Lakmal', 'Operations Associate'),
(23356456, 'Logistics', 'sachin@ss.lk', '0711112222', 'Sachin', 'Dissanayake', 'Driver'),
(46998151, 'Operations', 'isuru@ss.lk', '0722223333', 'Isuru', 'Rathnayake', 'Operations Intern'),
(13679314, 'Quality', 'nirmala@ss.lk', '0733334444', 'Nirmala', 'De Silva', 'QA Officer');


INSERT INTO Delivery (Delivery_ID, Delivery_Status, Vehicle_Number, Delivery_Date, Number_of_Packages)
VALUES
(89254, 'Pending', 'WP-1122', '2024-04-01', 3),
(25798, 'Completed', 'CP-2233', '2024-04-02', 4),
(33677, 'Dispatched', 'NW-3344', '2024-04-03', 2),
(49836, 'Pending', 'SP-4455', '2024-04-04', 6),
(50310, 'Pending', 'SP-4455', '2024-04-05', 5),
(25497, 'Completed', 'WP-1122', '2024-04-06', 7),
(72397, 'Dispatched', 'CP-2233', '2024-04-07', 1),
(82365, 'Pending', 'NC-8899', '2024-04-08', 8),
(78614, 'Completed', 'WP-1122', '2024-04-09', 2),
(10123, 'Dispatched', 'SP-4455', '2024-04-10', 4),
(11654, 'Pending', 'NC-8899', '2024-04-11', 3),
(12136, 'Completed', 'WP-1122', '2024-04-12', 6);


INSERT INTO "Order" (Order_ID, Order_Priority, Order_Date, Payment_Status, Delivery_ID, Customer_ID, Employee_ID)
VALUES
(121212, 'High', '2024-04-01', 'Paid', 72397, 4571, 23134362),
(232323, 'Medium', '2024-04-02', 'Pending', 82365, 2369, 46998151),
(343434, 'Low', '2024-04-03', 'Paid', 33677, 3002, 46998151),
(454545, 'High', '2024-04-04', 'Pending', 25798, 4571, 23134362),
(565656, 'Low', '2024-04-05', 'Paid', 82365, 6523, 23271678),
(676767, 'Medium', '2024-04-06', 'Pending', 49836, 6147, 23134362),
(787878, 'High', '2024-04-07', 'Paid', 82365, 7425, 52210180),
(898989, 'Low', '2024-04-08', 'Pending', 50310, 8314, 23271678),
(919191, 'Medium', '2024-04-09', 'Paid', 25497, 8965, 23134362),
(101010, 'High', '2024-04-10', 'Pending', 78614, 1022, 13679314),
(119119, 'Medium', '2024-04-10', 'Paid', 10123, 8314, 42310981),
(122221, 'High', '2024-04-10', 'Pending', 10123, 4571, 23134362),
(131313, 'Low', '2024-04-12', 'Paid', 12136, 2369, 52210180),
(141414, 'High', '2024-04-10', 'Pending', 10123, 2025, 13679314),
(151515, 'Medium', '2024-04-12', 'Paid', 12136, 1022, 23134362);


INSERT INTO Product (Product_ID, Product_Name, Category, Unit_Price, Stock_Level, Supplier_ID)
VALUES
(11, 'Brass Screw 1in', 'Screws', 15.50, 500, 105),
(23, 'Brass Nut M6', 'Nuts', 8.75, 300, 388),
(37, 'Brass Washer', 'Washers', 5.00, 1000, 317),
(48, 'Threaded Bar 12in', 'Bars', 25.00, 200, 425),
(55, 'Hex Bolt', 'Bolts', 18.90, 450, 567),
(36, 'Anchor Bolt', 'Bolts', 22.00, 250, 628),
(67, 'Brass Screw 2in', 'Screws', 17.00, 320, 679),
(85, 'Brass Nut M8', 'Nuts', 9.50, 700, 931),
(91, 'Split Washer', 'Washers', 6.20, 900, 931),
(64, 'Brass Rod 1ft', 'Bars', 30.00, 150, 105),
(17, 'Brass Bolt 1in', 'Bolts', 12.50, 420, 628),
(27, 'Threaded Rod 6in', 'Bars', 20.00, 180, 317),
(93, 'Flat Washer Large', 'Washers', 7.80, 850, 515),
(44, 'Nut Cap', 'Nuts', 6.50, 200, 628),
(15, 'Hex Screw', 'Screws', 16.20, 480, 545);


INSERT INTO Product_Order (Product_ID, Order_ID, Total_Amount, Quantity)
VALUES 
(11, 121212, 1550.00, 100),
(23, 232323, 875.00, 100),
(37, 151515, 500.00, 100),
(48, 141414, 1250.00, 50),
(55, 131313, 1890.00, 100),
(36, 454545, 1100.00, 50),
(67, 565656, 1700.00, 100),
(85, 787878, 950.00, 100),
(91, 676767, 620.00, 100),
(64, 898989, 3000.00, 100),
(17, 919191, 1250.00, 50),
(27, 101010, 600.00, 30),
(93, 122221, 1400.00, 100);



SELECT First_Name, Last_Name, Email 
FROM Customer;

SELECT First_Name +' '+ Last_Name AS Employee_Name, Department, Position 
FROM Employee; 

SELECT * FROM Supplier 
WHERE Address LIKE '%Colombo%';

SELECT DISTINCT Department 
FROM Employee;

SELECT Product_Name, Unit_Price 
FROM Product
WHERE Unit_Price >= 20;

SELECT * FROM "Order"
WHERE Employee_ID = 23134362

SELECT Product_ID, Product_Name
FROM Product 
WHERE Category IN ('Nuts', 'Bolts');

SELECT *, Unit_Price * 0.8 AS Discounted_Price 
FROM Product;

SELECT Department, COUNT (*) 
FROM Employee
GROUP BY Department;

SELECT P.Product_Name, S.Supplier_Name
FROM Product P, Supplier S 
WHERE P.Supplier_ID = S.Supplier_ID
AND P.Supplier_ID = 628;