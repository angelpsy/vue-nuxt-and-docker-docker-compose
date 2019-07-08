### Общая команда для запуска
```
docker-compose -f \<filename\> up --build
```

### files:
- SPA.docker-compose.dev.yml Для дев SPA (vue)
- SPA.docker-compose.prod.yml Для запуска сервера с билдом для SPA (vue)
- SSR.docker-compose.dev.yml Для дев SSR (nuxt)
- SSR.docker-compose.prod.yml Для запуска сервера с билдом для SSR (nuxt)
- *.Dockerfile Докерфайлы для соотвествующего типа
- .dockerignore Папки, которые не будут обрабатываться докером (копироваться в контейнер)

### Конфиг для SPA
В vue.config.js необходимо добавить (опционально)
```
module.exports = {
  devServer: {
    port: 3000
  }
}
```
либо в package.json добавить для скрипта serve порт
```
npm run serve --port 3000
```

### Конфиг для SSR (nuxt)
В nuxt.config.js необходимо добавить
```
server: {
    port: 3000,
    host: "0.0.0.0",
},
```
