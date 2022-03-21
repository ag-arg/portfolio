with demo as (
select * 
from sunrise_dbt.event_attendance_demographics
where event_id = 	750009389
  or event_id = 750009584
  or event_id = 750009638	
  or event_id = 750009678
),

final as (
select 
sum(num_working_class_summary)::decimal/sum(num_with_class)::decimal
from demo
)

select *
from final
