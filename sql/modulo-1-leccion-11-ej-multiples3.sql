SELECT  'Hola!'  AS tipo_nombre
FROM customers;

 #1 ciudad a la que pertenecen, el nombre de la empresa y el nombre del contacto
 #además de la relación (Proveedor o Cliente)
 
 SELECT city AS ciudad, company_name AS nombre_empresa, contact_name AS nombre_contacto, 'customers' AS relationship
 FROM customers
 UNION
 SELECT city AS ciudad, company_name AS nombre_empresa, contact_name AS nombre_contacto, 'suppliers' AS relationship
 FROM suppliers;
 
 #2 Extraer todos los pedidos gestinados por "Nancy Davolio"
# En este caso, nuestro jefe quiere saber cuantos pedidos ha gestionado "Nancy Davolio", una de nuestras empleadas. 
# Nos pide todos los detalles tramitados por ella.
# Los resultados de la query deben parecerse a la siguiente tabla:

SELECT * 
FROM orders
WHERE employee_id IN (SELECT employee_id
                      FROM employees
                      WHERE last_name = 'Davolio' AND first_name = 'Nancy');
                      
#3. Extraed todas las empresas que no han comprado en el año 1997
#En este caso, nuestro jefe quiere saber cuántas empresas no han comprado en el año 1997.
#💡 Pista 💡 Para extraer el año de una fecha, podemos usar el estamento year. Más documentación sobre este método aquí.
#El resultado de la query será:

SELECT company_name AS 'company_name', country, customer_id
FROM customers 
WHERE customer_id NOT IN (SELECT customer_id
                   FROM orders 
                   WHERE YEAR(order_date) = 1997); 


SELECT customers
FROM clientes
WHERE ciudad NOT IN(
    SELECT ciudad
    FROM proyectos);


 
 
