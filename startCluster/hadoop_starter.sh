#!/bin/bash

# Chemin vers le dossier Hadoop
HADOOP_HOME="/home/bdvm/hadoop-3.4.0"

# Définition des variables d'environnement
export HADOOP_HOME
export PATH="$HADOOP_HOME/bin:$PATH"

# Démarrage du service HDFS
$HADOOP_HOME/sbin/start-dfs.sh

# Démarrage du service YARN
$HADOOP_HOME/sbin/start-yarn.sh
# Vérifier l'état du cluster
hdfs dfsadmin -report
