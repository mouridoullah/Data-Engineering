from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime, timedelta

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2022, 1, 1),
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

def extract_sales_data():
    # Code pour extraire les données de vente de votre base de données
    pass

def transform_sales_data():
    # Code pour transformer les données de vente extraites
    pass

def load_sales_data():
    # Code pour charger les données de vente transformées dans un système de reporting
    pass

with DAG('sales_report',
         default_args=default_args,
         schedule=timedelta(days=1)) as dag:

    t1 = PythonOperator(
        task_id='extract_sales_data',
        python_callable=extract_sales_data
    )

    t2 = PythonOperator(
        task_id='transform_sales_data',
        python_callable=transform_sales_data
    )

    t3 = PythonOperator(
        task_id='load_sales_data',
        python_callable=load_sales_data
    )

    t1 >> t2 >> t3


#ZUYWtwBDH7de56DP