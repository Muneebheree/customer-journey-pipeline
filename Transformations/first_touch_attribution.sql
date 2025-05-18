WITH touchpoints AS (
  SELECT *
  FROM customer_journey_staging.user_funnel_journey
  WHERE funnel_stage != 'converted'
),
conversions AS (
  SELECT user_id, MIN(event_time) AS conversion_time
  FROM customer_journey_staging.user_funnel_journey
  WHERE funnel_stage = 'converted'
  GROUP BY user_id
),
first_touch AS (
  SELECT
    t.user_id,
    t.funnel_stage AS first_touch_stage,
    t.event_time AS first_touch_time,
    c.conversion_time
  FROM touchpoints t
  JOIN conversions c
    ON t.user_id = c.user_id
   AND t.event_time < c.conversion_time
)
SELECT
  user_id,
  ARRAY_AGG(first_touch_stage ORDER BY first_touch_time LIMIT 1)[OFFSET(0)] AS first_touch_channel,
  conversion_time
FROM first_touch
GROUP BY user_id, conversion_time;