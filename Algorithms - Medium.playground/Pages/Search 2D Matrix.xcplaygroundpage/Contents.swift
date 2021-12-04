//: [Previous](@previous)

import Foundation

func searchMatrix(_ matrix: [[Int]], _ target: Int) -> Bool {
    guard matrix.count > 0 else {
        return false
    }
    
    var row = 0
    var column = matrix[0].count-1
    
    while row < matrix.count && column >= 0 {
        if matrix[row][column] == target {
            return true
        } else if matrix[row][column] < target  {
            row += 1
        } else {
            column -= 1
        }
    }
    
    return false
}

//: [Next](@next)
