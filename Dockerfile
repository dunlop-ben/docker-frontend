# Tag phase with a name
FROM node:alpine as build

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .

CMD npm run build

# Specify second phase
# Inferred by use of second FROM command
FROM nginx

# Mostly used for communication between developers, but
# Elasticbeanstalk uses this command for port mapping
# Port 80 is the default port exposed in an NGINX container
EXPOSE 80

# Specify directory required for NGINX
COPY --from=build /app/build /usr/share/nginx/html