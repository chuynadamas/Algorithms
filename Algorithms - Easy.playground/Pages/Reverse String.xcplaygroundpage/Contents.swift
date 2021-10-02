//: [Previous](@previous)

import Foundation

func reverseString(_ s: inout [Character]) {
    guard !s.isEmpty else {
        return
    }
    for index in 0..<s.count/2 {
        s.swapAt(index,(s.count-1)-index)
    }
}

var test : [Character] = ["h","e","l","l","o"]
reverseString(&test)

//: [Next](@next)
