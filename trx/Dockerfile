FROM polfilm/tron-java

ARG trx_branch=master

RUN git fetch --prune \
    && git fetch --tags \
    && git checkout $trx_branch 

RUN ./gradlew clean shadowJar

CMD ["/home/java-tron/gradlew","run"]
