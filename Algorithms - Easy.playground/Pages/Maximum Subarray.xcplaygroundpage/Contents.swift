//: [Previous](@previous)

import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    if nums.isEmpty { return 0 }
    var m = 0
    var result = Int.min
    
    for i in 0..<nums.count {
        //The current sum or the least number
        m = max(nums[i], nums[i] + m)
        //Save only if is bigger than previous
        result = max(result, m)
    }
    return result
}

maxSubArray([-2,1,-3,4,-1,2,1,-5,4])
//: [Next](@next)
