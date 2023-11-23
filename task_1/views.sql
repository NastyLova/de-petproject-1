create or replace view v_orderitems as
select * from production.orderitems;

create or replace view v_orders as
select * from production.orders;

create or replace view v_users as
select * from production.users;

create or replace view v_orderstatuses as
select * from production.orderstatuses;

create or replace view v_orderstatuslog as
select * from production.orderstatuslog;

create or replace view v_products as
select * from production.products;