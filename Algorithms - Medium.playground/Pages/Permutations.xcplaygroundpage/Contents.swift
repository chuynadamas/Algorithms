//: [Previous](@previous)

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
