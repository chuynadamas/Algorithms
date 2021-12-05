//: [Previous](@previous)
/*
 Given an integer array nums, return the length of the longest strictly increasing subsequence.

 A subsequence is a sequence that can be derived from an array by deleting some or no elements without changing the order of the remaining elements. For example, [3,6,2,7] is a subsequence of the array [0,3,1,6,2,2,7].

  

 Example 1:

 Input: nums = [10,9,2,5,3,7,101,18]
 Output: 4
 Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.
 
 */

import Foundation

func lengthOfLIS(_ nums: [Int]) -> Int {
     
     var LIS: [Int] = Array(repeating: 1, count: nums.count)
     
     for i in (0..<nums.count).reversed() {
         for j in i+1..<nums.count {
             if nums[i] < nums[j] {
                 LIS[i] = max(LIS[i], 1 + LIS[j])
             }
         }
     }
     
     return LIS.max()!
 }

//: [Next](@next)
