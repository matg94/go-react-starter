package controller

import "github.com/gin-gonic/gin"

func GetHello(c *gin.Context) {
	c.JSON(200, "Hello")
}
