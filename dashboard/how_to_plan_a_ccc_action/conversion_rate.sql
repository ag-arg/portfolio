select avg(attendance_conversion_rate) as avg_attendance_conversion_rate
from sunrise_dbt.events_summary
where event_name like '%How to Plan a CCC Action%'
