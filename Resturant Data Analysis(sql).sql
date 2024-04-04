use zomatodb;
select name from 
users 
where user_id NOT IN(select user_id from orders);

select f. f_name, AVG(price)
from menu m
join food f
ON m.f_id = f.f_id
group by m.f_id;

select r.r_name, count(*) as Num_of_ord
from orders o
join restaturant r
on o.r_id = r.r_id
where monthname(date) like 'June'
group by o.r_id
order by Num_of_ord desc;

select r.r_name,sum(amount) as 'Revenue'
 from orders o
 JOIN restaturant r
 ON o.r_id = r.r_id
 where monthname(date) like 'June'
 group by o.r_id
 having Revenue>500;
 
 select o.order_id, r.r_name ,f.f_name
 from orders o
 join restaturant r
 ON o.r_id = r.r_id
 join order_details od
 ON o.order_id = od.order_id
 join food f
 ON od.f_id =f.f_id
 where user_id= (select user_id from users where name LIKE 'Ankit')
 and date between '2022-06-10'AND '2022-07-10';
 
select r_id, user_id, count(*) as 'Visits'
from orders
group by r_id
order by r_id DESC limit 5;