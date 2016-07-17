# Dockerfile for running node-influx tests
# From syscoin's Danosphere
FROM influxteam/influx-testnet-box:v1
MAINTAINER Influx Team <dev@influxcoin.xyz>

# install node.js
USER root
RUN apt-get install --yes curl
RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -
RUN apt-get install --yes nodejs

# install module dependencies
#USER tester
#WORKDIR /home/tester/node-influx
RUN npm install node-influx

# set permissions for tester user on project
#ADD . /home/tester/node-influx
#RUN chown --recursive tester:tester /home/tester/node-influx

# run test suite
CMD ["npm", "test"]
