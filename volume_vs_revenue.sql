USE restaurant_db;
with cte as 
(
select item_name,category,count(item_id) as order_volume,sum(price) as total_revenue 
from menu_items
join order_details
	on menu_items.menu_item_id = order_details.item_id
GROUP BY item_name, category
order by order_volume desc, total_revenue desc
)
select * from cte
where total_revenue < 5000
order by total_revenue,order_volume desc
;

