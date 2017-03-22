package main

import (
	"github.com/prsolucoes/golang_healthcheck/app"
	"github.com/prsolucoes/golang_healthcheck/controllers"
	"github.com/prsolucoes/golang_healthcheck/processor"
)

func main() {
	app.Server = app.NewWebServer()
	app.Server.LoadConfiguration()
	app.Server.TestHealthchecksFile(true)
	app.Server.CreateBasicRoutes()

	{
		controller := controllers.APIController{}
		controller.Register()
	}

	processor.CanRunHealthchecks = true
	processor.StartHealthcheckProcessor()

	app.Server.Start()
}
