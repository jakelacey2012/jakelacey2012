package cell

type Cell struct {
	Living bool
	Top    *Cell
	Right  *Cell
	Bottom *Cell
	Left   *Cell
}

func (c *Cell) neighbours() int {
	var i int

	if c.Top != nil && c.Top.Living {
		i++
	}
	if c.Right != nil && c.Right.Living {
		i++
	}
	if c.Bottom != nil && c.Bottom.Living {
		i++
	}
	if c.Left != nil && c.Left.Living {
		i++
	}

	return i
}

func (c *Cell) calculateIsAlive() bool {
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

func (c *Cell) IsAlive() bool {
	c.Living = c.calculateIsAlive()
	return c.Living
}
