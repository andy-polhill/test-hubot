FROM ubuntu

RUN apt-get update
RUN apt-get -y install expect redis-server nodejs npm git
RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install -g coffee-script

# # Clone github repo
RUN mkdir /hubot
WORKDIR /hubot
RUN git clone --depth=1 https://github.com/thatguynamedandy/test-hubot /hubot
RUN npm install -g coffee-script
RUN npm install

EXPOSE 8080
ENTRYPOINT ["/hubot/bin/hubot"]
