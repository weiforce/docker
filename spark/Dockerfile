FROM ivories/hadoop:1.0

ARG SPARK_VERSION=1.6.3
ARG SPARK_HADOOP_VERSION=2.6
ARG TAR=spark-${SPARK_VERSION}-bin-hadoop${SPARK_HADOOP_VERSION}.tgz

ENV PATH $PATH:/spark/bin

LABEL Description="Apache Spark" \
      "Spark Version"="$SPARK_VERSION"

#COPY spark-$SPARK_VERSION-bin-hadoop$SPARK_HADOOP_VERSION /spark
#ADD "http://d3kbcqa49mib13.cloudfront.net/${TAR}"

WORKDIR /

RUN \
    apk add --no-cache bash openjdk8-jre-base wget tar && \
    wget -t 100 --retry-connrefused -O "${TAR}" "http://d3kbcqa49mib13.cloudfront.net/${TAR}" && \
    tar zxf "${TAR}" && \
    rm -fv "${TAR}" && \
    ln -s "spark-$SPARK_VERSION-bin-hadoop$SPARK_HADOOP_VERSION" /spark && \
    apk del wget tar && rm -rf /var/cache/apk/*

RUN mkdir /var/run/sshd && chmod 0755 /var/run/sshd && \
cp -v /spark/conf/spark-env.sh.template /spark/conf/spark-env.sh

RUN ln -s /spark /usr/local/spark

COPY entrypoint.sh /

EXPOSE 4040 7077 8080 8081

CMD /bin/bash
#CMD /entrypoint.sh
