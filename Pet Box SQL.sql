
create view total_sales as 
with cte as (
select product_category,re_buy,sum(sales) as sales_moreonce
from pet_sales
where re_buy = 1 and pet_type not in ('hamster','rabbit')
group by product_category),

cte2 as (
select product_category,sum(sales) as sales_once,re_buy
from pet_sales
where re_buy = 0 and pet_type not in ('hamster','rabbit')
group by product_category)

select cte.product_category,sales_moreonce,sales_once
from cte join cte2 on
cte.product_category = cte2.product_category
------------------------------------------------------------------------------------------------------------------------------------
create view total_products as 
select re_buy,count(product_id) as no_of_product
from pet_sales
where pet_type not in ('hamster','rabbit')
group by re_buy

------------------------------------------------------------------------------------------------------------------------------------

