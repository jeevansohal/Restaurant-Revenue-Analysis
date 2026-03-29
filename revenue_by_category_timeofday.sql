USE restaurant_db;
WITH cte_time_of_day as
(
SELECT item_name,category,price,order_date,order_time,
CASE 
    when hour(order_time) < 12 then 'Morning'
    when hour(order_time) between 12 and 15 then 'Lunch'
    when hour(order_time) > 15 then 'Dinner'
END as meal
from menu_items 
join order_details 
	on menu_items.menu_item_id = order_details.item_id
)    
select meal,category,SUM(price) as total_revenue
from cte_time_of_day
GROUP BY meal, category
order by total_revenue desc
;
