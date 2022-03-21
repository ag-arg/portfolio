with bipoc as (
  select 
    sum(case 
         when race <> 'Caucasian/White' 
          then 1 
         else 0 end) as num_bipoc,
    sum(case 
         when race is not null 
          then 1 
         else 0 end) as num_with_race
  from sunrise_dbt.form_responses_campaign_coachee_sign_up
  where vanid <> 101878951
),

final as (
  select sum(num_bipoc)::decimal/sum(num_with_race)::decimal
  from bipoc
)

select * from final
