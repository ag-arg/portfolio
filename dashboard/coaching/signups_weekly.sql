with weeks as (
  select 
  	distinct week_mddyyyy::date as week 
  from sunrise.dates_last5years
  order by week desc
  limit 10
),

base as ( 
  select *
  from sunrise_dbt.form_responses_campaign_coachee_sign_up
  where vanid <> 101878951
),

summary as (
  select 
  	weeks.week,
  	count(distinct case 
            when date_trunc('week',base.date_submitted::date) =        weeks.week::date 
              then vanid 
             else null end) as num_signups
  from weeks
  left join base 
  on weeks.week = date_trunc('week',base.date_submitted)
  group by 1
  
) 

select 
  summary.week, 
  summary.num_signups
from weeks
left join summary 
on summary.week::date = weeks.week::date
order by week desc
