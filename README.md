# Docker

### Docker, docker-compose, dockerfile

Задача: собрать свой кастомный образ nginx на базе alpine. После запуска nginx отдает кастомную страницу. 

Разница контейнер/образ: 
Контейнеры создаются из образов 
Образ - описание 
Контейнер - окружение в котором крутится приложение с PID=1 


####  Cборка и запуск контейнера:
```
docker build -t <Имя_Образа> .  - распаковать и собрать DockerImage (файлы: Dockerfile  index.html  nginx.conf)
docker run -it -p 8081:80 <Имя_Образа>  - запуск контейнера (порт любой, в примере 8081)
```

Docker Install (Ubuntu/ or Debian like): 

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

5) Добавление user'a в группу docker (исправлет ошибку при подключении к сокету):
```
sudo usermod -aG docker $(whoami)
```


Создание образа и запуск контейнера: 
~~~
docker build -f Dockerfile -t my-server
docker run -it -p 1234:80 my-server
http://localhost:1234/
~~~
