with demo as (
  select 
   vanid,
   date_of_birth::date
  from sunrise_dbt.form_responses_campaign_coachee_sign_up
  where vanid <> 101878951
),

ages as (
  select 
    vanid,
    datediff(year,date_of_birth,current_date)::int AS age
   from demo
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

select *
from final
