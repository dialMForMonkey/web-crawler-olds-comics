//go build -buildmode=c-shared -o lib.a main.go
package main

import "C"

func main() {

}

var urls string
var status string

//export Start
func Start() {

}

//export GetStatus
func GetStatus() string {
	return ""
}

//export UrlsSearched
func UrlsSearched() string {
	return ""
}
