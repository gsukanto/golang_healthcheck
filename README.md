# Golang Healthcheck

Golang Healthcheck was made to be a simple and light healthcheck system made with Go (Golang).

Some project features:
- Lightweight (< 5 MB RAM memory)
- Healthcheck list is a simples JSON file - yes, you dont need one database!
- Healthcheck can have 3 types (ping, range and manual)
  - Type "ping": will automatic change status by ping time
  - Type "range": will automatic change status by range values (can be float)
  - Type "manual": will change status using your sent status (work as a trigger)
- Have a warm time configuration, to only start run healthchecks after it (time is in milliseconds and is optional)
- Notification system based on plugins. Today Golang Health Check implements its plugins:
  - CLI
  - Http Get
  - SendGrid
  - PushBullet
  - Slack
- You can reload your healthchecks and notifiers file from web and API - dont need restart the Golang Healthcheck
- The web interface is nice - made with bootstrap and AJAX


# Configuration

Golang Healthcheck configuration is a simple JSON file called "config.json" or what name you want.

Example of configuration file:

```
{
    "server": {
		"host": "0.0.0.0:8080",
		"warmTime": 60000
	},
	"healthchecks": [
	
	],
	"notifiers": [
	
	]
}
```

# Sample files

I have created a sample healthcheck file and a sample config file. Check it on **extras/sample** directory.

# Starting

1. Execute: make deps  
2. Execute: make install  
3. Create config file (config.json) based on some above example  
4. Execute: golang_healthcheck -f config.json
5. Open in your browser: http://localhost:8080  

# API

1. update a ping = http://localhost:8080/api/update/ping/[TOKEN]
2. update a range = http://localhost:8080/api/update/range/[TOKEN]/[VALUE-FLOAT-OR-INT]
3. update manual = http://localhost:8080/api/update/manual/[TOKEN]/[SUCCESS-WARNING-OR-ERROR]
4. reload healthchecks and notifiers file = http://localhost:8080/api/system/reload

# Command line interface

You can use some make commands to control golang_healthcheck service, like start, stop and update from git repository.

1. make stop   = it will kill current golang_healthcheck process
2. make update = it will update code from git and install on $GOPATH/bin directory
3. make deps   = download all dependencies
4. make format = format all files (use it before make a pull-request)

So if you want start your server for example, you only need call "make start".

# Alternative method to Build and Start project

1. go build
2. ./golang_healthcheck -f config.json

