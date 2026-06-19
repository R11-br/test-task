SELECT STRFTIME('%Y-%m', listen_time) AS year_month, COUNT(song_id) AS total_listens
FROM listening_logs
GROUP BY year_month
ORDER BY year_month;