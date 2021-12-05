//: [Previous](@previous)

/*
 Given an array nums with n objects colored red, white, or blue, sort them in-place so that objects of the same color are adjacent, with the colors in the order red, white, and blue.

 We will use the integers 0, 1, and 2 to represent the color red, white, and blue, respectively.

 You must solve this problem without using the library's sort function.
 
 ```
 Example 1:

 Input: nums = [2,0,2,1,1,0]
 Output: [0,0,1,1,2,2]
 ```
 */

import Foundation

func sortColors(_ nums: inout [Int]) {
    var zeros = 0
    var ones = 0
    var twos = 0
    
    for num in nums {
        if num == 0 {
            zeros += 1
        } else if num == 1 {
            ones += 1
        } else if num == 2 {
            twos += 1
        }
    }
    
    for index in 0..<nums.count {
        if zeros > 0 {
            nums[index] = 0
            zeros -= 1
        } else if ones > 0 {
            nums[index] = 1
            ones -= 1
        } else if twos > 0 {
            nums[index] = 2
            twos -= 1
        }
    }
}

var colors = [2,0,2,1,1,0]
sortColors(&colors)

//: [Next](@next)
