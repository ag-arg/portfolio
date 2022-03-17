with

donations as (
  select * from {{ref ('donations') }}
),

recurring as (
  select
  *,
  row_number() over(partition by unique_identifier order by paid_at::date asc) = 1 as is_first
  from donations
),

first_donation as (
  select * from recurring where is_first= 1
),

donations_channel as (
  select
    paid_at,
    ref_code,
    channel,
    sum(amount) as total_amount,
    count(donation_id) as total_contributions,
    total_amount / total_contributions as avg_amount
  from first_donation
  where ref_code is not null
  group by 1,2,3
  order by 4 desc
)

select * from donations_channel
