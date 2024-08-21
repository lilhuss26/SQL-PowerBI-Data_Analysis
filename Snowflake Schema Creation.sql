---------Create Fact Table-------------
CREATE TABLE SalesFact (
    OrderID INT PRIMARY KEY,
    OrderDate DATE,
    OrderNumber INT,
    CustomerID INT,
    ProductID INT,
    UnitPrice DECIMAL(10,2),
    Quantity INT,
    TotalAmount DECIMAL(10,2)
)
------Insert It's Values--------
----From Orders----
insert into SalesFact(OrderID, OrderDate, OrderNumber, CustomerID)
    o.Id, 
    o.OrderDate, 
    o.OrderNumber, 
    o.CustomerId
FROM [Order] o;

----From Product----
UPDATE SalesFact
SET ProductID = oi.ProductId,
    UnitPrice = oi.UnitPrice,
    Quantity = oi.Quantity,
    TotalAmount = oi.UnitPrice * oi.Quantity
FROM OrderItem oi
WHERE SalesFact.OrderID = oi.OrderId;

----From Supplier----
ALTER TABLE SalesFact
ADD SupplierID int;

UPDATE SalesFact
SET SupplierID = p.SupplierId
from Product p
where p.Id = SalesFact.ProductID

----Delete Supllier from Fact table 'cause it's relation will be with Product---
ALTER TABLE SalesFact DROP COLUMN SupplierID;

----Create DateDim-----
CREATE TABLE DateDim (
    FullDate DATE PRIMARY KEY,
    Year INT,
    Quarter INT,
    Month INT,
    DayOfMonth INT,
    DayOfWeek INT,
    DayName VARCHAR(20)
)
-----ADD Date Dim Values-----
INSERT INTO DateDim (FullDate, Year, Quarter, Month, DayOfMonth, DayOfWeek, DayName)
SELECT DISTINCT
    CONVERT(DATE, OrderDate), 
    YEAR(OrderDate),
    DATEPART(quarter, OrderDate),
    MONTH(OrderDate),
    DAY(OrderDate),
    DATEPART(WEEKDAY, OrderDate), 
    DATENAME(WEEKDAY, OrderDate)
FROM [Order];

---Drop Unused Tabels---
drop table [Order]
drop table OrderItem

----Rename Tabels----
exec sp_rename 'Customer', 'CustmerDim'
exec sp_rename 'Product', 'ProductDim'
exec sp_rename 'Supplier', 'SupplierDim'






