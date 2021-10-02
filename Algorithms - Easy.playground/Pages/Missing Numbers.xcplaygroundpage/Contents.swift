//: [Previous](@previous)

import Foundation

func missingNumber(_ nums: [Int]) -> Int {
    let sum = nums.reduce(0,+)
    let all = (nums.count*(nums.count+1))/2
    return all - sum
}

missingNumber([3,0,1])

//: [Next](@next)
