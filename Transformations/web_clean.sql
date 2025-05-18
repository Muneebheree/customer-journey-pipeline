SELECT
  user_id,
  LOWER(TRIM(channel)) AS channel,
  PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S %Z', SAFE_CAST(session_time AS STRING)) AS event_time,
  CASE 
    WHEN page = 'Landing' THEN 'visited_site'
    WHEN page = 'Product' THEN 'viewed_product'
    WHEN page = 'Checkout' AND conversion = 1 THEN 'converted'
    ELSE NULL
  END AS funnel_stage
FROM customer_journey_staging.web_traffic_raw
WHERE SAFE.PARSE_TIMESTAMP('%Y-%m-%d %H:%M:%S %Z', SAFE_CAST(session_time AS STRING)) IS NOT NULL
  AND user_id IS NOT NULL;