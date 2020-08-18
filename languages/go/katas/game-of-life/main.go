package main

import (
	"main.go/board"
)

func main() {
	b := board.CreateNewBoard(1920, 1080)
	b.Iterate()
}

// 10 10
// go run main.go  0.27s user 0.19s system 163% cpu 0.280 total
// go run main.go  0.25s user 0.20s system 167% cpu 0.267 total

// 100 100
// go run main.go  0.29s user 0.21s system 102% cpu 0.494 total
// go run main.go  0.32s user 0.21s system 121% cpu 0.432 total

// 1000 1000
// go run main.go  4.39s user 1.37s system 31% cpu 18.058 total
// go run main.go  4.45s user 1.39s system 29% cpu 19.592 total
// go run main.go  4.42s user 1.37s system 32% cpu 17.733 total

// 1920 * 1080
// go run main.go  10.53s user 2.77s system 31% cpu 42.888 total
// go run main.go  10.26s user 3.03s system 20% cpu 1:03.52 total
