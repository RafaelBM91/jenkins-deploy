FROM    node:latest
WORKDIR /home
EXPOSE  8080
COPY    . /home
ENV     NODE_ENV production
RUN     npm install
CMD     [ "npm", "start" ]
