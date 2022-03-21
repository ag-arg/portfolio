with trainings_vanid as (
  select * from sunrise_dbt.event_signup_attendance_summary
  where 
    event_id = 750009339
    or event_id = 750009598
    or event_id = 750009430
    or event_id = 750009677
    or event_id = 750009880
),

dob as (
  select * from trainings_vanid
  left join sunrise_dbt.contacts using (vanid)
),

ages as (
   select 
    vanid,
    datediff(year,date_of_birth::date,current_date) as age
  from dob
),

math as (
  select 
    sum(case 
          when age <= 20 
            then 1 
          else 0 end) as num_young,
    sum(case 
          when age is not null 
            then 1 
          else 0 end) as num_with_age
  from ages
),
  
final as (
  select sum(num_young)::decimal/sum(num_with_age)::decimal
  from math
)

select * from final
