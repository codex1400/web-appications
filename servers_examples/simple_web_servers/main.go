package main

import (
	"log"
	"net/http"
)

func main() {
	Port := "127.0.0.1:8080"
	log.Print("Server is running on the port: " + Port)
	http.HandleFunc("/", taskServed)
	http.HandleFunc("/tasks", getTaskId)
	log.Fatal(http.ListenAndServe(Port, nil))
}
func taskServed(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte(r.URL.Path))
}
func getTaskId(w http.ResponseWriter, r *http.Request){
	if r.Method == "GET"{
		id:= r.URL.Path[len("/tasks/"):]
		w.Write([]byte("get the task of number"+ id))
	}
}