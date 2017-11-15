#!/bin/bash

export SPARK_HOME=/spark

. "${SPARK_HOME}/sbin/spark-config.sh"

. "${SPARK_HOME}/bin/load-spark-env.sh"

if [ "$SPARK_MASTER_PORT" = "" ]; then
    SPARK_MASTER_PORT=7077
fi

if [ "$SPARK_MASTER_HOST" = "" ]; then
  SPARK_MASTER_HOST=0.0.0.0
fi

if [ "$SPARK_MASTER_WEBUI_PORT" = "" ]; then
    SPARK_MASTER_WEBUI_PORT=8080
fi

/spark/bin/spark-class org.apache.spark.deploy.master.Master \
  --host $SPARK_MASTER_HOST --port $SPARK_MASTER_PORT \
  --webui-port $SPARK_MASTER_WEBUI_PORT \
  >> /dev/stdout
