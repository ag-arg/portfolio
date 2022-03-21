select
pct_white::float,
pct_black::float,
pct_asian::float,
pct_latinx::float,
pct_middle_eastern::float,
pct_native::float,
pct_native_hawaiin::float,
pct_pacific_islander::float,
pct_race_other::float
from sunrise_dbt.annual_donor_demographics
where year like '%2021%'
