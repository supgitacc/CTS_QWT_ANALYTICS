{{config(materialized = 'view', schema = 'reporting_dev')}}

select 
c.companyname,c.contactname,
min(o.orderdate) as firstorderdate,
min(d.day_of_week_name) as firstorderday,
max(o.orderdate) as recentorderdate,
max(d.day_of_week_name) as recentorderday,
sum(o.quantity) as total_qty,
sum(o.linesalesamount) as total_sales
from
{{ref('dim_customers')}} as c inner join
{{ref('fct_orders')}} as o on c.customerid = o.customerid inner join
{{ref('dim_date')}} as d on o.orderdate = d.date_day
group by c.companyname,c.contactname
order by total_sales desc