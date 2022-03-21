with base as (
  select pct_working_class_summary from sunrise_dbt.event_attendance_demographics
  where 
    event_id = 750009339
    or event_id = 750009598
    or event_id = 750009430
    or event_id = 750009677
    or event_id = 750009880
)

select avg(pct_working_class_summary) as avg_pct_working_class_summary from base
