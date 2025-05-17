# Customer Journey Attribution Pipeline

A full-stack GCP pipeline project for marketing funnel and attribution modeling.

## Features
- Multi-source ingestion (ads, email, web)
- BigQuery staging and transformation (Dataform)
- First-touch and last-touch attribution models
- Quality checks with assertions
- Dashboards in Looker Studio
- Automated scheduling via Cloud Scheduler + Functions
- Monitored via Cloud Logging

## Architecture
See `diagrams/architecture.png`

## How to Run
1. Deploy Dataform repo
2. Deploy Cloud Function
3. Set Cloud Scheduler job