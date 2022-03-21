select
year,
num_bipoc::int,
num_non_bipoc::int,
pct_bipoc::float,
pct_non_bipoc::float,
pct_with_race::float
from sunrise_dbt.annual_donor_demographics
where year in (2020,2021)
order by year asc
