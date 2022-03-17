{{ config(materialized='table') }}

with

donations as (
  select * from {{ref ('donations') }}
),

all_donations as (
    select
      donation_id,
      committee_name,
      committee_id,
      amount,
      date_part_year(paid_at::date) as year
    from donations
  ),

annual_fundraising_breakdown as (
    select
     year,
     committee_id,
     committee_name,
     count(donation_id) as num_contributions,
     sum(amount) as total_amount,
     total_amount / num_contributions as avg_amount
    from all_donations
    group by 1,2,3
  )

  select * from annual_fundraising_breakdown
