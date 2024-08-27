# Use a base image with OpenJDK
FROM mcr.microsoft.com/devcontainers/java:1-21-bullseye

# Install Kafka
RUN apt-get update && apt-get install -y wget \
 && wget https://downloads.apache.org/kafka/3.8.0/kafka_2.13-3.8.0.tgz \
 && tar -xzf kafka_2.13-3.8.0.tgz \
 && mv kafka_2.13-3.8.0 /usr/local/kafka

# Add Kafka to PATH
ENV PATH=$PATH:/usr/local/kafka/bin

RUN curl https://clickhouse.com/ | sh \
 && mv clickhouse /usr/local/bin/clickhouse

# Set up the workspace
WORKDIR /workspace
