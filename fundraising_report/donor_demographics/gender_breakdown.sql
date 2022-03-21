select
pct_women::float,
pct_men::float,
pct_trans::float,
pct_nonbinary::float,
pct_gender_other::float
from sunrise_dbt.annual_donor_demographics
where year like '%2021%'
