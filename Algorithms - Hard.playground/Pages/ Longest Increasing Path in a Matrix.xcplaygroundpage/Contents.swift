//: [Previous](@previous)

import Foundation

func longestIncreasingPath(_ matrix: [[Int]]) -> Int {
    if matrix.isEmpty { return 0 }
    
    let rows = matrix.count
    let columns = matrix[0].count
    var mem = Array(repeating:Array(repeating:0,count: columns),count:rows)
    
    let dir: [(x:Int, y:Int)] = [(x:1,y:0),
                                 (x:-1,y:0),
                                 (x:0,y:1),
                                 (x:0,y:-1)]

    func dfs(_ row: Int, _ column: Int) -> Int {
        if mem[row][column] > 0 {
            return mem[row][column]
        }
         
        var longestPath = 0
        for d in dir {
            let x = row + d.x
            let y = column + d.y
            if x >= 0 && y >= 0 && x < rows && y < columns && matrix[row][column] < matrix[x][y] {
                longestPath = max(longestPath, dfs(x, y))
            }
        }
        mem[row][column] = longestPath+1
        return longestPath + 1
    }


    var longestPath = 0

    for row in 0..<rows {
        for column in 0..<columns {
            let path = dfs(row, column)
            longestPath = max(longestPath, path)
        }
    }

    return longestPath
}



//: [Next](@next)
