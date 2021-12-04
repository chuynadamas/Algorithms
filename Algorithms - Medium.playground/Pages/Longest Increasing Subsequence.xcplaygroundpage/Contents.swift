//: [Previous](@previous)

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
