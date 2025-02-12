{{config(materialized = 'table')}}

select 
orderid,
lineno,
shipperid,
customerid,
productid,
employeeid,
TO_DATE(replace(SHIPMENTDATE,'0:00','')) as shipmentdt,
status
from
{{source('raw_qwt', 'raw_shipments')}}