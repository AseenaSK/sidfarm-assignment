SELECT
    vehicles.vehicle_id,
    vehicles.vehicle_name,
    orders.product_name,
    SUM(orders.quantity) AS total_quantity
FROM
    orders
INNER JOIN
    customers ON orders.customer_id = customers.customer_id
INNER JOIN
    routes ON customers.route_id = routes.route_id
INNER JOIN
    vehicles ON routes.vehicle_id = vehicles.vehicle_id
WHERE
    orders.delivery_date BETWEEN 'start_date' AND 'end_date'
    AND orders.order_status = 'confirmed'
GROUP BY
    vehicles.vehicle_id,
    vehicles.vehicle_name,
    orders.product_name;

"suppose if we want to mention specificdate"

DECLARE @start_date DATE = '2024-01-01';
DECLARE @end_date DATE = '2024-12-31';
SELECT
    vehicles.vehicle_id,
    vehicles.vehicle_name,
    orders.product_name,
    SUM(orders.quantity) AS total_quantity
FROM
    orders
INNER JOIN
    customers ON orders.customer_id = customers.customer_id
INNER JOIN
    routes ON customers.route_id = routes.route_id
INNER JOIN
    vehicles ON routes.vehicle_id = vehicles.vehicle_id
WHERE
    orders.delivery_date BETWEEN @start_date AND @end_date
    AND orders.order_status = 'confirmed'
GROUP BY
    vehicles.vehicle_id,
    vehicles.vehicle_name,
    orders.product_name;