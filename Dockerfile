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

# Specify directory required for NGINX
COPY --from=build /app/build /usr/share/nginx/html