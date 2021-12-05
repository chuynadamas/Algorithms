//: [Previous](@previous)
/*
 There is an integer array nums sorted in ascending order (with distinct values).

 Prior to being passed to your function, nums is possibly rotated at an unknown pivot index k (1 <= k < nums.length) such that the resulting array is [nums[k], nums[k+1], ..., nums[n-1], nums[0], nums[1], ..., nums[k-1]] (0-indexed). For example, [0,1,2,4,5,6,7] might be rotated at pivot index 3 and become [4,5,6,7,0,1,2].

 Given the array nums after the possible rotation and an integer target, return the index of target if it is in nums, or -1 if it is not in nums.

 You must write an algorithm with O(log n) runtime complexity.
 
 
 ```
 Example 1:

 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 ```
 
 */

import Foundation

func search(_ nums: [Int], _ target: Int) -> Int {
    var leftIndex = 0
    var rightIndex = nums.count-1
    var middleIndex = 0
    
    while leftIndex <= rightIndex {
        middleIndex = (leftIndex + rightIndex) / 2
        
        if target == nums[middleIndex] {
            return middleIndex
        }
        //sorted portion
        if nums[leftIndex] <= nums[middleIndex] {
            if target > nums[middleIndex] || target < nums[leftIndex] {
                //The number is between the right side
                leftIndex = middleIndex + 1
            } else {
                rightIndex = middleIndex - 1
            }
        } else {
            //rotated portion
            if target < nums[middleIndex] || target > nums[rightIndex]{
                //The number is between the left side
                rightIndex = middleIndex - 1
            } else {
                leftIndex = middleIndex + 1
            }
        }
    }

    return -1
}


search([4,5,6,7,0,1,2], 0)

//: [Next](@next)
