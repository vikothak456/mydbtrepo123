{% macro remove_dups(src_table,tgt_table, unique_key,ts_col) %}

CREATE OR REPLACE TABLE  CURATED_DATA.{{tgt_table}} AS select * from raw_data.{{src_table}} where 1=2;

{% if ts_col == 'NA' %}

insert into CURATED_DATA.{{tgt_table}}
select *
from raw_data.{{src_table}}
qualify row_number() over (partition by {{unique_key}} order by {{unique_key}}) = 1;

{% else %}

insert into CURATED_DATA.{{tgt_table}}
select *
from raw_data.{{src_table}}
qualify row_number() over (partition by {{unique_key}} order by {{ts_col}} desc) = 1;

{% endif %}

{% endmacro %}