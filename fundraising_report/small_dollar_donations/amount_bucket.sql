-- Donation amount ranges

with donations as (

  select * from sunrise_dbt.donations
  where paid_at like '%2021%'

),

donation_amount as (

select
  case
   when amount between 0.01 and 49.99 then 'Under 50'
   when amount between 50.00 and 99.99 then '50-99'
   when amount between 100.00 and 499.99 then '100-499'
   when amount between 500.00 and 999.99 then '500-999'
   when amount between 1000.00 and 4999.99 then '1,000-4,999'
   when amount between 5000.00 and 9999.99 then '5,000-9,999'
   when amount between 10000.00 and 19999.99 then '10,000-19,999'
   when amount between 20000.00 and 99999.99 then '20,000-99,999'
   when amount between 100000.00 and 249999.99 then '100,000-249,999'
   when amount between 250000.00 and 499999.99 then '250,000-499,999'
   when amount between 500000.00 and 999999.99 then '500,000-999,999'
   when amount between 1000000.00 and 4999999.99 then '1,000,000-4,999,999'
   when amount <= 5000000.00 then '5,000,000+'
   else null end as amount_bucket,
  sum(amount) as amount
from donations
group by 1
),

donation_order as (
  select * from donation_amount
  order by
    case when amount_bucket ='Under 50' then 1
         when amount_bucket ='50-99' then 2
         when amount_bucket ='100-499' then 3
         when amount_bucket ='500-999' then 4
         when amount_bucket ='1,000-4,999' then 5
         when amount_bucket ='5,000-9,999' then 6
         when amount_bucket ='10,000-19,999' then 7
         when amount_bucket ='20,000-99,999' then 8
         when amount_bucket ='100,000-249,999' then 9
         when amount_bucket ='250,000-499,999' then 10
         when amount_bucket ='500,000-999,999' then 11
         when amount_bucket ='1,000,000-4,999,999' then 12
         when amount_bucket ='5,000,000+' then 13
         else null end
  )

select * from donation_order
