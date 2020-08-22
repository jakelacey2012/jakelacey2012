package main

import "golang.org/x/tour/pic"

func calculate(i, j int) uint8 {
	return uint8(i * j)
}

func Pic(dx, dy int) [][]uint8 {
	y := make([][]uint8, dy)
	for i := range y {
		x := make([]uint8, dx)
		for j := range x {
			x[j] = calculate(i, j)
		}
		y[i] = x
	}
	return y
}

func main() {
	pic.Show(Pic)
}
