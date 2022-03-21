select 
event_start_at::date,
rsvps_num as rsvps,
attended_num as attendees
from sunrise_dbt.events_summary
where 
  event_name like '%Winning the Civilian Climate Corps'
  or event_name like '%Winning the CCC'
order by 1
