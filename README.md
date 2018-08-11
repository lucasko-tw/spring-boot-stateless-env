### Docker Runs MySQL
透過Docker啟用一個MySQL，會將使用者帳號密碼儲存在 user table中。

```docker
docker pull mysql:5.6

docker run \
--name my-mysql \
-p 3306:3306  \
-e MYSQL_DATABASE=mydb \
-e MYSQL_ROOT_PASSWORD=1234 \
-d mysql:5.6 
```


### Docker Runs Redis
1. 透過Docker啟用一個Redis，會將 Spring 的Session儲存在 Redis中。

2. 儲存在Redis的目的是，讓兩個不同的Web application可以共用同一個session來源。

```sh

docker run --name my-redis  -p 6379:6379 -d redis

```

### Web Application

```yml
app1:
  image: lucasko/springboot
  volumes:
    - ~/.m2:/root/.m2  
    - $PWD:/opt
  ports:
    - 8081:8080
  environment:
    - REDIS_HOST=192.168.104.140
    - MYSQL_HOST=192.168.104.140
    - MYSQL_DB=mydb
    - MYSQL_USERNAME=root
    - MYSQL_PASSWORD=1234
```
