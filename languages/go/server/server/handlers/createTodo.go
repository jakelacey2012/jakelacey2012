package handlers

import (
	"fmt"
	"net/http"

	"github.com/gin-gonic/gin"
)

func CreateTodo() func(ctx *gin.Context) {

	type request struct {
		Task string `json:"task" binding:"required"`
	}

	type response struct {
		Message string `json:"message"`
	}

	return func(ctx *gin.Context) {

		var r request
		if err := ctx.ShouldBindJSON(&r); err != nil {
			fmt.Println(err)
			ctx.JSON(http.StatusBadRequest, gin.H{"dont": "break"})
			return
		}

		ctx.JSON(http.StatusOK, response{
			Message: r.Task,
		})
	}
}
