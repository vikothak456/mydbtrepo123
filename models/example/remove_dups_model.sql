{{ config(materialized='table',
          pre_hook=[
          "{{remove_dups('EMP_STG','EMP_FINAL', 'EMPID','NA')}}"]
          )
}}

select * from EMP_FINAL
