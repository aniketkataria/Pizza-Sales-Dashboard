Create database Pizzadb;

Use pizzadb;

select * from pizza_saless;

select sum(total_price) as Total_Revenue from pizza_saless;

select (sum(total_price)/ count(distinct order_id)) as Avg_order_value from pizza_saless;

select sum(quantity) Total_quantity from pizza_saless;

select count(distinct order_id) as Total_orders from pizza_saless;

select * from pizza_saless;

select cast(sum(quantity) as decimal (10,2)) / 
cast(count(distinct order_id)as decimal(10,2)) as Avg_Pizzas_per_order from pizza_saless;

select sum(quantity) / count(distinct order_id) as Avg_Pizzas_per_order from pizza_saless;

#daily trends for total orders

select date_format(order_date,"%W"), count(distinct order_id) from pizza_saless
 group by date_format(order_date,"%W");

select dayname(order_date), count(distinct order_id) as Total_orders from pizza_saless group by dayname(order_date);

select monthname(order_date), count(distinct order_id) Total_orders 
from pizza_saless group by monthname(order_date) order by Total_orders desc;

#pizza category ratio

#PERCEANTAGE OF SALES BY PIZZA_CATEGORY
select pizza_category, sum(total_price) AS Total_Sales,sum(total_price)*100/
(select sum(total_price) from pizza_saless where month(order_date)=1) as PCT
from pizza_saless 
where month(order_date)=1
 group by pizza_category;

select * from pizza_saless;

#PERCEANTAGE OF SALES BY PIZZA_SIZE
select pizza_size, sum(total_price) Total_Sales,sum(total_price)*100/
(select sum(total_price) from pizza_saless) as PST
from pizza_sales group by pizza_size;

#TOTAL PIZZAS SOLD BY PIZZA CATEGORY

Select pizza_category,sum(quantity) as Total_Pizzas_Sold
 from pizza_saless group by pizza_category;
 
 select * from pizza_saless;

#top 5 best sellers by revenue

  select pizza_name,sum(total_price) as Total_Revenue from pizza_saless 
 group by pizza_name order by Total_Revenue desc limit 5;
 
 #bottom 5 by revenue
  select pizza_name,sum(total_price) as Total_Revenue from pizza_saless 
 group by pizza_name order by Total_Revenue asc limit 5;
 
 #top 5 best sellers by quantity
 
 select pizza_name,sum(quantity) as Total_quantity from pizza_saless 
 group by pizza_name order by Total_quantity desc limit 5;
 
  #bottom 5 by quantity
  
   select pizza_name,sum(quantity) as Total_quantity from pizza_saless 
 group by pizza_name order by Total_quantity asc limit 5;
 
 
  #top 5 best sellers by orders
 
  select pizza_name,count(distinct order_id) as Total_orders from pizza_saless 
 group by pizza_name order by Total_orders desc limit 5;
 
 #bottom 5 by orders
 
   select pizza_name,count(distinct order_id) as Total_orders from pizza_saless 
 group by pizza_name order by Total_orders asc limit 5;