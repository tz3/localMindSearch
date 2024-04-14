package main

import (
	"net/http"
)

func indexHandler(w http.ResponseWriter, r *http.Request) {
	w.Write([]byte("Backend running!"))
}

func main() {
	http.HandleFunc("/", indexHandler)

	http.ListenAndServe(":8080", nil)
}
