# base image
FROM node:latest

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
COPY public /app/public
COPY src /app/src
RUN npm install
RUN npm install -g @vue/cli

# start app
CMD ["npm", "run", "serve"]