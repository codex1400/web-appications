package main

import (
	"fmt"
	"net/http"
)

func (app *application) statusCheckHandler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintln(w, "status: avaiable")
	fmt.Fprintf(w, "environment: %s\n", app.config.env)
	fmt.Fprintf(w, "version: %s\n", version)
}
