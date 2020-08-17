package main

import "main.go/server"

func main() {
	s := server.Create()
	s.Run("localhost:3030")
}
