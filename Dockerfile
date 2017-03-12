FROM ubuntu:16.04

# Docker CPU version
RUN apt-get update && apt-get install -y git cmake build-essential libboost-all-dev
RUN git clone -b Linux https://github.com/nicehash/nheqminer.git

WORKDIR nheqminer/cpu_xenoncat/Linux/asm/
RUN sh assemble.sh

WORKDIR ../../../Linux_cmake/nheqminer_cpu_xenoncat
RUN cmake . && make -j $(nproc)


ADD zcashCPU.sh /usr/local/bin/zcashCPU.sh
RUN chmod +x /usr/local/bin/zcashCPU.sh

CMD ["/usr/local/bin/zcashCPU.sh"]
