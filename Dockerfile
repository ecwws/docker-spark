FROM openjdk:8-jre-alpine

MAINTAINER Richard Li <evilcat@wisewolfsolutions.com>

ENV SPARK_VERSION=2.2.0
ENV HADOOP_VERSION=2.7

RUN apk add --no-cache wget bash

RUN wget http://www.gtlib.gatech.edu/pub/apache/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
  && tar -xzvf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
  && ln -s spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
  && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

ADD master.sh /master.sh
ADD worker.sh /worker.sh
ADD help.sh /help.sh
ADD log4j.properties /spark/conf

ENV PATH=/:$PATH

EXPOSE 7077 8080 8081

CMD [ "help.sh" ]
