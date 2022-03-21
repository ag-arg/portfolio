select
year,
num_working_class_summary::int,
num_not_working_class_summary::int,
pct_working_class_summary::float,
pct_not_working_class_summary::float,
pct_with_class::float
from sunrise_dbt.annual_donor_demographics
where year in (2020,2021)
order by year asc
