WITH count_lis AS (
	SELECT s.song_id, COUNT(lis_log.song_id) AS listens_count, 
		NTILE(5) OVER (ORDER BY COUNT(lis_log.song_id) DESC) AS tile
	FROM songs s 
	JOIN listening_logs lis_log ON lis_log.song_id = s.song_id
	GROUP BY s.song_id
)
SELECT art.name AS artist, COUNT(s.song_id) AS top_songs
FROM artists AS art
JOIN albums alb ON alb.artist_id = art.artist_id 
JOIN songs s ON alb.album_id = s.album_id
JOIN count_lis c_l ON s.song_id = c_l.song_id
WHERE c_l.tile = 1
GROUP BY art.name
ORDER BY top_songs DESC
LIMIT 1;