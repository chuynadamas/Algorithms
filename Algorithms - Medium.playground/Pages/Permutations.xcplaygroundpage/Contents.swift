//: [Previous](@previous)
/*
 Given an array nums of distinct integers, return all the possible permutations. You can return the answer in any order.

  
```
 Example 1:

 Input: nums = [1,2,3]
 Output: [[1,2,3],[1,3,2],[2,1,3],[2,3,1],[3,1,2],[3,2,1]]
 ```
 */

import Foundation

func permute(_ nums: [Int]) -> [[Int]] {
    var result = [[Int]]()
    var nums = nums
    
    func backtrack(_ first: Int, _ nums: inout [Int], _ result: inout [[Int]]) {
        if first == nums.count {
            print(nums)
            result.append(nums)
            return
        }
        for index in first..<nums.count {
            nums.swapAt(first, index)
            backtrack(first+1, &nums, &result)
            nums.swapAt(first, index)
        }
    }
    
    backtrack(0, &nums, &result)
    return result
}

permute([1,2,3])

//: [Next](@next)
