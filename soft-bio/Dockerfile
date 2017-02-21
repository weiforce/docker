FROM ivories/alpine:1.0

RUN apk add --update bash \
    python \
    py-pip && \
    pip install supervisor && \
    rm -rf /var/cache/apk/*

RUN wget --no-check-certificate https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh && \
    chmod +x Miniconda2-latest-Linux-x86_64.sh && \
    bash Miniconda2-latest-Linux-x86_64.sh -b -p /usr/miniconda2 && \
    rm -rf Miniconda2-latest-Linux-x86_64.sh

ENV PATH /usr/miniconda2/bin:$PATH

RUN conda config --add channels r && conda config --add channels conda-forge && conda config --add channels bioconda

RUN conda install -y bowtie bowtie2 tophat cufflinks cutadapt fastqc r rsem
RUN conda install -y ggplot

RUN apk add --update python3 && rm -rf /var/cache/apk/*
RUN conda remove --force readline
RUN ln -s /usr/miniconda2/bin/perl /usr/bin/perl

CMD ["/bin/bash"]
