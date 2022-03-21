select sum(rsvps_num)
from sunrise_dbt.events_summary
where 
  event_name like '%Winning the Civilian Climate Corps'
  or event_name like '%Winning the CCC'
