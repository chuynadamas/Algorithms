//: [Previous](@previous)

import Foundation

func generate(_ numRows: Int) -> [[Int]] {
    var triangle : [[Int]] = []
    
    if numRows == 0 { return triangle }
    triangle.append([1])
    
    for i in 1..<numRows {
        let prevRow = triangle[i-1]
        var newRow : [Int] = []
        newRow.append(1)
        for j in 1..<i {
            newRow.append(prevRow[j-1] + prevRow[j])
        }
        newRow.append(1)
        triangle.append(newRow)
    }
    return triangle
}

generate(3)

//: [Next](@next)
