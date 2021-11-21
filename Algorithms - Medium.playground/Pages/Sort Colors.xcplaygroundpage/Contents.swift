//: [Previous](@previous)

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
