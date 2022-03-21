select count(distinct hub)
from sunrise_dbt.form_responses_campaign_coachee_sign_up
where vanid <> 101878951
