#### Simple example
``` dockerfile
FROM ubuntu:18.04
COPY . /app
RUN make /app
CMD python /app/app.py

FROM creates a layer from the ubuntu:18.04 Docker image.
COPY adds files from your Docker client’s current directory.
RUN builds your application with make.
CMD specifies what command to run within the container.
```

#### Usefull Commands:
``` bash
docker search nginx   - Поиск образов в базе DockerHub
docker pull nginx     - скачать из репозитория 
docker build .  - Сборка Docker файла расположенного локально: 
docker images  - Все образы: 
docker ps -a   - Все контейнеры, которые когда-то запускались:
docker run -it 13bcb7e0ad0b - Запуск контейнера в консоли:
docker run -it -p 1234:80 nginx - Запуск контейнера с перенапавлением портов (на хосте веб-сервер запустится с http://localhost:1234) 
docker exec -it container_name /bin/sh    - Войти в контейнер с окружением /bin/sh
docker build -f Dockerfile -t my-server . - Собрать Image из Dockerfile и задать имя контейнера my-server 
```
