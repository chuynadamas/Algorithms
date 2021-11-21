//: [Previous](@previous)

import Foundation

func canJump(_ nums: [Int]) -> Bool {
    var goal = nums.count - 1
    
    for currentPosition in (0..<nums.count-1).reversed() {
        if currentPosition + nums[currentPosition] >= goal {
            goal = currentPosition
        }
    }
    
    return goal == 0
}

canJump([2,3,1,0,4])

//: [Next](@next)
