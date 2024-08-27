# Stage 1: Base image
#####################
# Use a base image with OpenJDK (not affected by the Oracle licensing).
FROM mcr.microsoft.com/devcontainers/java:1-21-bullseye

# Stage 2a: Development and test image
######################################
FROM base AS development

# Install Kafka
RUN apt-get update && apt-get install -y wget \
 && wget https://downloads.apache.org/kafka/3.8.0/kafka_2.13-3.8.0.tgz \
 && tar -xzf kafka_2.13-3.8.0.tgz \
 && mv kafka_2.13-3.8.0 /usr/local/kafka

# Add Kafka to PATH
ENV PATH=$PATH:/usr/local/kafka/bin

# Install ClickHouse without a password
RUN curl https://clickhouse.com/ | sh \
 && ./clickhouse install -y \
 && rm clickhouse

LABEL org.opencontainers.image.description="lady-penelope development container."

# Stage 2b: Production image
############################
FROM base AS production

LABEL org.opencontainers.image.description="lady-penelope production container."