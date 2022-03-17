{{ config(materialized='table') }}

with donations as (
  select * from  {{ ref('stg_donations') }}
),

refunds as (
  select * from  {{ ref('stg_refunds') }}
),

only_donations as (
  select
    donations.*,
    refunded_at
  from donations
  left join refunds using(donation_id)
  where refunded_at is null
),

all_donations as (
  select
    donation_id,
    committee_name,
    committee_id,
    amount,
    contribution_form,
    ref_code,
    channel,
    is_recurring,
    recurring_duration,
    recurring_period,
    unique_identifier,
    status,
    -- Donor personal info
    first_name,
    last_name,
    email,
    phone,
    city,
    state,
    zip,
    occupation,
    --Other info
    ab_test_name,
    ab_test_variation,
    -- Dates
    paid_at,
    created_at
  from only_donations
  )

select * from all_donations
