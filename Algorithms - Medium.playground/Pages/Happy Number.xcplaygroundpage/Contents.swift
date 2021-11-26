//: [Previous](@previous)

import Foundation

func isHappy(_ n: Int) -> Bool {
    var table: [Int: Bool] = [:]
    var n = n
    while n != 1 {
        var current = n
        var sum = 0
        
        while current != 0 {
            sum += (current % 10)*(current%10)
            current /= 10
        }
        
        if table[sum] ?? false {
            return false
        }
        
        table[sum] = true
        n = sum
    }
    return true
}

isHappy(19)

//: [Next](@next)
