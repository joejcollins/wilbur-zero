# Use a base image with OpenJDK
FROM mcr.microsoft.com/vscode/devcontainers/java:0-17

# Install Kafka and other dependencies if needed
RUN apt-get update && apt-get install -y wget && \
    wget https://archive.apache.org/dist/kafka/3.5.0/kafka_2.13-3.5.0.tgz && \
    tar -xzf kafka_2.13-3.5.0.tgz && \
    mv kafka_2.13-3.5.0 /usr/local/kafka

# Add Kafka to PATH
ENV PATH=$PATH:/usr/local/kafka/bin

# Set up the workspace
WORKDIR /workspace