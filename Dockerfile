FROM mhart/alpine-node:latest
RUN apk update && apk upgrade
RUN apk add --no-cache make gcc g++ python git
WORKDIR /usr/src/api
COPY . /usr/src/api
RUN yarn --build-from-source install bcrypt
RUN yarn add bcrypt -f --build-from-source
EXPOSE 8080
CMD ["yarn", "start"]