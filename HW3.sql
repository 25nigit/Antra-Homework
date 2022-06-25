/*question 1*/
CREATE VIEW [view_product_order_You]		
AS
SELECT p.ProductName, SUM(od.Quantity) AS TotalQuality
FROM Products p JOIN [Order Details] od on p.ProductID = od.ProductID
GROUP BY p.ProductName

DROP VIEW [view_product_order_You]	

SELECT *
FROM [view_product_order_You]	


/*question 2*/
CREATE PROC sp_product_order_quantity_You
@pID int,
@totalQuantity int out
AS
BEGIN
SELECT @totalQuantity = SUM(Quantity) FROM [Order Details] WHERE ProductID = @pID
END



/*
--some execution of it

DROP PROC sp_product_order_quantity_You

BEGIN
DECLARE @en int
exec sp_product_order_quantity_You 42, @en out
print @en
END

SELECT *
FROM [Order Details]

*/

/*question 3*/
CREATE PROC sp_product_order_city_You
@pname varchar(20),
@cities varchar(20) out,
@quantity int out
AS
BEGIN
SELECT TOP 5 @cities = o.ShipCity, @quantity = od.Quantity
FROM Orders o JOIN [Order Details] od ON o.OrderID = od.OrderID JOIN Products p ON p.ProductID = od.ProductID
GROUP BY o.ShipCity,od.Quantity
ORDER BY COUNT(o.OrderDate)
END

/*
DROP PROC sp_product_order_quantity_You

BEGIN
DECLARE @en varchar(20), @quan int
exec sp_product_order_city_You 'Hanari Carnes', @quan out
print @en + ' ' + @quan
END

SELECT *
FROM Orders
*/

/*question 4*/

CREATE TABLE People 
(
ID INT,
Namee varchar(20),
City INT
)

CREATE TABLE City
(
ID INT,
CityName Varchar(20)

)

INSERT INTO People VALUES
(1,'Aaron Rodgers', 2)

INSERT INTO People VALUES
(2,'Russell Wilson', 1)

INSERT INTO People VALUES
(3,'Jody Nelson', 2)


INSERT INTO City VALUES
(1,'Seattle')
INSERT INTO City VALUES
(2,'Green Bay')


-- SELECT * FROM People

--SELECT * FROM CITY

--DELETE FROM ##CITY WHERE CityName  = 'Madison'

INSERT INTO City VALUES
(3,'Madison')

UPDATE PEOPLE
SET 
City = '3'
WHERE City = '1'

CREATE VIEW Packer
AS
SELECT ID,Namee
FROM People WHERE City = 2

--SELECT * FROM Packer

DROP TABLE People, City
DROP VIEW Packer


/*question 5*/
--DROP PROC sp_birthday_employees

CREATE PROC sp_birthday_employees
@tableName nvarchar(30)
AS
BEGIN
        
DECLARE @ipt NVARCHAR(MAX)
    Set @ipt = 'CREATE TABLE ' +@tableName+
    '(
    Name nvarchar(30)  NOT NULL,
    BirthDay [int] NOT NULL,

	)'
EXEC(@ipt)
END

BEGIN
EXEC sp_birthday_employees @tableName = birthday_employees
Print @tableName

SELECT *
FROM birthday_employees 




/*question 6

select * from tableA
minus
select * from tableB

if it returns no rows then data of these two tables are exactly the same

*/
