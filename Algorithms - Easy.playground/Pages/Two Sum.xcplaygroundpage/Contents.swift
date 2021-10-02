//: [Previous](@previous)

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var table : [Int : Int] = [:]
    for i in nums.indices {
        if  let j = table[nums[i]] {
            return [j,i]
        }
        table[target-nums[i]] = i
    }
    return []
}

twoSum([2,7,11,15],9)

//: [Next](@next)
