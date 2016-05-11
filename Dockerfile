FROM node:4.4.1

COPY . workdir/

RUN useradd -ms /bin/bash node

RUN chown -R node workdir

RUN chown -R node /usr/

ENV HOME /home/node

USER node

WORKDIR workdir/deck

RUN rm -rf .git

RUN npm install

WORKDIR ../deck-bmc

RUN ./build.sh

RUN pwd

WORKDIR ../deck

RUN pwd

CMD npm start
