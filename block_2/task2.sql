WITH RECURSIVE temp AS (
    SELECT id AS id1, new_id AS id2 FROM users
    UNION
    SELECT id1, id2 FROM links
),
steps AS (
    SELECT id1 AS start_id, id2 AS next_id
    FROM temp
    
    UNION ALL
    
    SELECT s.start_id, t.id2
    FROM steps s
    JOIN temp t ON s.next_id = t.id1
    WHERE t.id2 > s.next_id  
)
SELECT 
    start_id AS id, 
    MIN(next_id) AS new_id 
FROM steps
GROUP BY start_id
ORDER BY id;