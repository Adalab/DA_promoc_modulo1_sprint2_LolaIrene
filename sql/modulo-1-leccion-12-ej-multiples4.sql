#Consultas múltiples tablas a4
#1. Extraed información de los productos "Beverages"
#información necesaria para identificar un tipo de producto. En concreto, productos con categoría "Beverages". 
#Devuelve el ID del producto, el nombre del producto y su ID de categoría.

SELECT products.product_id, products.product_name, categories.category_id, categories.category_name
FROM products 
LEFT JOIN categories 
ON products.category_id = categories.category_id
WHERE categories.category_name = 'Beverages';

#Ahora con subconsulta
SELECT products.product_id, products.product_name, products.category_id
FROM products 
WHERE products.category_id IN (SELECT categories.category_id
								FROM categories
                                WHERE categories.category_name = 'Beverages');

#2. Extraed la lista de países donde viven los clientes, pero no hay ningún proveedor ubicado en ese país

SELECT DISTINCT country
FROM customers
WHERE country NOT IN (SELECT country
					 FROM suppliers);
 
#3 Extraer los clientes que compraron mas de 20 articulos "Grandma's Boysenberry Spread"
# Extraed el OrderId y el nombre del cliente que pidieron más de 20 artículos 
# del producto "Grandma's Boysenberry Spread" (ProductID 6) en un solo pedido.

ORDERS, ORDER_ID, CUTOMER_ID , CUSTOMERS (CUSTOMERS_ID) - PRODUCTS PRODUCTS_ID, PRODUCT_NAME


SELECT order_id, customer_id
FROM orders
WHERE xxxx (SELECT products
 
 SELECT order_id, customer_id
 from orders
 WHERE customer_id IN (SELECT order_id
					FROM order_details
                    WHERE product_id = 6) 
                    
                    IN (SELECT count(product_id) 
										from products
                                        WHERE product_name = "Grandma's Boysenberry Spread"));
 
 #el numero de pedidos en cada order > 20
