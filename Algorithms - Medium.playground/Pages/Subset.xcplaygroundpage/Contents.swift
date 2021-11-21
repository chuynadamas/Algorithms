//: [Previous](@previous)

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


subsets([1,2,3])
//: [Next](@next)
