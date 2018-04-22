#!/bin/bash
SIZE=$1
MASTER_IP=$2

/usr/local/spark/bin/spark-submit --class com.github.ehiggs.spark.terasort.TeraGen target/spark-terasort-1.1-SNAPSHOT-jar-with-dependencies.jar $SIZE hdfs://${MASTER_IP}:9000/terasort_in

/usr/local/spark/bin/spark-submit --master spark://${MASTER_IP}:7077 --class com.github.ehiggs.spark.terasort.TeraSort target/spark-terasort-1.1-SNAPSHOT-jar-with-dependencies.jar hdfs://${MASTER_IP}:9000/terasort_in hdfs://${MASTER_IP}:9000/tersort_out
