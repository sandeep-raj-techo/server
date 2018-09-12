FROM node:10.1.0-alpine

WORKDIR /app

COPY package.json /app/
COPY yarn.lock /app/

RUN echo "installing dependencies"
RUN yarn install --production && yarn cache clean

COPY . /app

ENV NODE_ENV production
RUN echo "starting server\n"
ENTRYPOINT ["node", "-r", "esm", "./bin/server", "--port:3000"]

RUN echo "started server\n"