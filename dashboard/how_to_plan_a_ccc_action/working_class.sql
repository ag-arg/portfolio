with base as (
  select pct_working_class_summary from sunrise_dbt.event_attendance_demographics
  where 
    event_id = 750009568	
    or event_id = 750009388
    or event_id = 750009670
    or event_id = 750009679
    or event_id = 750009906
)

select avg(pct_working_class_summary) as avg_pct_working_class_summary from base
