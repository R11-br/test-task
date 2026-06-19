SELECT 
    c.customer_id,
    c.full_name,
    c.city,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(o.quantity * o.unit_price) AS total_spent,
    c.currency
FROM dim_customers c
JOIN fact_orders o ON c.customer_id = o.customer_id
WHERE o.status = 'completed'
GROUP BY c.customer_id, c.full_name, c.city, c.currency
ORDER BY total_spent DESC;