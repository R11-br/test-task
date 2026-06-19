SELECT 
    p.product_id,
    p.product_name,
    p.category,
    SUM(o.quantity) AS units_sold,
    SUM(o.quantity * o.unit_price) AS total_revenue,
    o.currency
FROM dim_products p
JOIN fact_orders o ON p.product_id = o.product_id
WHERE o.status = 'completed'
GROUP BY p.product_id, p.product_name, p.category, o.currency
ORDER BY units_sold DESC;