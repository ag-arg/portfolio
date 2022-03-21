with donations as (
  select * from  sunrise_dbt.donations
),

all_donations as (
  select
    donation_id,
    amount,
    date_part_year(paid_at::date) as year
  from donations
),

donations_year as (
  select
    year,
    sum(amount) as total_amount,
    count(donation_id) as total_contributions,
    total_amount / total_contributions as avg_amount
  from all_donations
  where year not like '%2022%'
  group by 1
  order by 1
)

select * from donations_year
