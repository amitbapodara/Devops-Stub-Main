# Stage 1 - the build process
FROM atsrepo.azurecr.io/node as build
RUN apk add --no-cache curl git
RUN npm i -g yarn --force
WORKDIR /app
COPY package.json /app
COPY package-lock.json /app
RUN npm install --force
COPY . /app
#CMD ["npm", "run", "start"]
RUN npm run build


# Stage 2 - the production environment
FROM atsrepo.azurecr.io/nginx
COPY --from=build /app/build /usr/share/nginx/html
#COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
