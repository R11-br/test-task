WITH col_songs AS (
	SELECT s_a.song_id
	FROM song_artists AS s_a
	GROUP BY s_a.song_id
	HAVING COUNT(s_a.song_id) > 1
)
SELECT alb.title AS album, art.name AS artist, COUNT(s.song_id) AS collab_count
FROM albums AS alb
JOIN artists art ON alb.artist_id = art.artist_id 
JOIN songs s ON s.album_id = alb.album_id 
JOIN col_songs c_s ON c_s.song_id = s.song_id
GROUP BY alb.title, art.name
ORDER BY collab_count DESC
LIMIT 1;
