FROM ubuntu:20.04

RUN apt-get update && apt-get install -y \
    build-essential \
    cmake \
    git \
    libboost-all-dev \
    libssl-dev \
    zlib1g-dev \
    wget

RUN git clone https://github.com/marian-nmt/marian.git /opt/marian

RUN mkdir /opt/marian/build && cd /opt/marian/build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    make -j$(nproc)

ENV PATH="/opt/marian/build:$PATH"

CMD ["bash"]
