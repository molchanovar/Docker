# Docker

### Docker, docker-compose, dockerfile

Cобран кастомный образ nginx на базе alpine (описание в **Dockerfile**). После запуска nginx отдает кастомную страницу (из файла **index.html**)
Конфигурация nginx - **nginx.conf** 

Файлы копируются в контейнер при сборке.  

#### Сборка образа и запуск контейнера (Usefull CMD): 
~~~
docker build -t <Имя_Образа> .  - распаковать и собрать DockerImage (файлы: Dockerfile  index.html  nginx.conf)
docker run -it  <Имя_Образа>  - запуск контейнера (порт любой, в примере 8081)

docker build -f Dockerfile -t my-server .
docker run -it -p 1234:80 my-server
http://localhost:1234/

docker run -d -p 9000:80 nginx  # Run in background mode

docker ps -a   # See all containers 
docker rm <container_name>  # Delete container
docker rmi <image> (nginx)  # Delete image
~~~

#### Разница контейнер/образ: 
Контейнеры создаются из образов с помощью команды `docker run`.
Команда `docker run` берет Docker образ в качестве темплейта и создает из него контейнер, который и запускается.
Образы создаются из Dockerfile с помощью команды `docker build`.

#### Сборка ядра в контейнере: 
Возможна. 
- [`Пример сборки ядра в контейнере`](https://github.com/a13xp0p0v/kernel-build-containers)


### Docker Install (Ubuntu/ or Debian like): 

1) Обновляемся: 
```
sudo apt update && sudo apt upgrade
```

2) Ставим пакеты, необходимые для работы apt по https: 
```
sudo apt install apt-transport-https ca-certificates curl software-properties-common
```

3) Установка из официального репозитория разработчиков (с добавлением ключа репозитория):
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
OK
```

4) Добавление репозитория docker в систему и установка:
```
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update && apt-cache policy docker-ce
sudo apt install -y docker-ce
```

5) Добавление user'a в группу docker (исправлет ошибку при подключении к сокету / позволит запускать docker без sudo):
```
sudo usermod -aG docker $(whoami)
sudo usermod -aG docker $USER
```


### Загрузка образа в DockerHub 

Выбрать контейнер для загрузки: 
```
docker ps -a
CONTAINER ID   IMAGE       COMMAND                  CREATED          STATUS                     PORTS     NAMES
8bcc1c073962   my-server   "nginx -g 'daemon of…"   18 seconds ago   Exited (0) 4 seconds ago             upbeat_satoshi
```
Сохранить все измения и залить образ на DockerHub: 
```
docker commit 8bcc1c073962 first2container/nginx_on_alpine_1.00:latest
docker push first2container/nginx_on_alpine_1.00
```

