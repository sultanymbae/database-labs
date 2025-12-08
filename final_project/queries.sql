select * from clients;
select * from branches;
select * from cars;
select * from feedback;
select * from orders;
select * from prices;
select * from services;
select * from workers;
select * from workerbranches;

--Basic
--all cars of one client
SELECT * FROM Cars WHERE ClientID = 5;
--all services
SELECT Name, Description FROM Services;
--workers (washers)
SELECT * FROM workers
WHERE position = 'Washer';
--only name and email of clients
SELECT name, email
FROM clients;

--Advanced 
--All orders with information about the client, car and employee
SELECT 
    o.ID,
    o.Date,
    c.Name AS Client,
    car.Brand,
    w.Name AS Worker,
    b.Address AS Branch,
    s.Name AS Service
FROM Orders o
JOIN Cars car ON car.ID = o.CarID
JOIN Clients c ON c.ID = car.ClientID
JOIN WorkerBranches wb ON wb.ID = o.WorkerBranchID
JOIN Workers w ON w.ID = wb.WorkerID
JOIN Branches b ON b.ID = wb.BranchID
JOIN Services s ON s.ID = o.ServiceID;

--Branch income
SELECT
    b.Address,
    SUM(CAST(o.Sum AS INT)) AS Income
FROM Orders o
JOIN WorkerBranches wb ON wb.ID = o.WorkerBranchID
JOIN Branches b ON b.ID = wb.BranchID
GROUP BY b.Address
ORDER BY Income DESC;

--Popular services
SELECT 
    s.Name,
    COUNT(o.ID) AS TotalOrders
FROM Orders o
JOIN Services s ON s.ID = o.ServiceID
GROUP BY s.Name
ORDER BY TotalOrders DESC;

--Clients with number of cars
SELECT 
    c.Name,
    COUNT(car.ID) AS CarCount
FROM Clients c
LEFT JOIN Cars car ON car.ClientID = c.ID
GROUP BY c.Name
ORDER BY CarCount DESC;

