create table retail
(
	transactions_id	int primary key,
	sale_date date,
	sale_time time,
	customer_id	int,
	gender 	varchar(30),
	age	int,
	category varchar(30),
	quantiy	int,
	price_per_unit	float,
	cogs	float,
	total_sale float
)


select * from retail;
where 
	transactions_id is null
	or 
	sale_date is null
	or
	sale_time is null
	or
	customer_id is null
	or
	gender is null
	or
	category is null
	or
	quantiy	is null
	or
	price_per_unit	is null
	or
	cogs is null
	or
	total_sale is null;


delete from retail
where 
	transactions_id is null
	or 
	sale_date is null
	or
	sale_time is null
	or
	customer_id is null
	or
	gender is null
	or
	category is null
	or
	quantiy	is null
	or
	price_per_unit	is null
	or
	cogs is null
	or
	total_sale is null;

--data exploration
select * from retail;
--how many unique cstomer we have?

select count(distinct customer_id) as unique_customer from retail;

--how many category we have

select distinct category as unique_catogry from retail;

-- data analysis

--1) write a sql query to retrive all columns from sales made on '22-11-05'

select * from retail
where sale_date = '2022-11-05'


--2) write a query to retrive all transaction where category is clothing, and the quantity sold
	--is more than 10 in the month of nov 2022

	select  *
		from retail
	where 
	category = 'Clothing'
	AND 
	TO_CHAR(sale_date, 'YYYY-MM') ='2022-11'
	AND 
	quantiy >=4


--3)write a sql query to cacluate the total sales fro each category

select * from retail;
select category,
sum(total_sale) as net_sale,
count(*) as total_orders
from retail
group by category;

--4)write a query to find the avg age of customer who purchase items from the beauty category;

select * from retail;

select 
	avg(age) as avg_age
	from retail
	where category = 'Beauty'

--5) write a query to find all transaction where the total_sale is greater than 1000

select * from retail;
where total_sale >=1000


--6)write a query to find the total number of transaction made by each gender in each category


select distinct category , count(*) as total_trans, gender from retail
group by category,gender


--7) write a query to caalculate the avg sales for each month. find out the best selling month in each year

select 
	year,
	month ,
	total_avg
from 
(
select 
extract(year from sale_date) as year,
extract(month from sale_date) as month,
avg(total_sale) as total_avg,
rank()over(partition by extract(year from sale_date) order by avg(total_sale) desc )
from retail
group by year,month
)as t1
where rank =1

--8)write a query to find the top 5 customer based on the highest total sale

select * from retail;

select customer_id,
sum(total_sale) as total_sales
from retail
group by customer_id
order by total_sales desc
limit 5;


--9) write a query to find the number of unique customer who purchase items from each category

select * from retail;

select category, count(distinct customer_id) as unique_customer
from retail
group by category

-- end of project

	