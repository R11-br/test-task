SELECT 
    strftime('%Y-%m', o.order_timestamp) AS sales_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(o.quantity) AS total_items_sold,
    SUM(o.quantity * o.unit_price) AS gross_revenue,
    o.currency
FROM fact_orders o
WHERE o.status != 'cancelled'
GROUP BY sales_month, o.currency
ORDER BY sales_month DESC;