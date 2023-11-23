insert into analysis.tmp_rfm_recency
with factors as (
select o.user_id,
		max(o.order_ts) max_order_ts
from analysis.v_orders o
inner join analysis.v_orderstatuses os on os.id = o.status
where os."key" = 'Closed'
group by o.user_id)

select u.id as user_id,
		ntile(5) over(order by f.max_order_ts nulls first) recency
from analysis.v_users u
left join factors f on u.id = f.user_id
order by user_id;