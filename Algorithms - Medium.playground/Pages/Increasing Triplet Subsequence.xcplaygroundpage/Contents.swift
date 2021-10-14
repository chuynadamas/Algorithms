//: [Previous](@previous)

import Foundation

func increasingTriplet(_ nums: [Int]) -> Bool {
    guard nums.count >= 3 else {
        return false
    }
    
    var i = Int.max
    var j = Int.max
    
    for n in nums {
        if n <= i {
            i = n
        } else if n <= j {
            j = n
        } else {
            return true
        }
    }
    return false
}

//: [Next](@next)
