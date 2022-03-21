with summary as (
    select
    distinct email,
    date_part_year(created_at::date) as year
    from sunrise_dbt.recurring_donations
    where year = 2021
  )

select count(*) as new_recurring from summary
