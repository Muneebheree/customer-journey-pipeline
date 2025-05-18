SELECT
  user_id,
  LOWER(TRIM(channel)) AS channel,
  PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S %Z', SAFE_CAST(open_time AS STRING)) AS event_time,
  'email_opened' AS funnel_stage
FROM customer_journey_staging.email_logs_raw
WHERE SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S %Z', SAFE_CAST(open_time AS STRING)) IS NOT NULL
  AND user_id IS NOT NULL;