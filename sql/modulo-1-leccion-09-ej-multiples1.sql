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

#3.Mejorad la query anterior: añadir la cantidad de dinero por esos objetos teniendo en cuenta los descuentos: 	OJO!! falta terminar la columna del dinero total
select customers.company_name as NombreEmpresa, YEAR(orders.order_date) as año, sum(order_details.quantity) as NumObjetos,(sum(order_details.quantity)*unit_price)-(unit_price*discount) as DineroTotal
from orders
inner join customers 
	on customers.customer_id = orders.customer_id 
inner join order_details 
	on  orders.order_id= order_details.order_id
where customers.country = 'UK'
group by customers.company_name, YEAR(orders.order_date);

# ultima columna No sale
select  (sum(order_details.quantity)*unit_price)-(sum(order_details.quantity)*discount) as DineroTotal
from orders;