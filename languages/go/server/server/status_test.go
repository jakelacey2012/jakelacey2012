package server

import (
	"net/http"
	"net/http/httptest"
	"testing"

	"github.com/gin-gonic/gin"
)

func testHTTPResponse(t *testing.T, r *gin.Engine, req *http.Request, f func(w *httptest.ResponseRecorder) bool) {
	// Create a response recorder
	w := httptest.NewRecorder()

	// Create the service and process the above request.
	r.ServeHTTP(w, req)

	if !f(w) {
		t.Fail()
	}
}

func TestStatusController(t *testing.T) {
	r := Create()
	req, _ := http.NewRequest("GET", "/status", nil)

	testHTTPResponse(t, r, req, func(w *httptest.ResponseRecorder) bool {
		bodyMatching := w.Body.String() == `{"message":"ok"}`
		statusOK := w.Code == http.StatusOK
		return statusOK && bodyMatching
	})
}
