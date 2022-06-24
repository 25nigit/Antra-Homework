
/*first two questions are using advanturework*/
/*question 1*/
SELECT c.Name AS Country,s.Name AS Province
FROM Person.CountryRegion c JOIN Person.StateProvince s ON
c.CountryRegionCode = s.CountryRegionCode

/*question 2*/
SELECT c.Name AS Country,s.Name AS Province
FROM Person.CountryRegion c JOIN Person.StateProvince s ON
c.CountryRegionCode = s.CountryRegionCode
WHERE c.Name in('Germany','Canada')


/*question 3*/

SElECT p.ProductName
FROM Orders o JOIN [Order Details] od ON o.OrderID = od.OrderID JOIN Products p ON od.ProductID = p.ProductID 
--WHERE YEAR(GETDATE())- YEAR(o.OrderDate) <= 25 
WHERE DATEDIFF(year,GETDATE(),o.OrderDate) <= 25

/*
SELECT *
FROM Orders
WHERE YEAR(OrderDate) = 1998

SElECT*
FROM Products

SElECT*
FROM [Order Details]
*/

/*question 4*/
SElECT TOP 5 o.ShipPostalCode,COUNT(o.ShipPostalCode)
FROM Orders o JOIN [Order Details] od ON o.OrderID = od.OrderID JOIN Products p ON od.ProductID = p.ProductID 
-- WHERE YEAR(GETDATE())- YEAR(o.OrderDate) <= 25 
WHERE DATEDIFF(year,GETDATE(),o.OrderDate) <= 25
GROUP BY o.ShipPostalCode
Order BY COUNT(o.ShipPostalCode) DESC

/*QUESTION 5*/
SELECT City, COUNT(City) AS NUM
FROM Customers
GROUP BY City

/*question 6*/
SELECT City, COUNT(City)
FROM Customers
GROUP BY City
HAVING COUNT(CITY) > 2

/*question 7*/
SELECT c.ContactName, SUM(od.Quantity) AS number
FROM Customers c JOIN Orders o on c.CustomerID = o.CustomerID JOIN [Order Details] od ON od.OrderID = o.OrderID
GROUP BY c.ContactName

SELECT *
FROM Customers

SELECT *
FROM Orders

SELECT *
FROM Shippers

SELECT *
FROM [Order Details]

/*question 8*/
SELECT c.CustomerID
FROM Customers c JOIN Orders o on c.CustomerID = o.CustomerID JOIN [Order Details] od ON od.OrderID = o.OrderID
GROUP BY c.CustomerID
HAVING SUM(od.Quantity) > 100

/*question 9*/

SELECT s.CompanyName, sp.CompanyName
FROM Suppliers s CROSS JOIN Shippers sp


/*question 10*/
SElECT o.OrderDate, p.ProductName, od.Quantity
FROM Orders o JOIN [Order Details] od ON o.OrderID = od.OrderID JOIN Products p ON od.ProductID = p.ProductID 
ORDER BY p.ProductName

/*question 11*/
SELECT DISTINCT 
t1.FirstName + ' ' + t1.LastName AS [employee 1], t2.FirstName + ' ' + t2.LastName AS [employee 2]
FROM Employees t1 
INNER JOIN Employees t2 ON t2.Title = t1.Title 
WHERE t2.EmployeeID != t1.EmployeeID


/*question 12*/
select m.EmployeeID
from Employees e INNER JOIN Employees m ON e.ReportsTo = m.EmployeeID
GROUP BY m.EmployeeID
ORDER BY COUNT(e.ReportsTo) DESC

/* question 13*/
SELECT *
FROM Customers

SELECT *
FROM Suppliers


SELECT City, ContactName, CAST(CustomerID AS nvarchar(10)) AS Type
FROM Customers
UNION ALL
SELECT City, ContactName, CAST(SupplierID AS nvarchar(10)) AS Type
FROM Suppliers
ORDER BY Type

/*question 14*/
SELECT City
FROM Customers
UNION
SELECT City
FROM Employees
ORDER BY CITY


/*question 15 a*/
SELECT City
FROM Customers
UNION
SELECT City
FROM Employees
WHERE City Not in(
SELECT City
FROM Employees
)
ORDER BY CITY

/*question 15 b*/

/*question 16 */
SELECT p.ProductName, Sum(od.Quantity) AS [Total Quantity]
FROM Products p JOIN [Order Details] od on p.ProductID = od.ProductID JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY p.ProductName

/*question 17*/
SELECT City
FROM Customers 
GROUP BY City
HAVING COUNT(contactName) >= 2

/*not working*/
SELECT City
FROM Customers
WHERE City in (
SELECT Count(ContactName)
FROM Customers
GROUP BY City
HAVING Count(ContactName) > =2
)


/*question 18*/
SELECT c.City, p.productID, COUNT(p.productID) AS [Products Kind]
FROM Customers c CROSS JOIN Products p
GROUP BY c.City, p.productID
HAVING COUNT(p.productID) > 2

/*question 19*/
SElECT TOP 5 p.ProductName, SUM(od.Quantity), AVG(od.Quantity),(
SELECT TOP 1  c.City
FROM Customers c CROSS JOIN Products p
GROUP BY c.City, p.productID
ORDER BY COUNT(p.productID)
) AS [Most Ordered City]
FROM Orders o JOIN [Order Details] od ON o.OrderID = od.OrderID JOIN Products p ON od.ProductID = p.ProductID 
GROUP BY p.ProductName
ORDER BY SUM(od.Quantity) DESC


/*question 20*/
SELECT e.City, SUM(od.Quantity) AS Quantity, COUNT(o.OrderID) AS Orders
FROM Employees e JOIN Orders o on e.EmployeeId = o.EmployeeID JOIN [Order Details] od ON o.OrderID = od.OrderID
GROUP BY e.City

/*question 21

//DO THIS 
DELETE FROM [SampleDB].[dbo].[Employee]
    WHERE ID NOT IN
    (
        SELECT MAX(ID) AS MaxRecordID
        FROM [SampleDB].[dbo].[Employee]
        GROUP BY [FirstName], 
                 [LastName], 
                 [Country]
    );

*/


