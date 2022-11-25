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

select city,company_name,contact_name
from customers 
where company_name like '[A-B]';

 #4.Número de pedidos que han hecho en las ciudades que empiezan con L.
 