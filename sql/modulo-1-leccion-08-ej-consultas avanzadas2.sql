#Consultas avanzadas 2
#1.Peso max carga de pedidos por cada empleado
select distinct employee_id, count(order_id), max(freight) as peso_maximo
from orders
group by employee_id;

# 2. Quitar fechas en blanco
select distinct employee_id, count(order_id), max(freight) as peso_maximo,shipped_date
from orders
where shipped_date <> ('0000-00-00 00:00:00')
group by employee_id;

#3. Numero de pedidos por dia/mes y año
select count(order_id),  DAY(order_date) as dia, MONTH(order_date) as mes, year(order_date) as año
from orders
group by order_date;

#4. Pedidos por mes  
select count(order_id),MONTH(order_date) as mes , year(order_date) as año 
from orders
group by mes;

#5 Ciudades con >= 4 empleadas
select city,count(employee_id) as empleadas
from employees
group by city 
having count(*) >=4;

#6 nueva columna por cantidad monetaria
select 
case unit_price
	when unit_price>2000 then 'alto'
	else  'bajo' 
	end as categorias
from order_details;
