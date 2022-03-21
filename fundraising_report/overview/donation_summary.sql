--2020 and 2021 donation summary

with summary as (
    select
      date_part_year(paid_at::date) as year,
      sum(amount) as total_raised,
      count(donation_id) as num_contributions,
      count(distinct email) as total_donors,
      avg(amount) as avg_donation,
      (num_contributions::decimal / total_donors::decimal)::float as avg_contributions
    from sunrise_dbt.donations
    where year in (2020,2021)
    group by 1
    order by 1
  )

  select * from summary
