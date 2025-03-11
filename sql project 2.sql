--basic queries

--q1 retrieve all the books from fiction genre

select * from books
where genre='Fiction'

--q2 find books published after 1950
select * from books 
where published_year>1950

--q3 list all customers from canada 
select * from customers
where country='Canada'

--q4 show orders placed in november 2020
select * from orders 
where order_date between '2023-11-01' and  '2023-11-30'

--q5 retrieve total stock of books available
select sum(stock) as total_stock  from books


--q6 find details of most expensive books
select * from books
order by price desc
limit 1

-- q7 show all customers who order more than 1 book
select * from orders
where quantity>1

--q8 show all orders where total amount exceeds 20
select * from orders
where 
total_ammount > 20

--q9 show all the genre of books table
select distinct genre from books

--q10 find books with lowest stock
select * from books order by stock

-- q11 find total revenue generated from all orders

select sum(total_ammount) as total_revenue from orders

--advanced queries
-- q1 retrieve no. of books sold for each genre
select books.genre, sum(orders.quantity) from orders
join books
on books.book_id=orders.book_id
group by books.genre

--q2 find average price of books in fantacy genre
select avg(price) as avg_price
from books
where genre ='Fantasy';

--q3 list customers who have placed at least 2 orders

select customer_id, count(order_id) from orders
group by customer_id
having count(order_id)>=2

--q4 find most frequently orderd book
select book_id , count(book_id) as no_of_orders from orders
group by book_id
order by no_of_orders desc 
limit 10

--q5 list top 3 most expensive books from fantasy genre
select * from books
where genre = 'Fantasy'
order by price desc limit 3

--q6 retrieve total quantity of books sold by each author
select b.author,sum(o.quantity) as total_book_sold 
from books b
join orders o
on b.book_id=o.book_id
group by author

--q7 list the cities where  customers who spent over $30 are located

select distinct c.city , total_ammount
from orders o
join customers c 
on o.customer_id=c.customers_id
where o.total_ammount > 30

--q8 find the customers who spent the most on the orders

select c.customers_id , c.name, sum(o.total_ammount) as total_spent
from orders o
join customers c on c.customers_id=o.customer_id
group by c.customers_id 
order by total_spent desc
limit 3



