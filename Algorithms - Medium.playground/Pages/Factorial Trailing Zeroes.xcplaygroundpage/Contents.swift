//: [Previous](@previous)

import Foundation

func trailingZeroes(_ n: Int) -> Int {
    var factorOfFive = 0
    var tmp = n
    while tmp >= 5 {
        tmp /= 5
        factorOfFive += 1
    }
    
    if factorOfFive < 1 {
        return 0
    }
    
    var result = 0
    for index in 1...factorOfFive {
        let base = NSDecimalNumber(decimal: pow(5,index)).intValue
        result += n/base
    }
    return result
}

trailingZeroes(5)

//: [Next](@next)
