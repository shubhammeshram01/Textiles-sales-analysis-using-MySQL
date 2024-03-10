use texture_tales;

-- Total number of tables are 4 

-- Table 1 : Description about table (product_details) :
select *
from product_details ;

desc product_details ;

select count(*)     -- (There are total 12 rows in table)
from product_details ;  

-- Table 2 : Description about table (product_hierarchy) :

select *
from product_hierarchy ;

desc product_hierarchy ;  -- (There are 4 columns in this table)

select count(*)
from product_hierarchy ;  -- (There are 18 rows in this table)

-- Table 3 : Description about table (product_prices) :

select *
from product_prices ;

desc product_prices ;  -- (There are 3 columns in this table) 

select count(*)
from product_prices ;  -- (There are 12 rows in this table)

-- Table 4 : Description about table (sales) :

select *
from sales ;

desc sales ;  -- (There are 7 columns in this table)

select count(*)
from sales ;   -- (There are total 15095 rows in this table)



-- Analysis 

-- Q.1) : What was the total quantity sold for all products?

select *
from product_details ;

select *
from sales ;

select pd.product_name,
sum(sa.qty) as Sales_count
from product_details pd
inner join sales sa
on pd.product_id=sa.prod_id 
group by pd.product_name 
order by sales_count desc ;


-- Q.2) : What is the total generated revenue for all products before discounts?

select *
from sales ;

select sum(price*qty) as No_discount_revenue
from sales ;


-- Q.3) : What was the total discount amount for all products?

select sum(price*qty*discount)/100 as Total_discount
from sales ;

-- Q.4) : How many unique transactions were there?

select *
from sales ;

select count(distinct txn_id) as Total_Unique_transactions
from sales ;


-- Q.5) : What are the average unique products purchased in each transaction?

select *
from sales ;

with cte1 as
(select txn_id ,
count(distinct prod_id) as Total_count
from sales
group by txn_id )
select  round(avg(total_count)) as avg_product
from cte1 ;


-- Q.6) : What is the average discount value per transaction?

select *
from sales ;

with cte2 as
(select txn_id , sum(price*qty*discount)/100 as Total_Discount
from sales
group by txn_id )
select round(avg(total_discount)) as Avg_discount_per_transaction
from cte2 ;

-- Q.7) : What is the average revenue for member transactions and non-member transactions?

select *
from sales ;

with cte3 as
(select member ,txn_id , sum(qty*price) as Total
from sales
group by member , txn_id )
select member , round(avg(total),2) as Avg_revenue
from cte3
group by member ;

-- Q.8) : What are the top 3 products by total revenue before discount?

select *
from sales;

select pd.product_name,sum(sa.qty*sa.price) as Total_revenue
from product_details pd
inner join sales sa
on pd.product_id=sa.prod_id 
group by pd.product_name
order by total_revenue desc
limit 3 ;


-- Q.9) What are the total quantity, revenue and discount for each segment?

select *
from product_details ;
select *
from sales ;

select pd.segment_id ,segment_name, sum(sa.qty) as Total_quantity , 
sum(sa.qty*sa.price) as Total_revenue , 
sum(sa.price*qty*discount)/100 as Total_discount
from product_details pd
inner join sales sa
on pd.product_id=sa.prod_id
group by pd.segment_id ,segment_name
order by segment_id ;


-- Q.10) What is the top selling product for each segment?
select *
from product_details ;
select *
from sales ;

with cte1 as
(select segment_id, segment_name,product_id,product_name,sum(sa.qty) as Total
from product_details pd
inner join sales sa
on pd.product_id=sa.prod_id
group by segment_id, segment_name,product_id,product_name
order by segment_id )
select *
from (select *,
dense_rank()over(partition by segment_id order by total desc ) ds
from cte1) X
where X.ds = 1 ;


-- Q.11)  What are the total quantity, revenue and discount for each category?

select *
from product_details ;
select *
from sales ;

select pd.category_name , sum(sa.qty) as Total_quantity , 
sum(sa.price*sa.qty) as Total_revenue , 
sum(sa.price*sa.qty*sa.discount)/100 as Total_discount 
from product_details pd
inner join sales sa
on pd.product_id=sa.prod_id
group by pd.category_name ;



-- Q.12) What is the top selling product for each category ?

with cte4 as
(select category_id, category_name , product_id , product_name , sum(sa.qty) as Total
from product_details pd
inner join sales sa
on pd.product_id=sa.prod_id
group by category_id, category_name ,product_name, product_id
order by total desc )

select *
from
(select *,
dense_rank()over(partition by category_name order by total desc) as Ds
from cte4) X
where X.ds = 1 ;

















