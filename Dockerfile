FROM ubuntu:18.04
ARG SOLC=0.5.12

RUN apt-get update && apt-get install -y \
    software-properties-common \
    locales && \
    apt-get install -y python3-pip python3.7 \
    nano \
    npm \
    git && \
    pip3 install --upgrade pip &&\
    #pip3 install --upgrade setuptools && \
    pip3 install matplotlib \
    ijson  \
    numpy  \
    configparser \
    pandas \
    slither-analyzer \
    mythril \
    manticore &&\
    npm install  @smartdec/smartcheck -g
    

# set correct locale
RUN locale-gen en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8

# install securify
RUN apt-get update &&\
        apt-get -y install\
        wget\
	gdebi\
        openjdk-8-jdk &&\
        #openjdk-8-jre 
        # install souffle
        wget https://github.com/souffle-lang/souffle/releases/download/1.6.2/souffle_1.6.2-1_amd64.deb -O /tmp/souffle.deb &&\
        gdebi --n /tmp/souffle.deb && \
        # install graphviz 
        apt-get update && apt-get -y install\
	graphviz \
        curl  && \
        # install the required solc vesion
        curl -L https://github.com/ethereum/solidity/releases/download/v$SOLC/solc-static-linux > /usr/bin/solc-$SOLC && \
        chmod +x /usr/bin/solc-$SOLC && \
        ln -s /usr/bin/solc-$SOLC /usr/local/bin/solc &&\
        cd / && git clone https://github.com/eth-sri/securify.git && \
        rm -rf /var/lib/apt/lists/*

#RUN    ./securify/gradlew jar
WORKDIR /solidifi

COPY . /solidifi

