# этап сборки (build stage)
FROM node:lts-alpine as develop-stage
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
#RUN npm run serve

# этап сборки (build stage)
FROM develop-stage as build-stage
RUN npm run build

# этап production (production-stage)
FROM nginx:stable-alpine as production-stage
COPY --from=build-stage /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
