USE social_network;

# 1.	Seleziona gli utenti che hanno postato almeno un video
SELECT u.*
FROM users AS u
JOIN medias AS m ON u.id = m.user_id
WHERE m.type = 'video'
GROUP BY user_id;

# 2.	Seleziona tutti i post senza Like (13)
SELECT p.*
FROM posts AS p
LEFT JOIN likes AS l ON p.id = l.post_id
WHERE l.post_id IS NULL;

# 3.	Conta il numero di like per ogni post (152)
SELECT l.post_id, COUNT(*) AS 'Numero like'
FROM likes AS l
JOIN posts AS p ON l.post_id = p.id
GROUP BY l.post_id;

# 4.	Ordina gli utenti per il numero di media caricati (25) 
SELECT us.id, us.username, COUNT(m.id) AS 'Media_caricati'
FROM users AS us
JOIN medias AS m ON us.id = m.user_id
GROUP BY us.id, us.username
ORDER BY media_caricati DESC;

# 5.	Ordina gli utenti per totale di likes ricevuti nei loro posts (25) 
SELECT u.id, u.username, count(p.id) AS 'Likes_ricevuti'
FROM users AS u
JOIN posts AS p ON u.id = p.user_id
JOIN likes AS l ON p.id = l.post_id
GROUP BY u.id, u.username
ORDER BY likes_ricevuti DESC;
