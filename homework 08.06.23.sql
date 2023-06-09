------1. Вывести телефоны всех поставщиков, кроме тех, что из Germany и France.-------

SELECT Phone
FROM Suppliers
WHERE NOT Country IN ('Germany', 'France')

-----2. Для товаров до 10 EUR установить категорию 8 и применить наценку в 20%.------

UPDATE Products
SET 
Price = Price*1.20,
CategoryID=8
WHERE
Price <=10


You have made changes to the database. Rows affected: 14

--------------- 3. Удалить поставщиков из USA и Germany.------------

DELETE FROM Suppliers
WHERE
	Country IN ('USA', 'Germany')


    You have made changes to the database. Rows affected: 7

    
------  4. Добавить два поставщика из Spain с произвольными номерами телефонов.---

INSERT INTO Suppliers (SupplierName, ContactName, Address, City, PostalCode, Country, Phone)
VALUES (NULL, NULL, NULL, NULL, NULL, 'Spain', '0000000'),
	   (NULL, NULL, NULL, NULL, NULL, 'Spain', '1111111')


-------5. Вывести все товары до 20 EUR из категорий 3 и 6 по убыванию цены.------  

SELECT * 
FROM Products
WHERE
CategoryID IN (3,6)
AND 
Price <=20
ORDER BY Price DESC

Number of Records: 10


------6. Вывести три самых дорогих товара до 200 EUR.-------

SELECT * 
FROM Products
WHERE
Price <=200
ORDER BY Price DESC
LIMIT 3
