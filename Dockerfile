# Use an official Node.js runtime as a parent image
FROM node:18-alpine

# RUN apk add mysql-client
# RUN apk add mariadb-connector-c
# # Set working directory. Paths will be relative this WORKDIR.
WORKDIR /app

# Install dependencies
ADD package*.json ./
RUN npm install

#Coping all the file
ADD . .
#Adding permission to the shell script
# RUN chmod +x execution-order.sh

EXPOSE 8080 

#Executing the start script 
# RUN npx prisma generate
RUN npm run build 
# RUN npm i -g @nestjs/cli
CMD node ./dist/main.js
