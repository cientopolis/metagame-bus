#!/bin/sh

set -x -e

# Variables for this script
SCALA_VERSION="2.11"
KAFKA_VERSION="0.9.0.0"
CLUSTER_NAME=$(hostname | sed 's/\(.*\)-[m|w]-[0-9]*.*/\1/g')
BROKER_ID=$(hostname | sed 's/.*-w-\([0-9]\)*.*/\1/g')
DNS_NAME=$(dnsdomainname)

KAFKA_ROOT="kafka_${SCALA_VERSION}-${KAFKA_VERSION}"
cd "/usr/bin"

if [ ! -d "$KAFKA_ROOT" ]; then
  # Download and extract Kafka
  wget http://www.us.apache.org/dist/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz
  tar zxvf kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz
  #Configure Kafka
  echo 'delete.topic.enable = true' >> kafka_${SCALA_VERSION}-${KAFKA_VERSION}/config/server.properties
fi

# Start Kafka
nohup ${KAFKA_ROOT}/bin/zookeeper-server-start.sh  ${KAFKA_ROOT}/config/zookeeper.properties > /var/log/zookeeper.log 2>&1 &
nohup ${KAFKA_ROOT}/bin/kafka-server-start.sh  ${KAFKA_ROOT}/config/server.properties > /var/log/kafka.log 2>&1 &


#Start some topic
TOPIC="test"
#${KAFKA_ROOT}/bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 1 --topic ${TOPIC}
${KAFKA_ROOT}/bin/kafka-topics.sh --list --zookeeper localhost:2181

