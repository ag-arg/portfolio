select sum(rsvps_num)
from sunrise_dbt.events_summary
where event_name like '%How to Lead a CCC Community Canvass'
