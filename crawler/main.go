package main

// #include <stdio.h>
// #include <stdlib.h>
import "C"
import (
	"fmt"
	"net/http"
	"regexp"
	"unsafe"
)

// https://www1.folha.uol.com.br/fsp/quadrin/f30101200001.htm

func main() {

}

var urls []string
var status string
var initialUrl string

//export Start
func Start() {
	go loadPage()
	status = "wait"
}

func fakeCreateArrayUrl() {
	status = "running"

	for i := 0; i < 20; i++ {

		urls = append(urls, fmt.Sprintf("https://picsum.photos/250?image=%d", i))
	}
	status = "finish"
}

// formats
// date (ddmmyyyy)
// number (dd)
// {type:format:initialValue|optional}
// exemple https://www1.folha.uol.com.br/fsp/quadrin/f3{date:ddmmyyyy}{number:dd}.htm
// exemple https://www1.folha.uol.com.br/fsp/quadrin/f3{date:ddmmyyyy:01012000}{number:dd:01}.htm
// exemple https://www1.folha.uol.com.br/fsp/quadrin/f30101200001.htm
/***
passos
recuperar o padrao
calcular o proximo valor



**/

type pattern struct {
	value    string
	mask     string
	typeMask string
}

func readPatterns(url string) []pattern {
	re := regexp.MustCompile(`({.+?})`)

	patterns := make([]pattern, 0)
	for _, group := range re.FindAllString(url, -1) {
		reGroups := regexp.MustCompile(`{(?P<type>.+?):(?P<mask>.+?):(?P<value>.+?)}`)

		valueGroups := reGroups.FindStringSubmatch(group)
		namedGroups := reGroups.SubexpNames()
		p := pattern{}

		for i, namedGroup := range namedGroups {
			if namedGroup == "mask" {
				p.mask = valueGroups[i]
			} else if namedGroup == "value" {
				p.value = valueGroups[i]
			} else if namedGroup == "type" {
				p.typeMask = valueGroups[i]
			}
		}

		patterns = append(patterns, p)
	}
	return patterns
}

func convertFormatsToValue(string) string {
	return ""
}

func nextPage(currentPage string) string {

	//	return fmt.Sprint("https://www1.folha.uol.com.br/fsp/quadrin/f3{date:ddmmyyyy}{number:dd}.htm")
	//	return fmt.Sprint("https://www1.folha.uol.com.br/fsp/quadrin/f30101200001.htm")
	return fmt.Sprint("https://www1.folha.uol.com.br/fsp/quadrin/f3ddmmYYYY01.htm")
}

func loadPage() {

	resp, err := http.Get("")

	if err != nil {
		status = "finish"
	}

	if resp != nil {

	}

	loadPage()
}

//export SetInitialUrl
func SetInitialUrl(url *C.char) {
	defer C.free(unsafe.Pointer(url))
	initialUrl = C.GoString(url)
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
