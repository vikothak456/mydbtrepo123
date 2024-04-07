{{ config(materialized='table',
   alias='emp_curated')
}}

select *
from raw_data.emp_stg
qualify row_number() over (partition by empid order by inserted_at desc) = 1