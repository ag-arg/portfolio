with demo as (
select 
  sum(case 
       when class = 'Working-class' 
        then 1 
       else 0 end) as num_w,
  sum(case 
       when class = 'Poor and working-poor' 
        then 1 
       else 0 end) as num_p,
  num_p + num_w as num_working_class,
  sum (case 
        when class is not null 
         then 1 
        else 0 end) as num_with_class
  from sunrise_dbt.form_responses_campaign_coachee_sign_up
  where vanid <> 101878951
),

final as (
  select sum(num_working_class)::decimal/sum(num_with_class)::decimal
  from demo
)

select * from final
