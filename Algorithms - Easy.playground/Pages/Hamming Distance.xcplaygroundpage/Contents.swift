//: [Previous](@previous)

import Foundation

func hammingDistance(_ x: Int, _ y: Int) -> Int {
    let onlyEquals = x ^ y
    return hammingWeight(onlyEquals)
}

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



//: [Next](@next)
