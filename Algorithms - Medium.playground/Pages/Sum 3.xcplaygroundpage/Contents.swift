//: [Previous](@previous)
/*
 Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

 Notice that the solution set must not contain duplicate triplets.
 
 ```
 Input: nums = [-1,0,1,2,-1,-4]
 Output: [[-1,-1,2],[-1,0,1]]
 ```
 
 */

import Foundation

func threeSum(_ nums: [Int]) -> [[Int]] {
    guard nums.count >= 3 else { return [] }
    let sorted = nums.sorted()
    var result : [[Int]] = []
    
    for i in 0..<sorted.count {
        if i != 0, sorted[i] == sorted[i-1] { continue }
        var j = i + 1
        var k = sorted.count-1
        while j < k {
            let sum = sorted[i] + sorted[j] + sorted[k]
            if sum == 0 {
                result.append([sorted[i], sorted[j], sorted[k]])
                j += 1
                while j < k, sorted[j] == sorted[j-1] {
                    j += 1
                }
            } else if sum < 0 {
                j += 1
            } else {
                k -= 1
            }
        }
    }
    return result
}


threeSum([-1,0,1,2,-1,-4])
//: [Next](@next)
