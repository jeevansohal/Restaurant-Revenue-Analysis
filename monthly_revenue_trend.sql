USE restaurant_db;
select month(order_date) as num_month, year(order_date) as num_year , sum(price) as total_revenue
from menu_items
join order_details
	on menu_items.menu_item_id = order_details.item_id
group by num_month, num_year
order by num_year,num_month;