package board

import (
	"fmt"

	"main.go/board/cell"
)

type Board struct {
	cells map[string]*cell.Cell
}

func CreateNewBoard(width int, height int) *Board {

	fmt.Println("Creating board")
	defer fmt.Println("Created board")

	b := &Board{
		cells: make(map[string]*cell.Cell),
	}

	for x := 0; x < width; x++ {
		for y := 0; y < height; y++ {
			position := fmt.Sprintf("%v+%v", x, y)
			b.cells[position] = &cell.Cell{Living: false}
		}
	}

	fmt.Println("Connecting cells")

	for x := 0; x < width; x++ {
		for y := 0; y < height; y++ {
			currentPosition := fmt.Sprintf("%v+%v", x, y)

			topPosition := fmt.Sprintf("%v+%v", x, y-1)
			if _, ok := b.cells[topPosition]; ok {
				b.cells[currentPosition].Top = b.cells[topPosition]
			}

			rightPosition := fmt.Sprintf("%v+%v", x+1, y)
			if _, ok := b.cells[rightPosition]; ok {
				b.cells[currentPosition].Right = b.cells[rightPosition]
			}

			bottomPosition := fmt.Sprintf("%v+%v", x, y+1)
			if _, ok := b.cells[bottomPosition]; ok {
				b.cells[currentPosition].Bottom = b.cells[bottomPosition]
			}

			leftPosition := fmt.Sprintf("%v+%v", x-1, y)
			if _, ok := b.cells[leftPosition]; ok {
				b.cells[currentPosition].Left = b.cells[leftPosition]
			}
		}
	}

	return b
}

func (b *Board) Iterate() {
	fmt.Println("Iterating")
	defer fmt.Println("Iterated")

	for _, cell := range b.cells {
		a := cell.IsAlive()
		fmt.Println("is this alive?", a)
	}
}
