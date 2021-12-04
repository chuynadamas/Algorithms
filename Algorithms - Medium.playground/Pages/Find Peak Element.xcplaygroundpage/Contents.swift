//: [Previous](@previous)

import Foundation

func findPeakElement(_ nums: [Int]) -> Int {
    var left = 0
    var right = nums.count - 1
    
    while left < right {
        
        var mid = left + (right - left)/2
        
        if nums[mid] < nums[mid+1] {
            left = mid + 1
        } else {
            right = mid
        }
    }
    
    return left
}


findPeakElement([1,2,3,1])
//: [Next](@next)
