with donations as (
  select * from  sunrise_dbt.donations
),

all_donations as (
  select
    donation_id,
    amount,
    date_trunc('month', paid_at) as month
  from donations
),

donations_month as (
  select
    month,
    sum(amount) as total_amount,
    count(donation_id) as total_contributions,
    total_amount / total_contributions as avg_amount
  from all_donations
  where month like '%2021%'
  group by 1
  order by 1
)

select * from donations_month
