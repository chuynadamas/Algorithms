//: [Previous](@previous)
/*
 Given an array nums of size n, return the majority element.

 The majority element is the element that appears more than ⌊n / 2⌋ times. You may assume that the majority element always exists in the array.

  

 Example 1:

 Input: nums = [3,2,3]
 Output: 3
 */

import Foundation

func majorityElement(_ nums: [Int]) -> Int {
    var count = 0
    var candidate = nums[0]
    
    for index in 1..<nums.count {
        if candidate == nums[index] {
            count += 1
        } else {
            count -= 1
            if count <= 0 {
                candidate = nums[index]
                count = 1
            }
        }
    }
    
    return candidate
}

//: [Next](@next)
