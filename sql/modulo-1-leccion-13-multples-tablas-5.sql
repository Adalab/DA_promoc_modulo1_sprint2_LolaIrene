#1.Extraed los pedidos con el máximo "order_date" para cada empleado.

use northwind;
SELECT order_id, customer_id,employee_id,order_date,required_date
FROM orders AS e1  
WHERE e1.order_date = (
    SELECT max(e2.order_date)  
    FROM orders AS e2  
    WHERE e2.employee_id = e1.employee_id);

#2.Extraed el precio unitario máximo (unit_price) de cada producto vendido.

SELECT  product_id, max(unit_price)
FROM order_details AS e1
WHERE e1.unit_price = (
    SELECT max(e2.unit_price)  
    FROM order_details AS e2  
    WHERE e2.product_id = e1.product_id)
    group by product_id;

# 3.Ciudades que empiezan con "A" o "B". No sale, hacer con regex

SELECT city,company_name,contact_name
FROM customers 
WHERE city REGEXP '(^A|^B)'
ORDER BY city;

# 4.Número de pedidos que han hecho en las ciudades que empiezan con L.

SELECT customers.company_name AS empresa, customers.city AS ciudad, customers.contact_name AS persona_contacto, COUNT(orders.order_id) AS numero_pedidos
FROM orders
INNER JOIN customers
USING (customer_id)
WHERE city REGEXP '(^L)'
GROUP BY company_name;


 #leccion 13 el 5
# 5.Todos los clientes cuyo "contact_title" no incluya "Sales". Nuestro objetivo es extraer los clientes que no tienen el contacto "Sales" en su "contact_title". Extraer el nombre de contacto, su posisión (contact_title) y el nombre de la compañia.

SELECT contact_name, contact_title, company_name
FROM customers 
WHERE contact_title not like 'Sales%'

# 6. Todos los clientes que no tengan una "A" en segunda posición en su nombre.

SELECT contact_name
FROM customers 
WHERE contact_name NOT LIKE '_a%';
 