											--Question Set 1 - Easy
--Q1. Who is the senior most employee based on job title?
select * from employee
order by title desc
limit 1;

--Q2. Which countries have the most Invoices?
select count(*) as c , billing_country 
from invoice
 group by billing_country
 order by c desc;

--Q3. What are top 3 values of total invoice?
 select total from invoice
 order by total
 limit 3;
 
--Q4:Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money.
 --Write a query that returns one city that has the highest sum of invoice totals. 
 --Return both the city name & sum of all invoice totals
 
 SELECT billing_city,SUM(total) AS InvoiceTotal
FROM invoice
GROUP BY billing_city
ORDER BY InvoiceTotal DESC
LIMIT 1;


--Q5: Who is the best customer? The customer who has spent the most money will be declared the best customer. 
--Write a query that returns the person who has spent the most money.

SELECT customer.customer_id, first_name, last_name, SUM(total) AS total_spending
FROM customer
JOIN invoice ON customer.customer_id = invoice.customer_id
GROUP BY customer.customer_id
ORDER BY total_spending DESC
LIMIT 1;

