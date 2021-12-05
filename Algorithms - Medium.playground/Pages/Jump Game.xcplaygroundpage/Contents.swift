//: [Previous](@previous)
/*
 You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.

 Return true if you can reach the last index, or false otherwise.

  
```
 Example 1:

 Input: nums = [2,3,1,1,4]
 Output: true
 Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
 ```
 
 */


import Foundation

func canJump(_ nums: [Int]) -> Bool {
    var goal = nums.count - 1
    
    for currentPosition in (0..<nums.count-1).reversed() {
        if currentPosition + nums[currentPosition] >= goal {
            goal = currentPosition
        }
    }
    
    return goal == 0
}

canJump([2,3,1,0,4])

//: [Next](@next)
