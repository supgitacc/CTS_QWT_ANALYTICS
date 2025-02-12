{{config(materialized = 'view', schema = 'reporting_dev')}}

select 
emp.country,
c.companyname,
c.contactname,
count(o.orderid) as total_orders,
sum(o.quantity) as total_qty,
sum(o.linesalesamount) as total_sales,
avg(o.margin) as avg_margin
from
{{ref('dim_customers')}} as c inner join
{{ref('fct_orders')}} as o on c.customerid = o.customerid
inner join
{{ref('dim_employees')}} as emp on emp.empid = o.employeeid
where emp.country = '{{var('v_country','France')}}'
group by emp.country,c.companyname,c.contactname