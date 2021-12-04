//: [Previous](@previous)

import Foundation

func searchRange(_ nums: [Int], _ target: Int) -> [Int] {
    guard nums.count > 0 else {
           return [-1,-1]
       }

       let startIndex = findIndexNumber(nums,target)
       let endIndex = findIndexNumber(nums, target+1) - 1

       if startIndex <= endIndex {
           return [startIndex, endIndex]
       } else {
           return [-1, -1]
       }
}


func findIndexNumber(_ nums: [Int], _ target: Int) -> Int {
    var left = 0
    var right = nums.count-1
    var index = nums.count

    while left <= right {
        let mid = left + (right - left)/2
        if nums[mid] >= target {
            right = mid - 1
            index = mid
        } else {
            left = mid + 1
        }
    }

    return index
}

searchRange([1],
            1)

//: [Next](@next)
