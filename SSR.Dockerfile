# этап сборки (build stage)
FROM node:lts-alpine as develop-stage
ENV APP_ROOT /app
WORKDIR ${APP_ROOT}
COPY package*.json ./
RUN npm install
COPY . .
#RUN npm run serve

# этап сборки (build stage)
FROM develop-stage as build-stage
RUN npm run build

# этап production (production-stage)
FROM build-stage as production-stage
EXPOSE 3000
CMD ["npm", "run", "start"]
