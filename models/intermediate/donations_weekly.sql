with donations as (
  select * from  {{ ref('donations') }}
),

all_donations as (
  select
    donation_id,
    amount,
    date_trunc('week', paid_at) as week
  from donations
),

donations_weekly as (
  select
    week,
    sum(amount) as total_amount,
    count(donation_id) as total_contributions,
    total_amount / total_contributions as avg_amount
  from all_donations
  group by 1
  order by 1
)

select * from donations_weekly
