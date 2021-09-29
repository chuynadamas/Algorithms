//: [Previous](@previous)

import Foundation

func powerOfThree(_ n: Int) -> Bool {
    var n = n
    if n == 1 {
        return false
    }
    
    while n % 3 == 0 {
        n /= 3
    }
    
    return n == 1
}


powerOfThree(300)

//: [Next](@next)
