//: [Previous](@previous)

import Foundation

func setZeroes(_ matrix: inout [[Int]]) {
    
    guard !matrix.isEmpty,
          !matrix[0].isEmpty else {
              return
          }
    
    var isCol = false
    
    for row_index in matrix.indices {
        if matrix[row_index][0] == 0 {
            //This represent the column
            isCol = true
        }
        for column_index in 1..<matrix[row_index].count {
            if matrix[row_index][column_index] == 0 {
                //This represent the row
                matrix[0][column_index] = 0
                //This represent the column
                matrix[row_index][0] = 0
            }
        }
    }
    
    for row_index in 1..<matrix.count {
        for column_index in 1..<matrix[row_index].count {
            if matrix[0][column_index] == 0 || matrix[row_index][0] == 0 {
                matrix[row_index][column_index] = 0
            }
        }
    }
    
    //This store the row value
    if matrix[0][0] == 0 {
        for column_index in matrix[0].indices {
            matrix[0][column_index] = 0
        }
    }
    
    //This is for the column value
    if isCol {
        for row_index in matrix.indices {
            matrix[row_index][0] = 0
        }
    }
}

var test = [[1,2,3,4],[5,0,7,8],[0,10,11,12],[13,14,15,0]]
setZeroes(&test)

//: [Next](@next)
