//: [Previous](@previous)

import Foundation

func containsDuplicate(_ nums: [Int]) -> Bool {
    guard nums.count > 0 else {
        return false
    }
    
    var isDifferent : [Int : Bool] = [:]
    for i in 0..<nums.count {
        if isDifferent[nums[i]] == nil {
            isDifferent[nums[i]] = true
        } else {
            return true
        }
    }
    return false
}


containsDuplicate([1,2,3,1])

//: [Next](@next)
