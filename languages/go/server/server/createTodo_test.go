package server

import (
	"fmt"
	"net/http"
	"net/http/httptest"
	"strings"
	"testing"
)

func TestCreateTodo(t *testing.T) {
	r := Create()

	task := "hello world"
	payload := fmt.Sprintf(`{
		"task": "%s"
	}`, task)

	req, _ := http.NewRequest("POST", "/todo/create", strings.NewReader(payload))

	testHTTPResponse(t, r, req, func(w *httptest.ResponseRecorder) bool {
		bodyMatching := w.Body.String() == fmt.Sprintf(`{"message":"%s"}`, task)
		statusOK := w.Code == http.StatusOK
		return statusOK && bodyMatching
	})
}
