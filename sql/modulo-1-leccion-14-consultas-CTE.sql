#Ejercicios leccion 14. CTE
#1. Extraer en una CTE todos los nombres de las compañias y los id de los clientes.
select customer_id,company_name
from customers;
with CTE (CustId,CompanyName)
as (select customer_id,company_name
from customers) select CustId,CompanyNam
from CTE;

#2.Selecciona solo los de que vengan de "Germany"
with CTE (CustId,CompanyName)
as (select customer_id,company_name 
from customers
where country = 'Germany')
select CustId,CompanyName
from CTE;

#3 Extraed el id de las facturas y su fecha de cada cliente.

with CTE (custId, company_name, order_id, order_date)
as (select customers.customer_id,company_name ,order_id,order_date
	from customers
    inner join orders
    on customers.customer_id = orders.customer_id)
select custId, company_name, order_id, order_date from CTE
order by custId;

#4.Contad el número de facturas por cliente 
#5.Cuál la cantidad media pedida de todos los productos ProductID. la media sale otra cantidad. sum(count)/ cantidad media por factura
