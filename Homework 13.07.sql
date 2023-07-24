
-- 1. Найти мин/стоимость товаров для каждой категории

SELECT
	Categories.CategoryName,
	Min(Price) AS min_price
FROM Categories
JOIN Products ON Categories.CategoryID=Products.CategoryID
GROUP BY Products.CategoryID


-- 2. Вывести ТОП-3 стран по количеству доставленных заказов

SELECT
	Customers.Country,
    COUNT (*) total_orders
FROM Orders
JOIN Customers ON Orders.CustomerID=Customers.CustomerID
GROUP BY Country
ORDER BY total_orders DESC
LIMIT 3


-- 3. Вывести названия категорий, в которых более 10 товаров


SELECT
 	Categories.CategoryName,
    COUNT (*) AS total_products
FROM Categories
JOIN Products ON Categories.CategoryID=Products.CategoryID
GROUP BY CategoryName
HAVING total_products > 10

-- 4. Очистить тел/номер поставщикам из USA

UPDATE Suppliers
SET Phone=''
WHERE
Country='USA'

-- 5. Вывести имена и фамилии (и ко-во заказов) менеджеров, у которых ко-во заказов менее 15

SELECT
	Employees.LastName,
    Employees.FirstName,
    COUNT (*) AS total_orders
FROM Orders
JOIN Employees ON Orders.EmployeeID=Employees.EmployeeID
GROUP BY Employees.EmployeeID
HAVING total_orders > 15
