with trainings_vanid as (
select *
from sunrise_dbt.event_signup_attendance_summary
where event_id = 750009389
  or event_id = 750009584
  or event_id = 750009638	
  or event_id = 750009678
),

dob as (
select *
from trainings_vanid
left join sunrise_dbt.contacts
using (vanid)
),

ages as (
   select 
    vanid,
    datediff(year,date_of_birth::date,current_date)::int AS age
  from dob
),

math as (
select 
  count(case when age <= 20 then 1 end) as num_young,
  count(case when age is not null then 1 end) as num_with_age
from ages
),
  
final as (
select 
  sum(num_young)::decimal/sum(num_with_age)::decimal
from math
)

select *
from final
