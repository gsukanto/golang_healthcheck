PROJECT=golang_healthcheck
LOG_FILE=/var/log/${PROJECT}.log
GOFMT=gofmt -w
GODEPS=go get -u

GOFILES=\
	main.go\

build:
	go build -o ${PROJECT}

install:
	go install

format:
	${GOFMT} main.go
	${GOFMT} app/server.go
	${GOFMT} app/binaryFS.go
	${GOFMT} controllers/api.go
	${GOFMT} models/domain/configuration_file.go
	${GOFMT} models/domain/healthcheck.go
	${GOFMT} models/domain/healthcheck_notifier.go
	${GOFMT} models/domain/mail.go
	${GOFMT} models/domain/notifier.go
	${GOFMT} models/domain/notifier_plugin_cli.go
	${GOFMT} models/domain/notifier_plugin_http_get.go
	${GOFMT} models/domain/notifier_plugin_interface.go
	${GOFMT} models/domain/notifier_plugin_manager.go
	${GOFMT} models/domain/notifier_plugin_pushbullet.go
	${GOFMT} models/domain/notifier_plugin_sendgrid.go
	${GOFMT} models/domain/notifier_plugin_slack_webhook.go
	${GOFMT} models/domain/push.go
	${GOFMT} models/domain/slack.go
	${GOFMT} models/warm/warm.go
	${GOFMT} processor/processor.go
	${GOFMT} template/template.go

test:

deps:
	${GODEPS} github.com/prsolucoes/gowebresponse
	${GODEPS} github.com/gin-gonic/gin
	${GODEPS} github.com/sendgrid/sendgrid-go
	${GODEPS} github.com/mitsuse/pushbullet-go
	${GODEPS} github.com/bluele/slack
	${GODEPS} github.com/elazarl/go-bindata-assetfs

stop:
	pkill -f ${PROJECT}

start:
	-make stop
	cd ${GOPATH}/src/github.com/prsolucoes/${PROJECT}
	nohup ${PROJECT} >> ${LOG_FILE} 2>&1 </dev/null &

update:
	git pull origin master
	make deps
	make install

build-all:
	rm -rf build

	mkdir -p build/linux32
	env GOOS=linux GOARCH=386 go build -o build/linux32/golang_healthcheck -v github.com/prsolucoes/golang_healthcheck

	mkdir -p build/linux64
	env GOOS=linux GOARCH=amd64 go build -o build/linux64/golang_healthcheck -v github.com/prsolucoes/golang_healthcheck

	mkdir -p build/darwin64
	env GOOS=darwin GOARCH=amd64 go build -o build/darwin64/golang_healthcheck -v github.com/prsolucoes/golang_healthcheck

	mkdir -p build/windows32
	env GOOS=windows GOARCH=386 go build -o build/windows32/golang_healthcheck -v github.com/prsolucoes/golang_healthcheck

	mkdir -p build/windows64
	env GOOS=windows GOARCH=amd64 go build -o build/windows64/golang_healthcheck -v github.com/prsolucoes/golang_healthcheck