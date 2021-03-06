package cell

import "testing"

// Any dead cell should remain dead with no Neighbours
func TestDeadCellShouldRemainDead(t *testing.T) {
	cell := &Cell{
		Living: false,
		Top:    &Cell{},
		Right:  &Cell{},
		Bottom: &Cell{},
		Left:   &Cell{},
	}
	if cell.IsAlive() {
		t.Errorf("Expected cell to be dead but is alive")
	}
}

// Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
func TestCellDiesWithFewerThanTwoNeighbours(t *testing.T) {
	cell := &Cell{
		Living: true,
		Top:    &Cell{},
		Right:  &Cell{},
		Bottom: &Cell{},
		Left:   &Cell{},
	}
	if cell.IsAlive() {
		t.Errorf("Expected cell to be dead but is alive")
	}
}

// Any live cell with more than three live neighbours dies, as if by overcrowding.
func TestCellDiesWithMoreThanThreeNeighbours(t *testing.T) {
	cell := &Cell{
		Living: true,
		Top:    &Cell{Living: true},
		Right:  &Cell{Living: true},
		Bottom: &Cell{Living: true},
		Left:   &Cell{Living: true},
	}
	if cell.IsAlive() {
		t.Errorf("Expected cell to be dead but is alive")
	}
}

// Any live cell with two or three live neighbours lives on to the next generation.
func TestCellLivesWithTwoLivingNeighbours(t *testing.T) {
	cell := &Cell{
		Living: true,
		Top:    &Cell{Living: true},
		Right:  &Cell{Living: true},
		Bottom: &Cell{},
		Left:   &Cell{},
	}
	if cell.IsAlive() == false {
		t.Errorf("Expected cell to be alive but is dead")
	}
}

func TestCellLivesWithThreeLivingNeighbours(t *testing.T) {
	cell := &Cell{
		Living: true,
		Top:    &Cell{Living: true},
		Right:  &Cell{Living: true},
		Bottom: &Cell{Living: true},
		Left:   &Cell{},
	}
	if cell.IsAlive() == false {
		t.Errorf("Expected cell to be alive but is dead")
	}
}

/// Any dead cell with exactly three live neighbours becomes a live cell.
func TestDeadCellBecomesAliveWithExactlyThreeNeighbours(t *testing.T) {
	cell := &Cell{
		Living: false,
		Top:    &Cell{Living: true},
		Right:  &Cell{Living: true},
		Bottom: &Cell{Living: true},
		Left:   &Cell{},
	}
	if cell.IsAlive() == false {
		t.Errorf("Expected cell to be alive but is dead")
	}
}
