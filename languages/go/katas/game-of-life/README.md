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

## Attempts

### 1st attempt

This is where I connect all the nodes

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


### References
- https://codingdojo.org/kata/GameOfLife/