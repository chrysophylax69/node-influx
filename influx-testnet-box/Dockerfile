FROM ubuntu:14.04
MAINTAINER Influx Team <dev@influxcoin.xyz>
RUN apt-get update && apt-get install -y make g++ git build-essential libssl-dev libboost-all-dev software-properties-common
RUN add-apt-repository ppa:bitcoin/bitcoin && apt-get update && apt-get install -y libdb4.8-dev libdb4.8++-dev
RUN git clone https://github.com/influxteam/influx-testnet-box.git
RUN git clone https://github.com/influxteam/influx
RUN cd influx/src && make -j30 -f makefile.unix && cp Influxd /usr/bin
RUN cd influx-testnet-box && make -f Makefile
