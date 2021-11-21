//: [Previous](@previous)

import Foundation

func findKthLargest(_ nums: [Int], _ k: Int) -> Int {
    var sortedNums = nums
    sortedNums.sort()
    return sortedNums[sortedNums.count-k]
}

//: [Next](@next)
