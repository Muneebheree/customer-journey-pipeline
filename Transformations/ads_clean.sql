SELECT
  user_id,
  LOWER(TRIM(channel)) AS channel,
  PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S %Z', SAFE_CAST(click_time AS STRING)) AS event_time,
  'ad_clicked' AS funnel_stage
FROM customer_journey_staging.ads_raw
WHERE SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S %Z', SAFE_CAST(click_time AS STRING)) IS NOT NULL;