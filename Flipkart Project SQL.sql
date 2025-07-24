create database flipkarts;
use flipkarts;
select * from mobiles;



select
brand,
sum(case when mrp between 0 and 9999 then 1 else 0 end) as 'Price Below 10k',
sum(case when mrp between 10000 and 19999 then 1 else 0 end) as 'Price between 10-20',
sum(case when mrp between 20000 and 39999 then 1 else 0 end) as 'Price between 20-40',
sum(case when mrp >= 40000 then 1 else 0 end) as 'Price Above 40k'
from
mobiles
group by
brand
order by
brand;

-- 
select
brand,
max(mrp-msp) as maxdiscount
from mobiles
group by brand
order by maxdiscount desc
limit 1;


-- top 5 brands as per avg ratings
select brand, avg(ratings) as avg_rating
from mobiles
group by brand
order by avg_rating desc
limit 5;


-- top 5 brands by total no of reviews
select brand, sum(no_of_reviews) as total_reviews
from mobiles
group by brand
order by total_reviews desc
limit 5;


-- procts with rating greathe than 5
select * 
from mobiles
where ratings > 4.5;


-- products with discounts greater than 40%
select * from mobiles
where
discount > 40;


-- avg ratinng and number of reviews per brands
select brand, avg(ratings) as avg_rating, sum(no_of_reviews) as total_reviews
from mobiles
group by brand
order by avg_rating desc;


-- product with highest discounts
select * 
from mobiles
order by discount desc
limit 5;


-- get unique brand names
select distinct brand
from mobiles;
