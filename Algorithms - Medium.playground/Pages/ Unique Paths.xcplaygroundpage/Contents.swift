//: [Previous](@previous)

/*
 A robot is located at the top-left corner of a m x n grid (marked 'Start' in the diagram below).

 The robot can only move either down or right at any point in time. The robot is trying to reach the bottom-right corner of the grid (marked 'Finish' in the diagram below).

 How many possible unique paths are there?
 
 Input: m = 3, n = 7
 Output: 28
 */

import Foundation

func uniquePaths(_ m: Int, _ n: Int) -> Int {
    var dp : [[Int]] = Array(repeating: Array(repeating: 0, count: n), count: m)
    
    for index in 0..<dp.count {
        dp[index][0] = 1
    }

    for index in 0..<dp[0].count {
        dp[0][index] = 1
    }

    for row in 1..<dp.count {
        for column in 1..<dp[row].count {
            dp[row][column] = dp[row - 1][column] + dp[row][column - 1]
        }
    }
    return dp[m-1][n-1]
}

uniquePaths(3, 7)

//: [Next](@next)
