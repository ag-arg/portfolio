with

donations as (

  select * from {{ref ('donations') }}

),

  fundraising_committee_breakdown as (

     select
     date_trunc('week', paid_at) as week,
     committee_name,
     count(donation_id) as num_contributions,
     sum(amount) as total_amount,
     total_amount / num_contributions as avg_amount

    from donations
    group by 1,2
    order by 1
  )

  select * from fundraising_committee_breakdown
