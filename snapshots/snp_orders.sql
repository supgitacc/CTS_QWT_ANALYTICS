{% snapshot shipments_snapshot %}
{{
    config
    (
        target_datebase = 'QWT_ANALYTICS_DEV',
        target_schema = 'SNAPSHOTS_DEV',
        unique_key="orderid||'-'||lineno",
 
        strategy = 'timestamp',
        updated_at = 'shipmentdt'
    )


}}
select * from {{ref("stg_shipments")}}
{% endsnapshot %}