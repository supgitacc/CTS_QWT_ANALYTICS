{{config(materialized = 'table', schema = env_var('DBT_TRANSFORMSCHEMA','TRANSFORMING_DEV'))}}

select
GET(XMLGET(Suppliers_info,'SupplierID'),'$') as SupplierID,
GET(XMLGET(Suppliers_info,'CompanyName'),'$'):: varchar as CompanyName,
GET(XMLGET(Suppliers_info,'ContactName'),'$'):: varchar as ContactName,
GET(XMLGET(Suppliers_info, 'Address'), '$')::varchar as Address,
GET(XMLGET(Suppliers_info, 'City'), '$')::varchar as City,
GET(XMLGET(Suppliers_info, 'PostalCode'), '$')::varchar as PostalCode,
GET(XMLGET(Suppliers_info, 'Country'), '$')::varchar as Country,
GET(XMLGET(Suppliers_info, 'Phone'), '$')::varchar as Phone,
GET(XMLGET(Suppliers_info, 'Fax'), '$')::varchar as Fax

from
{{ref('stg_suppliers')}}