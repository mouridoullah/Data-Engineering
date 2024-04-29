#!/bin/bash

# Chemin vers Kafka
KAFKA_PATH="/home/bdvm/kafka_2.12-3.7.0"

# Démarrage de Zookeeper
echo "Démarrage de Zookeeper..."
${KAFKA_PATH}/bin/zookeeper-server-start.sh ${KAFKA_PATH}/config/zookeeper.properties > /dev/null 2>&1 &

# Attendez quelques secondes pour que Zookeeper démarre
sleep 5

# Démarrage de Kafka
echo "Démarrage de Kafka..."
${KAFKA_PATH}/bin/kafka-server-start.sh ${KAFKA_PATH}/config/server.properties > /dev/null 2>&1 &

# Attendez quelques secondes pour que Kafka démarre
sleep 5

# Création du topic
echo "Création du topic 'quickstart-events'..."
${KAFKA_PATH}/bin/kafka-topics.sh --create --topic quickstart-events --bootstrap-server localhost:9092 > /dev/null 2>&1

# Affichage des informations sur le topic
echo "Informations sur le topic 'quickstart-events':"
${KAFKA_PATH}/bin/kafka-topics.sh --describe --topic quickstart-events --bootstrap-server localhost:9092

# Attente pour permettre la création du topic
sleep 200

# Arrêt de Kafka
echo "Arrêt de Kafka..."
${KAFKA_PATH}/bin/kafka-server-stop.sh

# Attente pour permettre l'arrêt de Kafka
sleep 5

# Arrêt de Zookeeper
echo "Arrêt de Zookeeper..."
${KAFKA_PATH}/bin/zookeeper-server-stop.sh
