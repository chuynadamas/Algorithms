//: [Previous](@previous)
/*
 Given a non-empty array nums containing only positive integers, find if the array can be partitioned into two subsets such that the sum of elements in both subsets is equal.

  

 Example 1:

 Input: nums = [1,5,11,5]
 Output: true
 Explanation: The array can be partitioned as [1, 5, 5] and [11].
 
 */
import Foundation

func canPartition(_ nums: [Int]) -> Bool {
    
    let sum = nums.reduce(.zero, +)
    
    if sum % 2 != 0 {
        return false
    }
    
    let target = sum / 2
    var dp: Set<Int> = [0]
    
    for num in nums {
        var updateDP: Set<Int> = []
        for element in dp {
           if (element + num) == target {
               return true
           }
            updateDP.insert(element + num)
            updateDP.insert(element)
        }
        dp = updateDP
    }
    
    return false
}

//: [Next](@next)
