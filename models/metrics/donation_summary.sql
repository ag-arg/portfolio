{{ config(materialized='table') }}

with

donations as (
   select * from {{ref ('donations') }}
),

  fundraising_summary as (
    select
      date_trunc('week', paid_at) as week,
      sum(amount) as total_raised,
      count(distinct email) as total_donors,
      count(donation_id) as num_contributions,
      avg(amount) as avg_donation,
      num_contributions / total_donors as avg_contributions,
      --donation types
      sum(case when recurring_period = 'once' then 1 end) as num_one_time_donation,
      sum(case when recurring_period = 'weekly' then 1 end) as num_weekly_donation,
      sum(case when recurring_period = 'monthly' then 1 end) as num_monthly_donation
    from donations
    group by 1
    order by 1
  )

  select * from fundraising_summary
