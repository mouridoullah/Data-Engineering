#!/bin/bash
# Script de démarrage du cluster Hadoop avec YARN

# Démarrer le service HDFS (Hadoop Distributed File System)
start-dfs.sh

# Démarrer le service YARN
start-yarn.sh

# Vérifier l'état du cluster
hdfs dfsadmin -report
