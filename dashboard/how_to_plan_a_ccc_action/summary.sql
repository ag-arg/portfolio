select 
event_start_at::date,
rsvps_num as rsvps,
attended_num as attendees
from sunrise_dbt.events_summary
where event_name like '%How to Plan a CCC Action%'
order by 1
