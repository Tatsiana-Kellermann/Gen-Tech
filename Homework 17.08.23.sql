
-------------------- 2.Вывести три самых продаваемых товара---------------

SELECT
	Products.ProductName
FROM Products
JOIN OrderDetails USING (ProductID)
GROUP BY OrderDetails.ProductID
ORDER BY ProductID DESC
LIMIT 3

----------------- 3. Очистить почтовый индекс у всех клиентов не из China---------------------
UPDATE Customers
SET
	PostalCode = ''
WHERE 
	NOT Country = 'China'
    
    
    ---------4.Вывести данные о поставщике, который находится на четвертом месте по ко-ву поставленных товаров-----------------
    
    SELECT  Suppliers.SupplierName,
		COUNT(*) AS delivered_goods
FROM Suppliers

JOIN Products USING (SupplierID)
GROUP BY Products.SupplierID
ORDER BY delivered_goods DESC
LIMIT 1 OFFSET 3
    
   ---------------5.Вывести среднюю стоимость заказа---------------
   
   SELECT
	OrderDetails.OrderID,
	AVG (Products.Price) AS avg_price_by_orderID
   
FROM Products

JOIN OrderDetails USING (ProductID)
GROUP BY OrderID
   
   -----------------6.Вывести заказы со скидочной ценой (скидка 15%)---------------
   
   SELECT
	OrderDetails.OrderID,
    SUM (Products.Price) AS sum_price_by_orderID,
    SUM (Products.Price) * 0.85 AS Discount_Price 
	
FROM Products

JOIN OrderDetails USING (ProductID)
GROUP BY OrderID
   