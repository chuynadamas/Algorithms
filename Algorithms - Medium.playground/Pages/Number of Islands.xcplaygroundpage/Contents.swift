//: [Previous](@previous)

import Foundation

let cross : [(row:Int, column:Int)] = [
    (row:0,  column:-1),
    (row:-1, column:0),
    (row:0,  column:1),
    (row:1,  column:0)
]

func numIslands(_ grid: [[Character]]) -> Int {
    var grid = grid
    var numberOfIslands = 0
    
    let rows = grid.count
    if rows == 0 { return 0 }
    
    let columns = grid[0].count
    
    for row in 0..<rows {
        for column in 0..<columns {
            if grid[row][column] == "1" {
                processIsland(&grid, row, column,rows,columns)
                numberOfIslands += 1
            }
        }
    }
    return numberOfIslands
}


func processIsland(_ grid:inout [[Character]],_ row: Int,_ column: Int,_ rows: Int, _ columns: Int) {
    if row < 0 || row>=rows || column < 0 || column >= columns || grid[row][column] != "1" { return }
    
    grid[row][column] = "0"
    
    processIsland(&grid,row + cross[0].row, column + cross[0].column, rows, columns) //left
    processIsland(&grid,row + cross[1].row, column + cross[1].column, rows, columns) //up
    processIsland(&grid,row + cross[2].row, column + cross[2].column, rows, columns) //right
    processIsland(&grid,row + cross[3].row, column + cross[3].column, rows, columns) //down
    
}

let grid : [[Character]] = [
    ["1","1","0","0","0"],
    ["1","1","0","0","0"],
    ["0","0","1","0","0"],
    ["0","0","0","1","1"]
  ]

numIslands(grid)


//: [Next](@next)
