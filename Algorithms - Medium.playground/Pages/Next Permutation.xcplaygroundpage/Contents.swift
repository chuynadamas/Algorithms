//: [Previous](@previous)
/**
 Implement next permutation, which rearranges numbers into the lexicographically next greater permutation of numbers.

 If such an arrangement is not possible, it must rearrange it as the lowest possible order (i.e., sorted in ascending order).

 The replacement must be in place and use only constant extra memory.

  

 Example 1:

 Input: nums = [1,2,3]
 Output: [1,3,2]
 Example 2:

 Input: nums = [3,2,1]
 Output: [1,2,3]
 Example 3:

 Input: nums = [1,1,5]
 Output: [1,5,1]
 Example 4:

 Input: nums = [1]
 Output: [1]
 */

import Foundation

func nextPermutation(_ nums: inout [Int]) {
    
    let n = nums.count
    if n == 1 {
        return
    }
    
    var i = 1
    var lastInc = -1
    
    while i < n {
        if nums[i] > nums[i-1] {
            lastInc = i
        }
        i+=1
    }
    
    if lastInc == -1 {
        nums = nums.sorted()
        return
    }
    
    var mn = nums[lastInc]
    var index = lastInc
    
    //Finding a number between the range nums[lastInc-1] and nums[lastInc] to swap
    for i in lastInc..<n {
        if nums[i] > nums[lastInc-1] && nums[i] < nums[index] {
            index = i
        }
    }
    
    //print("The index is: \(index)")
    //print("The lastInc is: \(lastInc)")
    nums.swapAt(lastInc-1,index)
    nums = nums[..<lastInc] + nums[lastInc...].sorted()
}

//: [Next](@next)
