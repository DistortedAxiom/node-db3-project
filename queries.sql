-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.

/* SELECT c.CategoryName,
    p.ProductName
FROM Product as p
JOIN CATEGORY as c
    on p.CategoryId = c.Id

*/

SELECT category.CategoryName , product.ProductName
FROM Category
JOIN PRODUCT on product.CategoryId = category.id


-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.

SELECT [Order].Id, [Order].OrderDate, Shipper.CompanyName
FROM [Order]
JOIN Shipper on Shipper.Id = [Order].ShipVia
WHERE [Order].OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.

SELECT [OrderDetail].OrderId, [OrderDetail].ProductId, [OrderDetail].Quantity, [Product].ProductName
FROM [OrderDetail]
JOIN Product on Product.Id = [OrderDetail].ProductId
WHERE [OrderDetail].OrderId = '10251'

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.

SELECT [Order].Id as [Order Id], [Customer].CompanyName, [Employee].LastName as [Employee LastName]
FROM [Order]
JOIN [Customer] on Customer.Id = [Order].CustomerId
JOIN [Employee] on Employee.Id = [Order].EmployeeId
