FROM ivories/cuda

RUN apt-get update && \
    apt-get install -y cmake libncurses5-dev git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /work/*

RUN git clone https://github.com/Syllo/nvtop.git
#RUN mkdir -p nvtop/build && cd nvtop/build; \
#    cmake .. -DNVML_RETRIEVE_HEADER_ONLINE=True; \
#    make && make install
