insert into analysis.tmp_rfm_frequency
with factors as (
select o.user_id,
		count(o.order_id) count_order_id
from analysis.v_orders o
inner join analysis.v_orderstatuses os on os.id = o.status
where os."key" = 'Closed'
group by o.user_id)

select u.id as user_id,
		ntile(5) over(order by coalesce(count_order_id, 0)) frequency
from analysis.v_users u
left join factors f on u.id = f.user_id
order by user_id;