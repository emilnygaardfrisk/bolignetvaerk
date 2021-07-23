FROM node:16

WORKDIR /app

RUN npm install -g nodemon

CMD ["nodemon", "--inspect=0.0.0.0:9229", "./server.js"]
