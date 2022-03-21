select count(distinct vanid)
from sunrise_dbt.form_responses_host_september_doa
where vanid <> 101754035
