FROM onlyoffice/documentserver-builder

RUN wget https://download.java.net/java/GA/jdk13.0.1/cec27d702aa74d5a8630c65ae61e4305/9/GPL/openjdk-13.0.1_linux-x64_bin.tar.gz
RUN tar -xzvf *.tar.gz
RUN JAVA_VERSION="jdk-13.0.1"
RUN mv $JAVA_VERSION /usr/local/share/
RUN JAVA_HOME=/usr/local/share/$JAVA_VERSION
RUN PATH="$JAVA_HOME/bin:$PATH"
