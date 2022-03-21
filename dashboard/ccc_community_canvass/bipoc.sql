with base as (
  select pct_bipoc from sunrise_dbt.event_attendance_demographics
  where 
    event_id = 	750009389
    or event_id = 750009584
    or event_id = 750009638
    or event_id = 750009678
)

select avg(pct_bipoc) as avg_pct_bipoc from base
