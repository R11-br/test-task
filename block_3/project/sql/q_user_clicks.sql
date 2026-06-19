SELECT 
    p.category AS product_category,
    e.event_type,
    COUNT(e.event_id) AS text_interaction_count,
    COUNT(DISTINCT e.customer_id) AS unique_users_active
FROM fact_events e
LEFT JOIN dim_products p ON e.product_id = p.product_id
GROUP BY p.category, e.event_type
ORDER BY text_interaction_count DESC;