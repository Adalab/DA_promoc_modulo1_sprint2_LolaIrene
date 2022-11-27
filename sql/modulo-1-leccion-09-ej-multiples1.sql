# PAIR PROGRAMMING MODULO 1 LECCION 9.Tablas multiples 1
#1 Pedidos por empresa en UK:
select customers.company_name as NombreEmpresa,customers.customer_id as Identificador,count(orders.order_id) as NumeroPedidos
from customers
inner join orders 
using (customer_id)
where customers.country = 'UK'
group by customers.company_name;

#2. Productos pedidos por empresa en UK por año:
select customers.company_name as NombreEmpresa, YEAR(orders.order_date) as año, sum(order_details.quantity) as NumObjetos
from orders
inner join customers 
	on customers.customer_id = orders.customer_id 
inner join order_details 
	on  orders.order_id= order_details.order_id
where customers.country = 'UK'
group by customers.company_name, YEAR(orders.order_date);

#3.Mejorad la query anterior: añadir la cantidad de dinero por esos objetos teniendo en cuenta los descuentos: 	

SELECT customers.company_name as NombreEmpresa, YEAR(orders.order_date) AS año, sum(order_details.quantity) AS NumObjetos,(sum(unit_price*order_details.quantity))-sum((unit_price*discount)) as DineroTotal
FROM orders
INNER JOIN customers 
	ON customers.customer_id = orders.customer_id 
INNER JOIN order_details 
	ON  orders.order_id= order_details.order_id
WHERE customers.country = 'UK'
GROUP BY customers.company_name, YEAR(orders.order_date);

