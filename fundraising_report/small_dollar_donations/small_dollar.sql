with donations as (

  select * from sunrise_dbt_ag.donations
  where paid_at like '%2021%'

),

donation_amount as (

select
  case
   when amount between 0.01 and 9.99 then 'Under 10'
   when amount between 10.00 and 24.99 then '10-24'
   when amount between 25.00 and 50 then '25-50'
   end as amount_bucket,
  sum(amount) as amount
from donations
where amount_bucket is not null
group by 1
),

donation_order as (
  select * from donation_amount
  order by
    case when amount_bucket ='Under 10' then 1
         when amount_bucket ='10-24' then 2
         when amount_bucket ='25-50' then 3
        end
  )

select * from donation_order
