select 
hub,
count(distinct vanid) as sessions
from sunrise_dbt.form_responses_campaign_coachee_sign_up
where vanid <> 	101878951
group by hub
order by sessions desc, hub
