//: [Previous](@previous)

import Foundation

func removeDuplicates(_ nums: inout [Int]) -> Int {
    guard !nums.isEmpty else {
        return 0
    }
    var different_count = 0
    
    for index in 1..<nums.count {
        if nums[different_count] != nums[index] {
            //Different number do the magic
            different_count += 1
            nums[different_count] = nums[index]
        }
    }
    // The pointer is pointing to the latest position we need to increase one in order to solve it
    return different_count + 1
}

var test = [1,1,2]
removeDuplicates(&test)
print(test)
//: [Next](@next)
