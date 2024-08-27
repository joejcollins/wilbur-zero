# Consistent set of make tasks.
.DEFAULT_GOAL:= help  # because it's is a safe task.

clickhouse:  # Start the ClickHouse server
	sudo clickhouse start

.PHONY: docs  # because there is a directory called docs.
docs:  # Build the Sphinx documentation.
	mvn javadoc:javadoc

.PHONY: help
help: # Show help for each of the makefile recipes.
	@grep -E '^[a-zA-Z0-9 -]+:.*#'  Makefile | sort | while read -r l; do printf "\033[1;32m$$(echo $$l | cut -f 1 -d':')\033[00m:$$(echo $$l | cut -f 2- -d'#')\n"; done

kafka:  # Start the Kafka server.
	kafka-server-start.sh /usr/local/kafka/config/kraft/server.properties
