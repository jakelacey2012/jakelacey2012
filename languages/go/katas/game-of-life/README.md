# Game of life

## Tasks
1. Any live cell with fewer than two live neighbours dies, as if caused by underpopulation.
2. Any live cell with more than three live neighbours dies, as if by overcrowding.
3. Any live cell with two or three live neighbours lives on to the next generation.
4. Any dead cell with exactly three live neighbours becomes a live cell.

You should write a program that can accept an arbitrary grid of cells, and will output a similar grid showing the next generation.

```
x x x x 
x x . x 
x x x x
x x x x

x x x x 
x x x x 
x x x x
x x x x
```

```
x x . . 
x x . . 
x x . .
x x x x

x x . . 
x x . x 
x x . .
x x x x
```

### References
- https://codingdojo.org/kata/GameOfLife/