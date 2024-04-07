{% snapshot orders_snapshot %}

{{
    config(
      target_database='DEV',
      target_schema='CURATED_DATA',
      unique_key='order_id',
      strategy='timestamp',
      updated_at='updated_at',
      invalidate_hard_deletes=True
    )
}}

select * from DEV.RAW_DATA.ORDERS_RAW

{% endsnapshot %}