package server

import (
	"github.com/gin-gonic/gin"
	"main.go/server/handlers"
)

func Create() *gin.Engine {
	r := gin.Default()

	r.GET("/status", handlers.Status)
	r.POST("/todo/create", handlers.CreateTodo())

	return r
}
