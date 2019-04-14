FROM polfilm/tron-java

RUN git fetch --prune \
    && git fetch --tags \
    && git checkout Odyssey-v3.5.0.1

RUN ./gradlew clean shadowJar

CMD ["/home/java-tron/gradlew","run"]
