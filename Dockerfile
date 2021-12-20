FROM ubuntu:20.04

RUN apt update && apt -y install sudo curl dirmngr apt-transport-https lsb-release ca-certificates

RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

RUN apt -y install nodejs && apt -y install gcc g++ make

RUN sudo npm install -g yarn

COPY package*.json ./

RUN yarn

COPY . ./

CMD  ["yarn", "start"]
