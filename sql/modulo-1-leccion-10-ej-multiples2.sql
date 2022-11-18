#Qué empresas tenemos en la BBDD Northwind:
#nombre de todas las empresas cliente, los ID de sus pedidos y las fechas.

SELECT customers.company_name, orders.order_id, orders.order_date
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id;

#2 Pedidos por cliente 
#Especificamente nos piden el nombre de cada compañía cliente junto con el número de pedidos. EN UK

SELECT customers.company_name AS nombre_cliente, count(orders.order_id) AS numero_pedidos
FROM customers
LEFT JOIN orders ON customers.customer_id = orders.customer_id
WHERE customers.country = 'UK'
GROUP BY customers.company_name;

#3 nombres de las empresas cliente de Reino Unido (tengan pedidos o no), ID de todos los pedidos, el nombre de contacto de cada empresa, la fecha del pedido.
SELECT orders.order_id AS id_pedidos, customers.company_name AS nombre_cliente, orders.order_date AS fecha_pedido
FROM orders
LEFT JOIN customers ON orders.customer_id = customers.customer_id
WHERE customers.country = 'UK';

#4 Empleadas misma ciudad. Datos todas las empleadas y sus supervisoras. Piden ubicación, nombre y apellido tanto de empleadas como de jefas.
SELECT A.city AS ciudad, A.first_name AS nombre_empleado, A.last_name AS apellido_empleado, B.city AS ciudad, B.first_name AS nombre_jefa, B.last_name AS apellido_jefa
FROM employees AS A, employees AS B
WHERE A.employee_id <> B.employee_id
AND A.reports_to = B.employee_id;

#También se puede hacer así:

SELECT A.city AS ciudad, A.first_name AS nombre_empleado, A.last_name AS apellido_empleado, B.city AS ciudad, B.first_name AS nombre_jefa, B.last_name AS apellido_jefa
FROM employees AS A, employees AS B
WHERE A.reports_to = B.employee_id;
