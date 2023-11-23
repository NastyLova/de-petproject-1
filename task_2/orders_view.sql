create or replace view analysis.v_orders as 
with osl as (select osl.*, 
			 		row_number() over(partition by order_id order by dttm desc) rn
			 from production.orderstatuslog osl)
	
select
    o.order_id,
    o.order_ts,
    o.user_id,
    o.bonus_payment,
    o.payment,
    o.cost,
    o.bonus_grant,
    osl.status_id as status
from production.orders o
inner join osl on osl.order_id = o.order_id and osl.rn = 1;