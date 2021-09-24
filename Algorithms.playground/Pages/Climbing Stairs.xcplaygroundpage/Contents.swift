//: [Previous](@previous)

import Foundation

var table : [Int] = Array(repeating: 0, count: 46)
table[1] = 1
    
func climbStairs(_ n: Int) -> Int {
    if table[n] != 0 {  return table[n] }
    if n <= 1 { return 1 }
    
    table[n] = climbStairs(n-1) + climbStairs(n-2)
    return table[n]
}

climbStairs(45)
print(table)

//: [Next](@next)
