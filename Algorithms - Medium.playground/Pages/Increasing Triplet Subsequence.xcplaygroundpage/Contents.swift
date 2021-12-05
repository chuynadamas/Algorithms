//: [Previous](@previous)
/*
 
 Given an integer array nums, return true if there exists a triple of indices (i, j, k) such that i < j < k and nums[i] < nums[j] < nums[k]. If no such indices exists, return false.
 
 ```
 Input: nums = [1,2,3,4,5]
 Output: true
 Explanation: Any triplet where i < j < k is valid.
 ```
 */
import Foundation

func increasingTriplet(_ nums: [Int]) -> Bool {
    guard nums.count >= 3 else {
        return false
    }
    
    var i = Int.max
    var j = Int.max
    
    for n in nums {
        if n <= i {
            i = n
        } else if n <= j {
            j = n
        } else {
            return true
        }
    }
    return false
}

//: [Next](@next)
