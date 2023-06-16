--------------------------------------------------------------------------------------------
1. Вывести название и стоимость в USD одного самого дорогого проданного товара.

SELECT 
    ProductName,
    Price * 1.06 AS Price_USD

FROM Products
JOIN OrderDetails ON Products.ProductID=OrderDetails.ProductID
ORDER BY Price DESC
LIMIT 1

-------------------------------------------------------------------------------------------
2. Вывести два самых дорогих товара из категории Beverages из USA.

SELECT * 
	FROM Products

   JOIN Categories ON Products.CategoryID=Categories.CategoryID
   JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

   WHERE Categories.CategoryName = 'Beverages'
   AND
   Suppliers.Country = 'USA'

   ORDER BY PRICE DESC
   LIMIT 2

------------------------------------------------------------------------------------------------------
3. Вывести заказы, добавив поле доставлено (или нет), учитывая, что доставлены только 10248 и 10249.

SELECT * ,
CASE 
	WHEN OrderID IN (10248 , 10249) THEN true
    ELSE false
    END AS is_delivered

    FROM Orders

------------------------------------------------------------------------------------------------------
4. Вывести список стран, которые поставляют морепродукты.

SELECT 
    Products.ProductName,
    Categories.CategoryName,
    Suppliers.Country
   
FROM Products

JOIN Categories ON Products.CategoryID=Categories.CategoryID
JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

     WHERE Categories.CategoryName='Seafood'


----------------------------------------------------------------------------------------------------------
5. Очистить поле ContactName у всех клиентов не из China.

UPDATE Customers
SET
	ContactName = ''
WHERE 
	NOT Country = 'China'