# Dockerfile for running node-influx tests
# From syscoin's Danosphere
FROM influxteam/influx-testnet-box
MAINTAINER Influx Team <dev@influxcoin.xyz>

# install node.js
USER root
RUN apt-get install --yes curl
RUN curl --silent --location https://deb.nodesource.com/setup_0.12 | bash -
RUN apt-get install --yes nodejs

# set permissions for tester user on project
ADD . /home/tester/node-influx
RUN chown --recursive tester:tester /home/tester/node-influx

# install module dependencies
USER tester
WORKDIR /home/tester/node-influx
RUN npm install

# run test suite
CMD ["npm", "test"]
