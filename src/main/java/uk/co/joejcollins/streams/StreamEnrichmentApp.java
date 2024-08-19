package uk.co.joejcollins.streams;

import org.apache.kafka.streams.KafkaStreams;
import org.apache.kafka.streams.StreamsBuilder;
import org.apache.kafka.streams.StreamsConfig;
import org.apache.kafka.streams.kstream.KStream;
import java.util.Properties;

/**
 * This class represents a simple Kafka Streams application.
 * It reads data from an input topic, enriches it, and writes it to an output
 * topic.
 */
public class StreamEnrichmentApp {

    /**
     * Default constructor.
     */
    public StreamEnrichmentApp() {
        // Default constructor body (usually empty)
    }

    /**
     * Main method to start the Kafka Streams application.
     *
     * @param args Command line arguments (not used).
     */
    public static void main(String[] args) {
        Properties config = new Properties();
        config.put(StreamsConfig.APPLICATION_ID_CONFIG, "stream-enrichment-app");
        config.put(StreamsConfig.BOOTSTRAP_SERVERS_CONFIG, "localhost:9092");
        config.put(StreamsConfig.DEFAULT_KEY_SERDE_CLASS_CONFIG,
                "org.apache.kafka.common.serialization.Serdes$StringSerde");
        config.put(StreamsConfig.DEFAULT_VALUE_SERDE_CLASS_CONFIG,
                "org.apache.kafka.common.serialization.Serdes$StringSerde");

        StreamsBuilder builder = new StreamsBuilder();
        KStream<String, String> inputStream = builder.stream("input_topic");

        KStream<String, String> enrichedStream = inputStream.mapValues(value -> enrichData(value));

        enrichedStream.to("output_topic");

        KafkaStreams streams = new KafkaStreams(builder.build(), config);
        streams.start();
    }

    /**
     * Enriches the input data by appending additional information.
     *
     * @param value The original input data.
     * @return The enriched data.
     */
    private static String enrichData(String value) {
        return value + " | enriched data";
    }
}
