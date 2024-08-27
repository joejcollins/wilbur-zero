# Use a base image with OpenJDK
FROM mcr.microsoft.com/vscode/devcontainers/java:0-17

# Install Kafka
RUN apt-get update && apt-get install -y wget \
 && wget https://downloads.apache.org/kafka/3.8.0/kafka_2.13-3.8.0.tgz \
 && tar -xzf kafka_2.13-3.8.0.tgz \
 && mv kafka_2.13-3.8.0 /usr/local/kafka

# Add Kafka to PATH
ENV PATH=$PATH:/usr/local/kafka/bin

# Set up the workspace
WORKDIR /workspace
