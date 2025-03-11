--q1 who is the senior most employee based on job title--
select * from employee
order by levels desc
limit 1

--q2 which country has most invoices
select count(*) as C, billing_country
from invoice
group by billing_country
order by C desc

--q3 what are top 3 values of total invoices
select total from invoice
order by total desc 
limit 3
--q4 which city has the best customers? we would like to throw a promotional music festival in the city we make the most money. write a query
--that return that city which has highest number of total invoices return both city name and total sum of invoce
select sum(total) as invoice_total, billing_city
from invoice
group by billing_city
order by invoice_total desc

--q5 who is best customer? the customer who spend most money will be declared as best customer
	--write a query that returns the customer who spent most money
	
select customer.customer_id,customer.first_name,customer.last_name, sum(invoice.total) as total
from customer
join invoice on customer.customer_id=invoice.customer_id
group by customer.customer_id
order by total desc
limit 1
---q6 return email, first name, last name, & genre of all rock music listne

select * from employee


