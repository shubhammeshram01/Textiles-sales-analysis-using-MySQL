# Textiles sales analysis using SQL


## Description :
Therma Tales Clothing Company prides itself on providing an optimized range of clothing and lifestyle wear for the modern adventurer. Analyze their sales performance and generate a basic financial report to share with the wider business.

## Questions for Analysis 
1) What was the total quantity sold for all products?
2) What is the total generated revenue for all products before discounts?
3) What was the total discount amount for all products?
4) How many unique transactions were there?
5) What are the average unique products purchased in each transaction?
6) What is the average discount value per transaction?
7) What is the average revenue for member transactions and non-member transactions?
8) What are the top 3 products by total revenue before discount?
9) What is the total quantity, revenue, and discount for each segment?
10) What is the top-selling product for each segment?
11) What is the total quantity, revenue, and discount for each category?
12) What is the top-selling product for each category?

## Tool used to analyze sales 
* MySQL
  
## Schema
<img src = "https://github.com/shubhammeshram01/Textiles-sales-analysis-using-MySQL/blob/main/Schema%20Textile.png">

## Description of tables in a schema. There are 4 tables.

## 1) product_details table

* Total entries - 12
* Total columns - 9


<img src = "https://github.com/shubhammeshram01/Textiles-sales-analysis-using-MySQL/blob/main/product%20details.png">
   


## 2) product_prices table

* Total entries - 12
* Total columns - 3


<img src = "https://github.com/shubhammeshram01/Textiles-sales-analysis-using-MySQL/blob/main/product_prices.png">


   
## 3) product_hierarchy table

* Total entries - 18
* Total columns - 4

  
<img src = "https://github.com/shubhammeshram01/Textiles-sales-analysis-using-MySQL/blob/main/product_hierarchy.png">


   
## 4) sales table

* Total entries -15,095
* Total columns - 7

  
<img src = "https://github.com/shubhammeshram01/Textiles-sales-analysis-using-MySQL/blob/main/sales.png">

## Analyze the following questions :

1) What was the total quantity sold for all products?
```sql
SELECT pd.product_name,
SUM(sa.qty) as Sales_count
FROMinner join sales sa
ON pd.product_id=sa.prod_id 
GROUP BY pd.product_name 
ORDER BY sales_count desc ;

```
2) What is the total generated revenue for all products before discounts?
```sql


SELECT SUM(price*qty) as No_discount_revenue
FROM sales ;
```

3) What was the total discount amount for all products?
```sql
SELECT SUM(price*qty*discount)/100 as Total_discount
FROM sales ;  

```

4) How many unique transactions were there?
```sql

SELECT count(distinct txn_id) as Total_Unique_transactions
FROM sales ;
```

5) What are the average unique products purchased in each transaction?
```sql
WITH cte1 AS
(SELECT txn_id ,
COUNT(distinct prod_id) as Total_count
FROM sales
GROUP BY txn_id )
SELECT  round(avg(total_count)) as avg_product
FROM cte1 ;

```
6) What is the average discount value per transaction?
```sql

WITH cte2 AS
(SELECT txn_id , SUM(price*qty*discount)/100 as Total_Discount
FROM sales
GROUP BY txn_id )
SELECT ROUND(avg(total_discount)) as Avg_discount_per_transaction
FROM cte2 ;
```

7) What is the average revenue for member transactions and non-member transactions?
```sql
WITH cte3 AS
(SELECT member ,txn_id , SUM(qty*price) as Total
FROM sales
GROUP BY member , txn_id )
SELECT member , ROUND(avg(total),2) as Avg_revenue
FROM cte3
GROUP BY member ;

```


8) What are the top 3 products by total revenue before discount?
```sql
SELECT pd.product_name,SUM(sa.qty*sa.price) as Total_revenue
FROM product_details pd
INNER JOIN sales sa
ON pd.product_id=sa.prod_id 
GROUP BY pd.product_name
ORDER BY total_revenue desc
LIMIT 3 ;
```


9) What is the total quantity, revenue, and discount for each segment?
```sql
SELECT pd.segment_id ,segment_name, SUM(sa.qty) as Total_quantity , 
SUM(sa.qty*sa.price) as Total_revenue , 
SUM(sa.price*qty*discount)/100 as Total_discount
FROM product_details pd
INNER JOIN sales sa
ON pd.product_id=sa.prod_id
GROUP BY pd.segment_id,segment_name
ORDER BY segment_id ;
```

10) What is the top-selling product for each segment?
```sql
WITH cte1 AS
(SELECT segment_id, segment_name,product_id,product_name,SUM(sa.qty) as Total
FROM product_details pd
INNER JOIN sales sa
ON pd.product_id=sa.prod_id
GROUP BY segment_id, segment_name,product_id,product_name
ORDER BY segment_id )
SELECT *
FROM (select *,
DENSE_RANK()OVER(PARTITION BY segment_id ORDER BY total desc ) ds
FROM cte1) X
WHERE X.ds = 1 ;
```


11) What is total quantity, revenue, and discount for each category?
```sql
SELECT pd.category_name , SUM(sa.qty) as Total_quantity , 
SUM(sa.price*sa.qty) as Total_revenue , 
SUM(sa.price*sa.qty*sa.discount)/100 as Total_discount 
FROM product_details pd
INNER JOIN sales sa
ON pd.product_id=sa.prod_id
GROUP BY pd.category_name ;

```


12) What is the top-selling product for each category?
```sql
WITH cte4 AS
(SELECT category_id, category_name , product_id , product_name , SUM(sa.qty) as Total
FROM product_details pd
INNER JOIN sales sa
ON pd.product_id=sa.prod_id
GROUP BY category_id, category_name ,product_name, product_id
ORDER BY total desc )
SELECT *
FROM
(SELECT *,
DENSE_RANK()OVER(PARITION BY category_name ORDER BY total desc) as Ds
FROM cte4) X
WHERE X.ds = 1 ;
```

## Analysis Files :

|Project Name| PDF File of Textile sales analysis | SQL File of Textile sales analysis | My Linkedin Profile | My Github Profile|
|-|-|-|-|-|
|Textile Sales Analysis using MySQL|[PDF File](https://github.com/shubhammeshram01/Textiles-sales-analysis-using-MySQL/blob/main/Textile%20SQL.pdf) | [SQL File](https://github.com/shubhammeshram01/Textiles-sales-analysis-using-MySQL/blob/main/textile%20sales.sql) | [Linkedin](https://www.linkedin.com/in/shubhammeshram01/) | [Github](https://github.com/shubhammeshram01)


```

