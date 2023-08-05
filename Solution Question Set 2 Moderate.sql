          								 --Question Set 2_Moderate
--Q1:Write query to return the email, first name, last name, & Genre of all Rock Music listeners.
--Return your list ordered alphabetically by email starting with A
select email, first_name, last_name 
from customer 
join invoice on customer.customer_id = invoice.customer_id
join invoice_line on invoice.invoice_id = invoice_line.invoice_id
Where track_id in (
select track_id from track
	join genre on track.genre_id = genre.genre_id
	Where genre.name like 'Rock'
	)
group by email, first_name, last_name 
order by email;

--Q2: Let's invite the artists who have written the most rock music in our dataset.
--Write a query that returns the Artist name and total track count of the top 10 rock bands
select * from artist
select artist.artist_id, artist.name, COUNT(artist.artist_id) as Number_of_Songs
from track
Join album on album.album_id = track.album_id
Join artist on artist.artist_id=album.artist_id
join genre on genre.genre_id = track.genre_id
Where genre.name like 'Rock'
group by artist.artist_id
order by Number_of_Songs DESC
limit 10;

--Q3:Return all the track names that have a song length longer than the average song length.
--Return the Name and Milliseconds for each track. Order by the song length with the longest songs listed first
select name, milliseconds
from track 
WHERE milliseconds > (
	Select AVG(milliseconds) as Average_milliseconds 
	 from track)
	 
 Order by milliseconds Desc;

 
 
 







