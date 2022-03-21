with ages as (
  select 
    distinct email as email,
    case when age < 20 then 'Under 20'
         when age between 20 and 29 then '20-29'
         when age between 30 and 39 then '30-39'
         when age between 40 and 49 then '40-49'
         when age between 50 and 59 then '50-59'
         when age between 60 and 69 then '60-69'
         when age between 70 and 79 then '70-79'
         when age between 80 and 89 then '80-89'
         when age between 90 and 99 then '90-99'
         else null end as age_range
  from sunrise_dbt.donors
  where age < 100
  and year = 2021
)

select 
age_range,
count(email)
from ages
group by age_range
order by case when age_range = 'Under 20' then 1
         when age_range = '20-29' then 2
         when age_range = '30-39' then 3
         when age_range = '40-49' then 4
         when age_range = '50-59' then 5
         when age_range = '60-69' then 6
         when age_range = '70-79' then 7
         when age_range = '80-89' then 8
         when age_range = '90-99' then 9
         else 10 end
