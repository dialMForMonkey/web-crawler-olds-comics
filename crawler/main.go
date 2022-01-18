package main

// #include <stdio.h>
// #include <stdlib.h>
import "C"
import (
	"fmt"
	"time"
)

func main() {

}

var urls []string
var status string

//export Start
func Start() {
	go fakeCreateArrayUrl()
	status = "wait"
}

func fakeCreateArrayUrl() {
	status = "running"

	for i := 0; i < 20; i++ {
		time.Sleep(time.Millisecond * 1000)
		urls = append(urls, fmt.Sprintf("https://picsum.photos/250?image=%d", i))
	}
	status = "finish"
}

//export GetStatus
func GetStatus() *C.char {
	return C.CString(status)
}

//export UrlsSearched
func UrlsSearched() *C.char {
	url := ""
	if len(urls) > 1 {
		url = urls[0]
		urls = urls[1:]
	}

	return C.CString(url)
}
