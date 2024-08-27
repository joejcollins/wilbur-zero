# Setup the Kafka cluster.
export KAFKA_CLUSTER_ID="$(kafka-storage.sh random-uuid)"
kafka-storage.sh format -t $KAFKA_CLUSTER_ID -c /usr/local/kafka/config/kraft/server.properties