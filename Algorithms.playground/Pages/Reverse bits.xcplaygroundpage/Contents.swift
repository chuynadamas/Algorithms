//: [Previous](@previous)

import Foundation


func reverseBits(_ n: Int) -> Int {
    var bits = 0
    var n = n
    
    for _ in 0..<32 {
        bits = bits << 1
        bits = bits | ( n & 1)
        n = n >> 1
    }
    return bits
}

let test = 0b00000010100101000001111010011100
reverseBits(test)

//: [Next](@next)
