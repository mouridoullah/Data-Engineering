#!/bin/bash

# Chemin vers le dossier Spark
SPARK_HOME="/home/bdvm/spark-3.5.1-bin-hadoop3"

# Définition des variables d'environnement
export SPARK_HOME
export PATH="$SPARK_HOME/bin:$PATH"

# Démarrage du Master Spark (./sbin/start-master.sh)
$SPARK_HOME/sbin/start-master.sh

# Démarrage du Worker Spark (./sbin/start-worker.sh <master-spark-URL>)  ---> http://localhost:8080/
$SPARK_HOME/sbin/start-worker.sh spark://bdvm:7077 -h localhost -p 8082 -c 1 -m 1G --work-dir /home/bdvm/Data-Engineering/spark/workers/worker1
