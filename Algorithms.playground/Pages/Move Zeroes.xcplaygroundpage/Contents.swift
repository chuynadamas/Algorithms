//: [Previous](@previous)

import Foundation

func moveZeroes(_ nums: inout [Int]) {
    var pointZero = 0
    
    for i in 0..<nums.count {
        if nums[i] != 0 {
            nums.swapAt(i, pointZero)
            pointZero += 1
        }
    }
}

var test = [0,1,0,3,12]
moveZeroes(&test)
//: [Next](@next)
