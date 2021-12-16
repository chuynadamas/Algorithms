//: [Previous](@previous)

/**
 Given an integer array nums and an integer k, return true if nums has a continuous subarray of size at least two whose elements sum up to a multiple of k, or false otherwise.

 An integer x is a multiple of k if there exists an integer n such that x = n * k. 0 is always a multiple of k
 
 Example 1:

 Input: nums = [23,2,4,6,7], k = 6
 Output: true
 Explanation: [2, 4] is a continuous subarray of size 2 whose elements sum up to 6.
 Example 2:

 Input: nums = [23,2,6,4,7], k = 6
 Output: true
 Explanation: [23, 2, 6, 4, 7] is an continuous subarray of size 5 whose elements sum up to 42.
 42 is a multiple of 6 because 42 = 7 * 6 and 7 is an integer.
 Example 3:

 Input: nums = [23,2,6,4,7], k = 13
 Output: false
  

 Constraints:

 1 <= nums.length <= 105
 0 <= nums[i] <= 109
 0 <= sum(nums[i]) <= 231 - 1
 1 <= k <= 231 - 1
 
 */

import Foundation

func checkSubarraySum(_ nums: [Int], _ k: Int) -> Bool {
    var sum: [Int] = [nums[0]]
    
    for i in 1..<nums.count {
        sum.append(sum[i-1] + nums[i])
        if sum[sum.count-1] % k == 0 {
            return true
        }
    }
    
    // (2 - 3) = sum(3 -1 ) - sum(2 - 1) = sum(2) - sum(1)
    
    for i in 1..<nums.count {
        for j in i+1..<nums.count {
            if (sum[j] - sum[i]) % k == 0 {
                return true
            }
        }
    }
    
    return false
}
//: [Next](@next)
