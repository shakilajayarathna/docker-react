FROM node:alpine as builder

#specify work dir
WORKDIR '/app'

#copy package json to app dir
COPY package.json .

RUN npm install

#copy all source code to container
COPY . .

RUN npm run build

#/app/build <--- all the stuff
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html