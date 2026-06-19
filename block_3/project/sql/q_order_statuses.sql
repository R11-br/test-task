SELECT 
    o.status AS order_status,
    COUNT(o.order_id) AS orders_count,
    SUM(o.quantity * o.unit_price) AS total_value,
    o.currency
FROM fact_orders o
GROUP BY o.status, o.currency
ORDER BY orders_count DESC;