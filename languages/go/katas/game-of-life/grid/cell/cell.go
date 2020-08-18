package cell

type Cell struct {
	living bool
	Top    *Cell
	Right  *Cell
	Bottom *Cell
	Left   *Cell
}

func (c Cell) neighbours() int {
	var i int

	if c.Top.living {
		i++
	}
	if c.Right.living {
		i++
	}
	if c.Bottom.living {
		i++
	}
	if c.Left.living {
		i++
	}

	return i
}

func (c Cell) calculateIsAlive() bool {
	n := c.neighbours()
	switch {
	case n > 3:
		return false
	case n == 2:
		return true
	case n == 3:
		return true
	default:
		return false
	}
}

func (c Cell) IsAlive() bool {
	c.living = c.calculateIsAlive()
	return c.living
}
