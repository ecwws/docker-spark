#!/bin/bash

export SPARK_HOME=/spark

. "${SPARK_HOME}/sbin/spark-config.sh"

. "${SPARK_HOME}/bin/load-spark-env.sh"

if [ "$SPARK_MASTER_PORT" = "" ]; then
  SPARK_MASTER_PORT=7077
fi

if [ "$SPARK_WORKER_WEBUI_PORT" = "" ]; then
  SPARK_WORKER_WEBUI_PORT=8081
fi

if [ "$SPARK_MASTER_HOST" = "" ]; then
  echo "SPARK_MASTER_HOST must be set"
  exit 1
fi

/spark/bin/spark-class org.apache.spark.deploy.worker.Worker \
  --webui-port $SPARK_WORKER_WEBUI_PORT \
  spark://$SPARK_MASTER_HOST:$SPARK_MASTER_PORT \
  >> /dev/stdout
