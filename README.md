# Textiles sales analysis using SQL

## TABLE OF CONTENTS :
-  [Project Overview](#project-overview)
-  [Questions for Analysis](#questions-for-analysis)
-  [Tool used to analyze sales](#tool-used-to-analyze-sales)

# Description
Textile Tales Clothing Company prides itself on providing an optimized range of clothing and lifestyle wear for the modern adventurer. Analyze their sales performance and generate a basic financial report to share with the wider business.
# Questions for Analysis 
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

# Tool used to analyze sales 
* MySQL
  
# Schema
<img src = "https://github.com/shubhammeshram01/Textiles-sales-analysis-using-MySQL/blob/main/Schema%20Textile.png">

# Description of tables in a schema. There are 4 tables.

# 1) product_details table

* Total entries - 12
* Total columns - 9


<img src = "https://github.com/shubhammeshram01/Textiles-sales-analysis-using-MySQL/blob/main/product%20details.png">
   


# 2) product_prices table

* Total entries - 12
* Total columns - 3


<img src = "https://github.com/shubhammeshram01/Textiles-sales-analysis-using-MySQL/blob/main/product_prices.png">


   
# 3) product_hierarchy table

* Total entries - 18
* Total columns - 4

  
<img src = "https://github.com/shubhammeshram01/Textiles-sales-analysis-using-MySQL/blob/main/product_hierarchy.png">


   
# 4) sales table

* Total entries -15,095
* Total columns - 7

  
<img src = "https://github.com/shubhammeshram01/Textiles-sales-analysis-using-MySQL/blob/main/sales.png">


# Analysis Files :

|Project Name| PDF File of Textile sales analysis | SQL File of Textile sales analysis | My Linkedin Profile | My Github Profile|
|-|-|-|-|-|
|Textile Sales Analysis using MySQL|[PDF File](https://github.com/shubhammeshram01/Textiles-sales-analysis-using-MySQL/blob/main/textile%20sales.pdf) | [SQL File](https://github.com/shubhammeshram01/Textiles-sales-analysis-using-MySQL/blob/main/textile%20sales.sql) | [Linkedin](https://www.linkedin.com/in/shubhammeshram01/) | [Github](https://github.com/shubhammeshram01)

# Enter your name :
1) What are yearly sales from store-A ?
```sql

SELECT location, count(*) as Total,
sum(salary) as Tot_salary,
avg(salary) as avg_salary
FROM employee
GROUP BY location
ORDER BY total desc ;
```

