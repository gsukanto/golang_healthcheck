# Golang Healthcheck

Golang Healthcheck was made to be a simple and light healthcheck system made with Go (Golang).

Some project features:
- Lightweight (< 5 MB RAM memory)
- Healthcheck list is a simples JSON file - yes, you dont need one database!
- Have a warm time configuration, to only start run healthchecks after it (time is in milliseconds and is optional)

# Starting

1. Execute: ```make pull```
2. Execute: ```make build```
3. Execute: ```make install```  
4. Open in your browser: ```http://<docker-ip>:3000```

# Command line interface

You can use some make commands to control golang_healthcheck service, like start, stop and update from git repository.

1. make build   = it will build docker image
2. make pull = it will pull new repository and build docker image
3. make run   = it will run docker as healthcheck server
4. make deploy_local = it will run docker healthcheck server in port 80

So if you want start your server for example, you only need call "make build && make run".

# Alternative method to Build and Start project

1. go build
2. ./golang_healthcheck
3. open in browser port 8080
