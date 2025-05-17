import functions_framework
from google.cloud import bigquery

@functions_framework.http
def run_pipeline(request):
    client = bigquery.Client()
    query_job = client.query("""
    CALL dataform.run('customer_journey_pipeline', 'main');
    """)
    query_job.result()
    return 'Pipeline executed successfully.'