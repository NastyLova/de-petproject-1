insert into analysis.tmp_rfm_monetary_value
with factors as (
select o.user_id,
		sum(o.payment) sum_payment
from analysis.v_orders o
inner join analysis.v_orderstatuses os on os.id = o.status
where os."key" = 'Closed'
group by o.user_id)

select u.id as user_id,
		ntile(5) over(order by coalesce(sum_payment, 0.0)) monetary_value
from analysis.v_users u
left join factors f on u.id = f.user_id
order by user_id;