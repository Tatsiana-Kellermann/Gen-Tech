
-----------------1. Наполнить произвольными данными таблицы streams, reactions, donations------------

INSERT INTO streams (stream_id, created_at, author_id, title, is_completed)
VALUES
	 (1, CURRENT_TIMESTAMP, 1, 'Weather', false),
	 (2, CURRENT_TIMESTAMP, 3, 'Job', false),
	 (3, CURRENT_TIMESTAMP, 2, 'Holiday', false),
     (4, CURRENT_TIMESTAMP, 5, 'Friends', false),
     (5, CURRENT_TIMESTAMP, 4, 'School', false);
    

     INSERT INTO reactions (reaction_id, created_at, author_id, stream_id, value)
VALUES
	 (1, CURRENT_TIMESTAMP, 1, 1, 3),
	 (2, CURRENT_TIMESTAMP, 2, 2, 4),
	 (3, CURRENT_TIMESTAMP, 3, 3, 1),
     (4, CURRENT_TIMESTAMP, 4, 4, 5),
     (5, CURRENT_TIMESTAMP, 5, 5, 5);
     

     INSERT INTO donations (donation_id, created_at, amount, donator_id, stream_id)
VALUES
	 (1, CURRENT_TIMESTAMP, 10, 1, 1),
	 (2, CURRENT_TIMESTAMP, 18, 4, 2),
	 (3, CURRENT_TIMESTAMP, 200, 3, 3),
     (4, CURRENT_TIMESTAMP, 45, 2, 2),
     (5, CURRENT_TIMESTAMP, 8, 5, 5);
     

-------------2. Вывести информацию по стримам (проекция: имяавтора, названиестрима)---------------
   
Select username,
	title
From streams AS S
	LEFT JOIN users AS U ON S.author_id=U.user_id;


---------------3. Вывести список пожертвований в порядке убывания размера (проекция: размерпожертвования, имядонатара, название_стрима)----------------

SELECT  donations.amount,
	users.username,
	streams.title
FROM donations
	JOIN users ON donations.donation_id=users.user_id
	JOIN streams ON donations.donation_id=streams.stream_id
ORDER BY amount DESC