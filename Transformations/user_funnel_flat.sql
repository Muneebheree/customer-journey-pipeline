SELECT * FROM customer_journey_staging.ads_clean
UNION ALL
SELECT * FROM customer_journey_staging.web_clean
UNION ALL
SELECT * FROM customer_journey_staging.email_clean;