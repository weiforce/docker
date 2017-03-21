FROM alpine

RUN apk --update add python py-pip py-crypto unzip bash && \
    pip install --upgrade pip && pip install rpyc pefile pyyaml && \
    curl -o /pupy.zip https://github.com/n1nj4sec/pupy/archive/master.zip && \
    unzip /pupy.zip && mv /pupy-master /pupy && rm /pupy.zip && \
    apk del unzip && rm -rf /var/cache/apk/*

WORKDIR /pupy/pupy
CMD /bin/bash
