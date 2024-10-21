--Perform the following with help of the above database:

--a. Get all the details from the person table including email ID, phone
--number and phone number type

SELECT * FROM [Person].[Person]
SELECT * FROM [Person].[EmailAddress]
SELECT * FROM [Person].[PersonPhone]
SELECT * FROM [Person].[PhoneNumberType]

SELECT  P.*,PE.EmailAddress,pp.PhoneNumber,PNT.PhoneNumberTypeID
FROM [Person].[Person] P
INNER JOIN 
[Person].[EmailAddress] PE
ON
P.BusinessEntityID =PE.BusinessEntityID
INNER JOIN
[Person].[PersonPhone] PP
ON
PE.BusinessEntityID=PP.BusinessEntityID
INNER JOIN
[Person].[PhoneNumberType] PNT
ON
PP.PhoneNumberTypeID=PNT.PhoneNumberTypeID

--b. Get the details of the sales header 
--order made in May 2011

SELECT * FROM [Sales].[SalesOrderHeader]
WHERE YEAR(OrderDate) = 2011 AND MONTH(OrderDate) = 05

--SELECT *
--FROM [Sales].[SalesOrderHeader]
--WHERE OrderDate >= '2011-05-01';


--c. Get the details of the sales details order 
--made in the month of May 2011
SELECT * FROM [Sales].[SalesOrderDetail]
SELECT * FROM [Sales].[SalesOrderHeader]

SELECT *
FROM [Sales].[SalesOrderDetail] SOD
INNER JOIN
[Sales].[SalesOrderHeader] SOH
ON
SOD.SalesOrderID = SOH.SalesOrderID
WHERE
YEAR(SOH.OrderDate) = 2011 AND MONTH(SOH.OrderDate) = 05
ORDER BY SOH.SalesOrderID Desc

--d. Get the total sales made in May 2011
SELECT * FROM [Sales].[SalesOrderDetail]
SELECT * FROM [Sales].[SalesOrderHeader]

select sum(SOD.linetotal) as totalsales
from [Sales].[SalesOrderDetail] SOD
inner join
[Sales].[SalesOrderHeader] SOH
on
SOH.SalesOrderID = SOD.SalesOrderID
where
year(SOH.OrderDate) =  2011 and MONTH(SOH.OrderDate) = 05



--e. Get the total sales made in the year 2011 by month order by
--increasing sales

SELECT * FROM [Sales].[SalesOrderDetail]
SELECT * FROM [Sales].[SalesOrderHeader]

select sum(SOD.linetotal ) as totalsales,month(soh.orderdate) as orderdate
from [Sales].[SalesOrderDetail] SOD
inner join 
[Sales].[SalesOrderHeader] SOH
on
SOD.SalesOrderID=SOH.SalesOrderID
where
Year(soh.OrderDate) = 2011 
group  by month(soh.orderdate)
order by totalsales

--f. Get the details from the person table where your first name start with G.

select * from [Person].[Person] where firstname like 'G%'
