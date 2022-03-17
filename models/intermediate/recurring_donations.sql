with

donations as (
  select * from {{ref ('donations') }}
),

recurring_donors as (
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
    -- Donor personal info
    first_name,
    last_name,
    email,
    phone,
    state,
    zip,
    occupation,
    -- Dates
    paid_at,
    created_at
  from donations
  where is_recurring = 't'
)

select * from recurring_donors
