{{ config(materialized='table',
          pre_hook=["insert into curated_data.audit_tbl select 'unique records model','started',current_timestamp :: timestamp_ntz"],
          post_hook=["insert into curated_data.audit_tbl select 'unique records model','completed',current_timestamp :: timestamp_ntz",
                      "Grant select on view CURATED_DATA.pre_post_hook to role SYSADMIN"]
   )
}}

select *
from raw_data.emp_stg
qualify row_number() over (partition by empid order by inserted_at desc) = 1