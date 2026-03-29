USE restaurant_db;
with cte as 
(
select item_name,category,sum(price) as total_revenue
from menu_items
join order_details
	on menu_items.menu_item_id = order_details.item_id
group by item_name,category
)
select *, rank() over (partition by category order by total_revenue desc) ranking
from cte;