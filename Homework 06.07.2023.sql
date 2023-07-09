-- 1. Вывести ко-во поставщиков не из UK и не из China

SELECT 
    COUNT (*) AS suppliers_except_UK_China
FROM Suppliers
WHERE 
    NOT Country IN ('UK', 'China')

-- 2. Вывести среднюю/MAX/MIN стоимости и ко-во товаров из категорий 3 и 5

SELECT
	AVG (Price) AS avg_price,
    Max (Price) AS max_price,
    Min (Price) AS min_price,
    Count (*) AS total_products_3_and_5_categories
From Products
WHERE CategoryID IN (3,5)

-- 3. Вывести общую сумму проданных товаров

SELECT 
    SUM (Products.Price*OrderDetails.Quantity) AS total_products_sold
FROM OrderDetails
    JOIN Products ON OrderDetails.ProductID=Products.ProductID

-- 4. Вывести ко-во стран, которые поставляют напитки

SELECT
    COUNT (*) AS total_country
FROM Products
    JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID
    JOIN Categories ON Products.CategoryID=Categories.CategoryID
WHERE Categories.CategoryName='Beverages'

-- 5. Вывести сумму, на которую было отправлено товаров клиентам в USA

SELECT
    SUM (Products.Price*OrderDetails.Quantity) AS total_shipped_to_USA
FROM OrderDetails
    JOIN Customers ON OrderDetails.ProductID=Customers.CustomerID
    JOIN Products ON OrderDetails.ProductID=Products.ProductID
WHERE 
Customers.Country = 'USA'

