with donations as (
  select * from  {{ ref('donations') }}
),

contacts as (
  select * from  {{ ref('contacts') }}
),

dedupe as (
  select
  *,
  row_number() over(partition by email order by created_at::date desc) = 1 as is_first
  from contacts
),

contacts_deduped as (
  select * from dedupe where is_first= 1
),

all_donations as (
  select
    vanid,
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
    donations.first_name,
    donations.last_name,
    donations.email,
    donations.phone,
    donations.city,
    donations.state,
    donations.zip,
    occupation,
    -- Demographics
    race,
    race_summary,
    class,
    class_summary,
    gender,
    gender_summary,
    age,
    --Dates
    paid_at,
    donations.created_at,
    date_part_year(paid_at::date) as year
  from donations
  left join contacts_deduped
    on donations.email = contacts_deduped.email
  )

select * from all_donations
