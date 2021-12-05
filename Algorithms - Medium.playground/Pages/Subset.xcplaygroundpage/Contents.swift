//: [Previous](@previous)
/*
 Given an integer array nums of unique elements, return all possible subsets (the power set).

 The solution set must not contain duplicate subsets. Return the solution in any order.

  

 Example 1:

 Input: nums = [1,2,3]
 Output: [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
 Example 2:

 Input: nums = [0]
 Output: [[],[0]]
 */

import Foundation

func subsets(_ nums: [Int]) -> [[Int]] {
    
    func generateSubset(_ index: Int,
                        _ nums: [Int],
                        _ arr: inout [Int],
                        _ arrs: inout [[Int]]) {
        arrs.append(arr)
        
        for i in index..<nums.count {
            arr.append(nums[i])
            generateSubset(i+1, nums, &arr, &arrs)
            arr.removeLast()
        }
        
    }
    
    var arrs: [[Int]] = []
    var arr: [Int] = []
    
    generateSubset(0, nums, &arr, &arrs)
    return arrs
}


subsets([1,2,3,4,5])
//: [Next](@next)
