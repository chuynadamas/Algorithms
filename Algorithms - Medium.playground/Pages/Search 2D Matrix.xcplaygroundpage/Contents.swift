//: [Previous](@previous)

/*
 Write an efficient algorithm that searches for a target value in an m x n integer matrix. The matrix has the following properties:

 Integers in each row are sorted in ascending from left to right.
 Integers in each column are sorted in ascending from top to bottom.
  

 Example 1:

 Input: matrix = [[1,4,7,11,15],
                  [2,5,8,12,19],
                  [3,6,9,16,22],
                  [10,13,14,17,24],
                  [18,21,23,26,30]]
                ,target = 5
 Output: true
 
 */
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
