//: [Previous](@previous)

import Foundation

func hammingWeight(_ n: Int) -> Int {
    var hammingW = 0
    var n = n
    while n != 0 {
        if (n & 1) == 1 {
            hammingW += 1
        }
        n = n >> 1
    }
    return hammingW
}

let testBits: Int = 0b00000000000000000000000000001011
hammingWeight(testBits)

//: [Next](@next)
