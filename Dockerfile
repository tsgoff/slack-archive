FROM node:16

WORKDIR /slack-archive

COPY *.json ./
COPY yarn.lock ./
RUN npm install

# NOTE: see also .dockerignore
COPY . /slack-archive/

RUN npm run compile

VOLUME /slack-archive/slack-archive
ENTRYPOINT ["node", "--max-old-space-size=12288", "bin/slack-archive.js"]
