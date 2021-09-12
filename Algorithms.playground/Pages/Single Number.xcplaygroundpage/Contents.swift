//: [Previous](@previous)

import Foundation

func singleNumber(_ nums: [Int]) -> Int {
    var xOR = 0
    for num in nums {
        xOR ^= num
    }
    return xOR
}

singleNumber([2,2,1])

//: [Next](@next)
