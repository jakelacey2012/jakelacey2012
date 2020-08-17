package handlers

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

// Status controller
func Status(ctx *gin.Context) {
	ctx.JSON(http.StatusOK, gin.H{
		"message": "ok",
	})
}
