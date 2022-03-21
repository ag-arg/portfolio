with summary as (
    select
    distinct email,
    date_part_year(created_at::date) as year,
  	date_trunc('month', created_at::date) as month
    from sunrise_dbt.recurring_donations
    where year = 2021
  )

select 
count(distinct email),
month
from summary
group by month
