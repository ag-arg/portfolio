--2020 and 2021 total amounts by committee, including raw and percent differences between the years

with

donations as (
  select * from sunrise_dbt.donations
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

fundraising_summary_2020 as (
    select
     committee_id,
     committee_name,
     count(donation_id) as num_contributions_2020,
     sum(amount) as total_amount_2020
    from all_donations
    where year = '2020'
    group by 1,2
  ),

fundraising_summary_2021 as (
    select
     committee_id,
     committee_name,
     count(donation_id) as num_contributions_2021,
     sum(amount) as total_amount_2021
    from all_donations
    where year = '2021'
    group by 1,2
  ),

  annual_donation_breakdown as (
    select
     fundraising_summary_2021.committee_id,
     fundraising_summary_2021.committee_name,
     num_contributions_2020,
     num_contributions_2021,
     total_amount_2020,
     total_amount_2021
    from fundraising_summary_2021
    left join fundraising_summary_2020 using(committee_id)
    order by 2
  )

select 
    committee_name,
    total_amount_2020,
    total_amount_2021,
    total_amount_2021 - total_amount_2020 as amount_difference,
    amount_difference/total_amount_2020 as percent_difference
from annual_donation_breakdown
