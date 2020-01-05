FROM ivories/lotus

WORKDIR /lotus

RUN make debug
RUN make install

RUN ./lotus-seed pre-seal --sector-size 1024 --num-sectors 2
CMD ./lotus daemon --lotus-make-random-genesis=dev.gen --genesis-presealed-sectors=~/.genesis-sectors/pre-seal-t0101.json --bootstrap=false
#RUN ./lotus-storage-miner init --genesis-miner --actor=t0101 --sector-size=1024 --pre-sealed-sectors=~/.genesis-sectors --nosync
#RUn ./lotus-storage-miner run --nosync
