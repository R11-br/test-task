SELECT alb.title AS album, art.name AS artist, COUNT(lis_log.user_id) AS listens
FROM listening_logs as lis_log
JOIN songs s ON s.song_id = lis_log.song_id
JOIN albums alb ON alb.album_id = s.album_id
JOIN artists art ON alb.artist_id = art.artist_id
JOIN song_genres s_g ON s_g.song_id = s.song_id
JOIN genres g ON g.genre_id = s_g.genre_id
WHERE g.name = 'Rock'
GROUP BY alb.album_id, art.artist_id
ORDER BY listens DESC
LIMIT 1;