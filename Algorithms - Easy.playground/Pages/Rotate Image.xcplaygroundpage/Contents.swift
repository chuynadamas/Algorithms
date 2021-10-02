//: [Previous](@previous)

import Foundation

func rotate(_ matrix: inout [[Int]]) {
    let l = matrix.count
    
    for i in 0..<(l+1)/2 {
        for j in 0..<l/2 {
            let n = l-1
            let temp = matrix[n-j][i]
            
            matrix[n-j][i] = matrix[n-i][n-j]
            matrix[n-i][n-j] = matrix[j][n-i]
            matrix[j][n-i] = matrix[i][j]
            matrix[i][j] = temp
        }
    }
}

var test = [[1,2,3],[4,5,6],[7,8,9]]
rotate(&test)

//: [Next](@next)
