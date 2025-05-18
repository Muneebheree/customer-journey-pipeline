SELECT
  user_id,
  funnel_stage,
  event_time,
  ROW_NUMBER() OVER (PARTITION BY user_id ORDER BY event_time) AS funnel_step
FROM customer_journey_staging.customer_journey_flat
WHERE user_id IS NOT NULL AND event_time IS NOT NULL;