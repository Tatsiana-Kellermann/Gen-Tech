-----1. Вывести информацию о трех самых дорогих товарах не из China (проекция: названиетовара, ценатоваравusd, названиепоставщика, странапоставщика)-------

SELECT 
	Products.ProductName,
    Products.Price * 1.06 AS Price_usd,
    Suppliers.Country,
    Suppliers.SupplierName
FROM Products

JOIN Suppliers ON Products.SupplierID=Suppliers.SupplierID

WHERE NOT Suppliers.Country = 'China'
ORDER BY Price DESC
LIMIT 3


----2. Вывести страны клиентов и поставщиков (за исключением USA)-----------------

SELECT Country FROM Customers
WHERE NOT Country = 'USA'

UNION

SELECT Country FROM Suppliers
WHERE NOT Country = 'USA'

------------3. Вывести названия проданных товаров------------------

SELECT 
	Products.ProductName
FROM Products
LEFT JOIN OrderDetails ON Products.ProductID = OrderDetails.ProductID
WHERE OrderDetails.ProductID IS NOT NULL

---4. В рамках БД "стриминг-платформа":С помощью DDL создайте таблицу "комментарии юзеров к видео"--

CREATE TABLE comments (
    comment_id int,
    created_at timestamp,
    author_id int,
    stream_id int,
    is_blocked bool
);


----------5. Вывести три последних комментария, включая имена авторов и названия видео----

SELECT
	comments.created_at AS comment_created_at,
    users.username,
    streams.title
FROM users
JOIN comments ON users.user_id=comments.author_id
JOIN streams ON users.user_id=streams.author_id
ORDER BY comments.created_at DESC
LIMIT 3



