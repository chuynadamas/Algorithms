//: [Previous](@previous)

import Foundation

func getSum(_ a: Int, _ b: Int) -> Int {
    var a = a
    var b = b
    var tmp = 0
    
    while b != 0 {
        tmp = (a & b) << 1
        a = a ^ b
        b = tmp
    }
    return a
}


getSum(-3,5)
//: [Next](@next)
