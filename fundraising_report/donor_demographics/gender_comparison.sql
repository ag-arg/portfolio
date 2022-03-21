select
year,
num_gender_non_conforming::int,
num_cis::int,
pct_gender_non_conforming::float,
pct_cis::float,
pct_with_gender::float
from sunrise_dbt.annual_donor_demographics
where year in (2020,2021)
order by year asc
