//: [Previous](@previous)

import Foundation

func mySqrt(_ x: Int) -> Int {
    var i = 0
    while i*i <= x {
        i += 1
    }
    
    return i-1
}

//: [Next](@next)
