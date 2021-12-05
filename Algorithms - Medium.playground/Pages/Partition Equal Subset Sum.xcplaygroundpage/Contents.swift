//: [Previous](@previous)

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
