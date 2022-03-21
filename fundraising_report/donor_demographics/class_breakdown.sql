select
pct_poor::float,
pct_working_class::float,
pct_middle_class::float,
pct_professional_class::float,
pct_upper_class::float
from sunrise_dbt.annual_donor_demographics
where year like '%2021%'
