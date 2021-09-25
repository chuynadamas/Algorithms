//: [Previous](@previous)

import Foundation

class Solution {
    private var origialArray : [Int] = []

    init(_ nums: [Int]) {
        origialArray = nums
    }
    
    /** Resets the array to its original configuration and return it. */
    func reset() -> [Int] {
        return origialArray
    }
    
    /** Returns a random shuffling of the array. */
    func shuffle() -> [Int] {
        var shuffledArray = origialArray
        for i in 0..<origialArray.count {
            let randomIndex = Int.random(in: 0..<origialArray.count-1)
            shuffledArray.swapAt(i, randomIndex)
        }
        return shuffledArray
    }
}

let obj = Solution([1,2,3])
let ret_1 = obj.reset
let ret_2 = obj.shuffle()

//: [Next](@next)
