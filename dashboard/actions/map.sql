select
distinct location__lat,
location__lon
from sunrise_mobilize.events
where event_campaign__slug = 'september-day-of-action'
