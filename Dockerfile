FROM node:4.4.1

COPY . workdir/

RUN useradd -ms /bin/bash node

RUN chown -R node workdir

RUN chown -R node /usr/

ENV HOME /home/node

USER node

WORKDIR workdir/deck

RUN pwd

RUN rm -rf .git

#RUN npm install

#CMD npm start

WORKDIR ../deck-bmc

RUN pwd

RUN ls -l

RUN build.sh

WORKDIR ../deck

CMD npm start
