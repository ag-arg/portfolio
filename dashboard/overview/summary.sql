select 
  event_name as training,
  attended_num as attendees,
  rsvps_num as rsvps,
  avg(attendance_conversion_rate) as conversion_rate
from sunrise_dbt.events_summary
where 
  event_name like '%How to Plan a CCC Action%'
  or event_name like '%How to Lead a CCC Community Canvass'
  or event_name like '%Winning the Civilian Climate Corps'
  or event_name like '%Winning the CCC'
group by 1,2,3
order by rsvps_num desc
