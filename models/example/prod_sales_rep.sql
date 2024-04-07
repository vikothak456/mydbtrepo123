select P.PROD_NAME,SUM(UNIT_PRICE*QUANTITY) AS TOT_REVENUE from 
{{ source('RAW_DATA', 'PRODUCTS') }} 
P inner join 
{{ source('RAW_DATA', 'SALES') }}  S on(P.PROD_ID=S.PROD_ID)
GROUP BY P.PROD_NAME